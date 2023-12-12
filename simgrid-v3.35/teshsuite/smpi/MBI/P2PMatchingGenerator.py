#! /usr/bin/python3
import os
import sys
import generator_utils as gen

template = """// @{generatedby}@
/* ///////////////////////// The MPI Bugs Initiative ////////////////////////

  Origin: MBI

  Description: @{shortdesc}@
    @{longdesc}@

  Version of MPI: Conforms to MPI 1.1, does not require MPI 2 implementation

BEGIN_MPI_FEATURES
  P2P!basic: @{p2pfeature}@
  P2P!nonblocking: @{ip2pfeature}@
  P2P!persistent: @{persfeature}@
  COLL!basic: Lacking
  COLL!nonblocking: Lacking
  COLL!persistent: Lacking
  COLL!tools: Lacking
  RMA: Lacking
END_MPI_FEATURES

BEGIN_MBI_TESTS
  $ mpirun -np 2 ${EXE}
  | @{outcome}@
  | @{errormsg}@
END_MBI_TESTS
//////////////////////       End of MBI headers        /////////////////// */

#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

#define buff_size 1

int main(int argc, char **argv) {
  int nprocs = -1;
  int rank = -1;
  int its_raining = 0;
  int src=0, dest=1;
  int stag=0, rtag=0;

  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  printf("Hello from rank %d \\n", rank);

  if (nprocs < 2)
    printf("MBI ERROR: This test needs at least 2 processes to produce a bug!\\n");

  MPI_Comm newcom = MPI_COMM_WORLD;
  MPI_Datatype type = MPI_INT;

  @{init1}@
  @{init2}@

  if (rank == 0) {
    @{operation1}@ /* MBIERROR1 */
    @{fini1}@
  }else if (@{change_cond}@){
    @{operation2}@ /* MBIERROR2 */
    @{fini2}@
  }

  @{free1}@
  @{free2}@

  MPI_Finalize();
  printf("Rank %d finished normally\\n", rank);
  return 0;
}
"""


for p in gen.send + gen.ssend + gen.bsend + gen.recv + gen.irecv + gen.isend:
    patterns = {}
    patterns = {'p': p}
    patterns['generatedby'] = f'DO NOT EDIT: this file was generated by {os.path.basename(sys.argv[0])}. DO NOT EDIT.'
    patterns['p2pfeature'] = 'Yes' if p in gen.send + gen.bsend + gen.ssend + gen.recv else 'Lacking'
    patterns['ip2pfeature'] = 'Yes' if p in gen.isend + gen.irecv else 'Lacking'
    patterns['persfeature'] = 'Lacking'
    # patterns['persfeature'] = 'Yes' if p in gen.psend + gen.precv else 'Lacking'
    patterns['p'] = p
    patterns['init1'] = gen.init[p]("1")
    patterns['init2'] = '' #gen.init[p2]("2")
    patterns['fini1'] = gen.fini[p]("1")
    patterns['fini2'] = '' #gen.fini[p2]("2")
    patterns['free1'] = gen.free[p]("1")
    patterns['free2'] = '' #gen.free[p]("2")
    patterns['operation1'] = gen.operation[p]("1")
    patterns['operation2'] = '' #gen.operation[p2]("2")
    patterns['change_cond'] = 'rank == 1'

    # Generate the incorrect matching with one call
    replace = patterns.copy()
    replace['shortdesc'] = 'Point to point @{p}@ is not matched'
    replace['longdesc'] = 'Process 0 calls @{p}@ and is not matched'
    replace['outcome'] = 'ERROR: CallMatching'
    replace['errormsg'] = 'P2P mistmatch. @{p}@ at @{filename}@:@{line:MBIERROR1}@ is not matched.'
    gen.make_file(template, f'CallOrdering_{p}_nok.c', replace)

    # Generate the incorrect matching with two calls
    replace = patterns.copy()
    replace['shortdesc'] = 'Both point to point @{p}@ are not matched'
    replace['longdesc'] = 'Processes 0 and 1 both call @{p}@ which are not matched'
    replace['outcome'] = 'ERROR: CallMatching'
    replace['errormsg'] = 'P2P mismatch. @{p}@ at @{filename}@:@{line:MBIERROR1}@ and @{p}@ at @{filename}@:@{line:MBIERROR2}@ are not matched.'
    replace['operation2'] = gen.operation[p]("1")
    replace['fini2'] = gen.fini[p]("1")
    #replace['free2'] = gen.free[p]("2")
    gen.make_file(template, f'CallOrdering_{p}_{p}_nok.c', replace)

for s in gen.send + gen.isend + gen.ssend + gen.bsend:
    for r in gen.recv + gen.irecv:
        patterns = {}
        patterns = {'s': s, 'r': r}
        patterns['generatedby'] = f'DO NOT EDIT: this file was generated by {os.path.basename(sys.argv[0])}. DO NOT EDIT.'
        patterns['p2pfeature'] = 'Yes' if s in gen.send or r in gen.recv else 'Lacking'
        patterns['ip2pfeature'] = 'Yes' if s in gen.isend or r in gen.irecv else 'Lacking'
        patterns['persfeature'] = 'Lacking'
        patterns['s'] = s
        patterns['r'] = r
        patterns['init1'] = gen.init[s]("1")
        patterns['init2'] = gen.init[r]("2")
        patterns['fini1'] = gen.fini[s]("1")
        patterns['fini2'] = gen.fini[r]("2")
        patterns['free1'] = gen.free[s]("1")
        patterns['free2'] = gen.free[r]("2")
        patterns['operation1'] = gen.operation[s]("1")
        patterns['operation2'] = gen.operation[r]("2")
        patterns['change_cond'] = '(rank == 1) && (its_raining)'

        # Generate the incorrect matching because of the conditional
        replace = patterns.copy()
        replace['shortdesc'] = 'Point to point @{r}@ is never called.'
        replace['longdesc'] = 'Point to point @{r}@ is never executed. Process 1 calls MPI_Finalize and causes a deadlock.'
        replace['outcome'] = 'ERROR: CallMatching'
        replace['errormsg'] = 'P2P mistmatch. @{r}@ at @{filename}@:@{line:MBIERROR2}@ is never called because of the conditional (@{change_cond}@).'
        replace['operation1'] = gen.operation[s]("1")
        replace['operation2'] = gen.operation[r]("2")
        gen.make_file(template, f'CallOrdering_{r}_{s}_nok.c', replace)
