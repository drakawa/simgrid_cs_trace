### define source packages

set(EXTRA_DIST
  src/3rd-party/catch.hpp
  src/3rd-party/xxhash.hpp
  src/bindings/python/simgrid_python.cpp
  src/dag/dax.dtd
  src/dag/dax_dtd.c
  src/dag/dax_dtd.h
  src/kernel/actor/Simcall.hpp
  src/kernel/resource/HostImpl.hpp
  src/kernel/resource/LinkImpl.hpp
  src/kernel/resource/NetworkModel.hpp
  src/kernel/resource/NetworkModelFactors.hpp
  src/kernel/resource/SplitDuplexLinkImpl.hpp
  src/kernel/resource/StandardLinkImpl.hpp
  src/kernel/resource/WifiLinkImpl.hpp
  src/kernel/resource/models/cpu_cas01.hpp
  src/kernel/resource/models/cpu_ti.hpp
  src/kernel/resource/models/disk_s19.hpp
  src/kernel/resource/models/host_clm03.hpp
  src/kernel/resource/models/network_cm02.hpp
  src/kernel/resource/models/network_constant.hpp
  src/kernel/resource/models/network_ib.hpp
  src/kernel/resource/models/network_ns3.hpp
  src/kernel/resource/models/ns3/ns3_simulator.hpp
  src/kernel/resource/models/ptask_L07.hpp

  src/mc/datatypes.h
  src/mc/mc.h
  src/mc/mc_mmu.hpp
  src/mc/mc_record.hpp

  src/simgrid/sg_config.hpp
  src/simgrid/math_utils.h

  src/smpi/colls/coll_tuned_topo.hpp
  src/smpi/colls/colls_private.hpp
  src/smpi/colls/smpi_mvapich2_selector_stampede.hpp
  src/smpi/include/private.hpp
  src/smpi/include/smpi_utils.hpp
  src/smpi/smpi_main.c
  src/smpi/smpi_replay_main.cpp
  src/kernel/xml/simgrid.dtd
  src/kernel/xml/simgrid_dtd.c
  src/kernel/xml/simgrid_dtd.h
  src/kernel/xml/platf_sax_cb.cpp

  src/xbt/coverage.h
  src/xbt/dict_private.h
  src/xbt/log_private.hpp
  src/xbt/mallocator_private.h
  src/xbt/parmap.hpp
  )

set(SMPI_SRC
  src/smpi/bindings/smpi_f77.cpp
  src/smpi/bindings/smpi_f77_coll.cpp
  src/smpi/bindings/smpi_f77_comm.cpp
  src/smpi/bindings/smpi_f77_file.cpp
  src/smpi/bindings/smpi_f77_request.cpp
  src/smpi/bindings/smpi_f77_type.cpp
  src/smpi/bindings/smpi_mpi.cpp
  src/smpi/bindings/smpi_pmpi.cpp
  src/smpi/bindings/smpi_pmpi_coll.cpp
  src/smpi/bindings/smpi_pmpi_comm.cpp
  src/smpi/bindings/smpi_pmpi_file.cpp
  src/smpi/bindings/smpi_pmpi_group.cpp
  src/smpi/bindings/smpi_pmpi_info.cpp
  src/smpi/bindings/smpi_pmpi_op.cpp
  src/smpi/bindings/smpi_pmpi_request.cpp
  src/smpi/bindings/smpi_pmpi_topo.cpp
  src/smpi/bindings/smpi_pmpi_type.cpp
  src/smpi/bindings/smpi_pmpi_win.cpp
  src/smpi/colls/allgather/allgather-2dmesh.cpp
  src/smpi/colls/allgather/allgather-3dmesh.cpp
  src/smpi/colls/allgather/allgather-GB.cpp
  src/smpi/colls/allgather/allgather-NTSLR-NB.cpp
  src/smpi/colls/allgather/allgather-NTSLR.cpp
  src/smpi/colls/allgather/allgather-SMP-NTS.cpp
  src/smpi/colls/allgather/allgather-bruck.cpp
  src/smpi/colls/allgather/allgather-loosely-lr.cpp
  src/smpi/colls/allgather/allgather-mvapich-smp.cpp
  src/smpi/colls/allgather/allgather-ompi-neighborexchange.cpp
  src/smpi/colls/allgather/allgather-pair.cpp
  src/smpi/colls/allgather/allgather-rdb.cpp
  src/smpi/colls/allgather/allgather-rhv.cpp
  src/smpi/colls/allgather/allgather-ring.cpp
  src/smpi/colls/allgather/allgather-smp-simple.cpp
  src/smpi/colls/allgather/allgather-spreading-simple.cpp
  src/smpi/colls/allgatherv/allgatherv-GB.cpp
  src/smpi/colls/allgatherv/allgatherv-mpich-rdb.cpp
  src/smpi/colls/allgatherv/allgatherv-mpich-ring.cpp
  src/smpi/colls/allgatherv/allgatherv-ompi-bruck.cpp
  src/smpi/colls/allgatherv/allgatherv-ompi-neighborexchange.cpp
  src/smpi/colls/allgatherv/allgatherv-pair.cpp
  src/smpi/colls/allgatherv/allgatherv-ring.cpp
  src/smpi/colls/allreduce/allreduce-lr.cpp
  src/smpi/colls/allreduce/allreduce-mvapich-rs.cpp
  src/smpi/colls/allreduce/allreduce-mvapich-two-level.cpp
  src/smpi/colls/allreduce/allreduce-ompi-ring-segmented.cpp
  src/smpi/colls/allreduce/allreduce-rab-rdb.cpp
  src/smpi/colls/allreduce/allreduce-rab1.cpp
  src/smpi/colls/allreduce/allreduce-rab2.cpp
  src/smpi/colls/allreduce/allreduce-rdb.cpp
  src/smpi/colls/allreduce/allreduce-redbcast.cpp
  src/smpi/colls/allreduce/allreduce-smp-binomial-pipeline.cpp
  src/smpi/colls/allreduce/allreduce-smp-binomial.cpp
  src/smpi/colls/allreduce/allreduce-smp-rdb.cpp
  src/smpi/colls/allreduce/allreduce-smp-rsag-lr.cpp
  src/smpi/colls/allreduce/allreduce-smp-rsag-rab.cpp
  src/smpi/colls/allreduce/allreduce-smp-rsag.cpp
  src/smpi/colls/alltoall/alltoall-2dmesh.cpp
  src/smpi/colls/alltoall/alltoall-3dmesh.cpp
  src/smpi/colls/alltoall/alltoall-basic-linear.cpp
  src/smpi/colls/alltoall/alltoall-bruck.cpp
  src/smpi/colls/alltoall/alltoall-mvapich-scatter-dest.cpp
  src/smpi/colls/alltoall/alltoall-pair-light-barrier.cpp
  src/smpi/colls/alltoall/alltoall-pair-mpi-barrier.cpp
  src/smpi/colls/alltoall/alltoall-pair-one-barrier.cpp
  src/smpi/colls/alltoall/alltoall-pair.cpp
  src/smpi/colls/alltoall/alltoall-rdb.cpp
  src/smpi/colls/alltoall/alltoall-ring-light-barrier.cpp
  src/smpi/colls/alltoall/alltoall-ring-mpi-barrier.cpp
  src/smpi/colls/alltoall/alltoall-ring-one-barrier.cpp
  src/smpi/colls/alltoall/alltoall-ring.cpp
  src/smpi/colls/alltoallv/alltoallv-bruck.cpp
  src/smpi/colls/alltoallv/alltoallv-ompi-basic-linear.cpp
  src/smpi/colls/alltoallv/alltoallv-pair-light-barrier.cpp
  src/smpi/colls/alltoallv/alltoallv-pair-mpi-barrier.cpp
  src/smpi/colls/alltoallv/alltoallv-pair-one-barrier.cpp
  src/smpi/colls/alltoallv/alltoallv-pair.cpp
  src/smpi/colls/alltoallv/alltoallv-ring-light-barrier.cpp
  src/smpi/colls/alltoallv/alltoallv-ring-mpi-barrier.cpp
  src/smpi/colls/alltoallv/alltoallv-ring-one-barrier.cpp
  src/smpi/colls/alltoallv/alltoallv-ring.cpp
  src/smpi/colls/barrier/barrier-mpich-smp.cpp
  src/smpi/colls/barrier/barrier-mvapich2-pair.cpp
  src/smpi/colls/barrier/barrier-ompi.cpp
  src/smpi/colls/bcast/bcast-NTSB.cpp
  src/smpi/colls/bcast/bcast-NTSL-Isend.cpp
  src/smpi/colls/bcast/bcast-NTSL.cpp
  src/smpi/colls/bcast/bcast-SMP-binary.cpp
  src/smpi/colls/bcast/bcast-SMP-binomial.cpp
  src/smpi/colls/bcast/bcast-SMP-linear.cpp
  src/smpi/colls/bcast/bcast-arrival-pattern-aware-wait.cpp
  src/smpi/colls/bcast/bcast-arrival-pattern-aware.cpp
  src/smpi/colls/bcast/bcast-arrival-scatter.cpp
  src/smpi/colls/bcast/bcast-binomial-tree.cpp
  src/smpi/colls/bcast/bcast-flattree-pipeline.cpp
  src/smpi/colls/bcast/bcast-flattree.cpp
  src/smpi/colls/bcast/bcast-mvapich-smp.cpp
  src/smpi/colls/bcast/bcast-ompi-pipeline.cpp
  src/smpi/colls/bcast/bcast-ompi-split-bintree.cpp
  src/smpi/colls/bcast/bcast-scatter-LR-allgather.cpp
  src/smpi/colls/bcast/bcast-scatter-rdb-allgather.cpp
  src/smpi/colls/coll_tuned_topo.cpp
  src/smpi/colls/colls_global.cpp
  src/smpi/colls/gather/gather-mvapich.cpp
  src/smpi/colls/gather/gather-ompi.cpp
  src/smpi/colls/reduce/reduce-NTSL.cpp
  src/smpi/colls/reduce/reduce-arrival-pattern-aware.cpp
  src/smpi/colls/reduce/reduce-binomial.cpp
  src/smpi/colls/reduce/reduce-flat-tree.cpp
  src/smpi/colls/reduce/reduce-mvapich-knomial.cpp
  src/smpi/colls/reduce/reduce-mvapich-two-level.cpp
  src/smpi/colls/reduce/reduce-ompi.cpp
  src/smpi/colls/reduce/reduce-rab.cpp
  src/smpi/colls/reduce/reduce-scatter-gather.cpp
  src/smpi/colls/reduce_scatter/reduce_scatter-mpich.cpp
  src/smpi/colls/reduce_scatter/reduce_scatter-ompi.cpp
  src/smpi/colls/scatter/scatter-mvapich-two-level.cpp
  src/smpi/colls/scatter/scatter-ompi.cpp
  src/smpi/colls/smpi_automatic_selector.cpp
  src/smpi/colls/smpi_coll.cpp
  src/smpi/colls/smpi_default_selector.cpp
  src/smpi/colls/smpi_intel_mpi_selector.cpp
  src/smpi/colls/smpi_mpich_selector.cpp
  src/smpi/colls/smpi_mvapich2_selector.cpp
  src/smpi/colls/smpi_nbc_impl.cpp
  src/smpi/colls/smpi_openmpi_selector.cpp
  src/smpi/include/smpi_actor.hpp
  src/smpi/include/smpi_coll.hpp
  src/smpi/include/smpi_comm.hpp
  src/smpi/include/smpi_config.hpp
  src/smpi/include/smpi_datatype.hpp
  src/smpi/include/smpi_datatype_derived.hpp
  src/smpi/include/smpi_errhandler.hpp
  src/smpi/include/smpi_f2c.hpp
  src/smpi/include/smpi_file.hpp
  src/smpi/include/smpi_group.hpp
  src/smpi/include/smpi_host.hpp
  src/smpi/include/smpi_info.hpp
  src/smpi/include/smpi_keyvals.hpp
  src/smpi/include/smpi_op.hpp
  src/smpi/include/smpi_replay.hpp
  src/smpi/include/smpi_request.hpp
  src/smpi/include/smpi_status.hpp
  src/smpi/include/smpi_topo.hpp
  src/smpi/include/smpi_win.hpp
  src/smpi/internals/instr_smpi.cpp
  src/smpi/internals/smpi_actor.cpp
  src/smpi/internals/smpi_bench.cpp
  src/smpi/internals/smpi_config.cpp
  src/smpi/internals/smpi_deployment.cpp
  src/smpi/internals/smpi_global.cpp
  src/smpi/internals/smpi_host.cpp
  src/smpi/internals/smpi_memory.cpp
  src/smpi/internals/smpi_replay.cpp
  src/smpi/internals/smpi_shared.cpp
  src/smpi/internals/smpi_utils.cpp
  src/smpi/mpi/smpi_comm.cpp
  src/smpi/mpi/smpi_datatype.cpp
  src/smpi/mpi/smpi_datatype_derived.cpp
  src/smpi/mpi/smpi_errhandler.cpp
  src/smpi/mpi/smpi_f2c.cpp
  src/smpi/mpi/smpi_file.cpp
  src/smpi/mpi/smpi_group.cpp
  src/smpi/mpi/smpi_info.cpp
  src/smpi/mpi/smpi_keyvals.cpp
  src/smpi/mpi/smpi_op.cpp
  src/smpi/mpi/smpi_request.cpp
  src/smpi/mpi/smpi_status.cpp
  src/smpi/mpi/smpi_topo.cpp
  src/smpi/mpi/smpi_win.cpp
  src/smpi/plugins/ampi/ampi.cpp
  src/smpi/plugins/ampi/ampi.hpp
  src/smpi/plugins/ampi/instr_ampi.cpp
  src/smpi/plugins/ampi/instr_ampi.hpp
  src/kernel/resource/models/network_ib.cpp
  )
set(STHREAD_SRC
  src/sthread/sthread_impl.cpp
  src/sthread/sthread.c
  src/sthread/sthread.h
  src/sthread/ObjectAccess.cpp
)

set(XBT_SRC
  src/xbt/OsSemaphore.hpp
  src/xbt/PropertyHolder.cpp
  src/xbt/backtrace.cpp
  src/xbt/config.cpp
  src/xbt/dict.cpp
  src/xbt/dict_cursor.c
  src/xbt/dict_elm.c
  src/xbt/dynar.cpp
  src/xbt/exception.cpp
  src/xbt/graph.c
  src/xbt/log.cpp
  src/xbt/mallocator.c
  src/xbt/memory_map.cpp
  src/xbt/memory_map.hpp
  src/xbt/parmap.cpp
  src/xbt/random.cpp
  src/xbt/snprintf.c
  src/xbt/string.cpp
  src/xbt/xbt_log_appender_file.cpp
  src/xbt/xbt_log_layout_format.cpp
  src/xbt/xbt_log_layout_simple.cpp
  src/xbt/xbt_misc.cpp
  src/xbt/xbt_os_file.cpp
  src/xbt/xbt_os_time.c
  src/xbt/xbt_parse_units.cpp
  src/xbt/xbt_replay.cpp
  src/xbt/xbt_str.cpp
  src/xbt/utils/iter/iterator_wrapping.hpp
  src/xbt/utils/iter/subsets.hpp
  src/xbt/utils/iter/powerset.hpp
  src/xbt/utils/iter/variable_for_loop.hpp
  src/xbt/utils/iter/LazyKSubsets.hpp
  src/xbt/utils/iter/LazyPowerset.hpp
  )

set(NS3_SRC
  src/kernel/resource/models/network_ns3.cpp
  src/kernel/resource/models/ns3/ns3_simulator.cpp
  )

set(KERNEL_SRC
  src/kernel/EngineImpl.cpp
  src/kernel/EngineImpl.hpp

  src/kernel/activity/ActivityImpl.cpp
  src/kernel/activity/ActivityImpl.hpp
  src/kernel/activity/BarrierImpl.cpp
  src/kernel/activity/BarrierImpl.hpp
  src/kernel/activity/CommImpl.cpp
  src/kernel/activity/CommImpl.hpp
  src/kernel/activity/ConditionVariableImpl.cpp
  src/kernel/activity/ConditionVariableImpl.hpp
  src/kernel/activity/ExecImpl.cpp
  src/kernel/activity/ExecImpl.hpp
  src/kernel/activity/IoImpl.cpp
  src/kernel/activity/IoImpl.hpp
  src/kernel/activity/MailboxImpl.cpp
  src/kernel/activity/MailboxImpl.hpp
  src/kernel/activity/MessImpl.cpp
  src/kernel/activity/MessImpl.hpp
  src/kernel/activity/MessageQueueImpl.cpp
  src/kernel/activity/MessageQueueImpl.hpp
  src/kernel/activity/MutexImpl.cpp
  src/kernel/activity/MutexImpl.hpp
  src/kernel/activity/SemaphoreImpl.cpp
  src/kernel/activity/SemaphoreImpl.hpp
  src/kernel/activity/SleepImpl.cpp
  src/kernel/activity/SleepImpl.hpp
  src/kernel/activity/Synchro.cpp
  src/kernel/activity/Synchro.hpp

  src/kernel/actor/ActorImpl.cpp
  src/kernel/actor/ActorImpl.hpp
  src/kernel/actor/CommObserver.cpp
  src/kernel/actor/CommObserver.hpp
  src/kernel/actor/Simcall.cpp
  src/kernel/actor/SimcallObserver.cpp
  src/kernel/actor/SimcallObserver.hpp
  src/kernel/actor/SynchroObserver.cpp
  src/kernel/actor/SynchroObserver.hpp

  src/kernel/context/Context.cpp
  src/kernel/context/Context.hpp
  src/kernel/context/ContextRaw.cpp
  src/kernel/context/ContextRaw.hpp
  src/kernel/context/ContextSwapped.cpp
  src/kernel/context/ContextSwapped.hpp
  src/kernel/context/ContextThread.cpp
  src/kernel/context/ContextThread.hpp

  src/kernel/lmm/System.cpp
  src/kernel/lmm/System.hpp
  src/kernel/lmm/fair_bottleneck.cpp
  src/kernel/lmm/fair_bottleneck.hpp
  src/kernel/lmm/maxmin.cpp
  src/kernel/lmm/maxmin.hpp

  src/kernel/resource/Action.cpp
  src/kernel/resource/CpuImpl.cpp
  src/kernel/resource/CpuImpl.hpp
  src/kernel/resource/DiskImpl.cpp
  src/kernel/resource/DiskImpl.hpp
  src/kernel/resource/FactorSet.cpp
  src/kernel/resource/FactorSet.hpp
  src/kernel/resource/HostImpl.cpp
  src/kernel/resource/Model.cpp
  src/kernel/resource/NetworkModel.cpp
  src/kernel/resource/NetworkModelFactors.cpp
  src/kernel/resource/Resource.hpp
  src/kernel/resource/SplitDuplexLinkImpl.cpp
  src/kernel/resource/StandardLinkImpl.cpp
  src/kernel/resource/VirtualMachineImpl.cpp
  src/kernel/resource/VirtualMachineImpl.hpp
  src/kernel/resource/WifiLinkImpl.cpp

  src/kernel/resource/models/cpu_cas01.cpp
  src/kernel/resource/models/cpu_ti.cpp
  src/kernel/resource/models/disk_s19.cpp
  src/kernel/resource/models/host_clm03.cpp
  src/kernel/resource/models/network_cm02.cpp
  src/kernel/resource/models/network_constant.cpp
  src/kernel/resource/models/ptask_L07.cpp

  src/kernel/resource/profile/Event.hpp
  src/kernel/resource/profile/FutureEvtSet.cpp
  src/kernel/resource/profile/FutureEvtSet.hpp
  src/kernel/resource/profile/Profile.cpp
  src/kernel/resource/profile/Profile.hpp
  src/kernel/resource/profile/ProfileBuilder.cpp
  src/kernel/resource/profile/StochasticDatedValue.cpp
  src/kernel/resource/profile/StochasticDatedValue.hpp

  src/kernel/routing/ClusterZone.cpp
  src/kernel/routing/DijkstraZone.cpp
  src/kernel/routing/DragonflyZone.cpp
  src/kernel/routing/EmptyZone.cpp
  src/kernel/routing/FatTreeZone.cpp
  src/kernel/routing/FloydZone.cpp
  src/kernel/routing/FullZone.cpp
  src/kernel/routing/NetPoint.cpp
  src/kernel/routing/NetZoneImpl.cpp
  src/kernel/routing/RoutedZone.cpp
  src/kernel/routing/StarZone.cpp
  src/kernel/routing/TorusZone.cpp
  src/kernel/routing/VivaldiZone.cpp
  src/kernel/routing/WifiZone.cpp

  src/kernel/timer/Timer.cpp

  src/kernel/xml/platf.hpp
  src/kernel/xml/platf_private.hpp
  src/kernel/xml/sg_platf.cpp
  src/kernel/xml/platf_sax_cb.cpp
  )
if (Eigen3_FOUND)
  set(KERNEL_SRC
    ${KERNEL_SRC}
    src/kernel/lmm/bmf.cpp
    src/kernel/lmm/bmf.hpp)
else()
  set(EXTRA_DIST
    ${EXTRA_DIST}
    src/kernel/lmm/bmf.cpp
    src/kernel/lmm/bmf.hpp)
endif()
# Boost context may not be available
if (HAVE_BOOST_CONTEXTS)
  set(KERNEL_SRC
      ${KERNEL_SRC}
      src/kernel/context/ContextBoost.cpp
      src/kernel/context/ContextBoost.hpp)
else()
  set(EXTRA_DIST
      ${EXTRA_DIST}
      src/kernel/context/ContextBoost.cpp
      src/kernel/context/ContextBoost.hpp)
endif()

set(PLUGINS_SRC
  src/plugins/ProducerConsumer.cpp
  src/plugins/chaos_monkey.cpp
  src/plugins/file_system/s4u_FileSystem.cpp
  src/plugins/host_dvfs.cpp
  src/plugins/host_energy.cpp
  src/plugins/host_load.cpp
  src/plugins/jbod.cpp
  src/plugins/link_energy.cpp
  src/plugins/link_energy_wifi.cpp
  src/plugins/link_load.cpp
  src/plugins/vm/VmLiveMigration.cpp
  src/plugins/vm/VmLiveMigration.hpp
  src/plugins/vm/dirty_page_tracking.cpp
  src/plugins/battery.cpp
  src/plugins/chiller.cpp
  src/plugins/solar_panel.cpp
  )


set(S4U_SRC
  src/s4u/s4u_Activity.cpp
  src/s4u/s4u_ActivitySet.cpp
  src/s4u/s4u_Actor.cpp
  src/s4u/s4u_Barrier.cpp
  src/s4u/s4u_Comm.cpp
  src/s4u/s4u_ConditionVariable.cpp
  src/s4u/s4u_Disk.cpp
  src/s4u/s4u_Engine.cpp
  src/s4u/s4u_Exec.cpp
  src/s4u/s4u_Host.cpp
  src/s4u/s4u_Io.cpp
  src/s4u/s4u_Link.cpp
  src/s4u/s4u_Mailbox.cpp
  src/s4u/s4u_Mess.cpp
  src/s4u/s4u_MessageQueue.cpp
  src/s4u/s4u_Mutex.cpp
  src/s4u/s4u_Netzone.cpp
  src/s4u/s4u_Semaphore.cpp
  src/s4u/s4u_Task.cpp
  src/s4u/s4u_VirtualMachine.cpp
)

set(SIMGRID_SRC
  src/simgrid/Exception.cpp
  src/simgrid/module.cpp
  src/simgrid/module.hpp
  src/simgrid/sg_config.cpp
  src/simgrid/sg_version.cpp
  src/simgrid/util.hpp
  )

set(DAG_SRC
  src/dag/loaders.cpp
  )

set(TRACING_SRC
  src/instr/instr_config.cpp
  src/instr/instr_interface.cpp
  src/instr/instr_paje_containers.cpp
  src/instr/instr_paje_containers.hpp
  src/instr/instr_paje_events.cpp
  src/instr/instr_paje_events.hpp
  src/instr/instr_paje_header.cpp
  src/instr/instr_paje_trace.cpp
  src/instr/instr_paje_types.cpp
  src/instr/instr_paje_types.hpp
  src/instr/instr_paje_values.hpp
  src/instr/instr_platform.cpp
  src/instr/instr_private.hpp
  src/instr/instr_resource_utilization.cpp
  src/instr/instr_smpi.hpp
  )

set(MC_SRC_BASE
  src/mc/mc_base.cpp
  src/mc/mc_base.hpp
  src/mc/mc_client_api.cpp
  src/mc/mc_config.cpp
  src/mc/mc_config.hpp
  src/mc/mc_global.cpp
  src/mc/mc_record.cpp
  src/mc/mc_record.hpp
  src/mc/mc_replay.hpp
  src/mc/transition/Transition.cpp
  )

set(MC_SRC_STATELESS
  src/mc/api/ActorState.hpp
  src/mc/api/ClockVector.cpp
  src/mc/api/ClockVector.hpp
  src/mc/api/State.cpp
  src/mc/api/State.hpp
  src/mc/api/RemoteApp.cpp
  src/mc/api/RemoteApp.hpp

  src/mc/explo/DFSExplorer.cpp
  src/mc/explo/DFSExplorer.hpp
  src/mc/explo/Exploration.cpp
  src/mc/explo/Exploration.hpp
  src/mc/explo/CommunicationDeterminismChecker.cpp

  src/mc/explo/UdporChecker.cpp
  src/mc/explo/UdporChecker.hpp

  src/mc/explo/udpor/Comb.hpp
  src/mc/explo/udpor/Configuration.hpp
  src/mc/explo/udpor/Configuration.cpp
  src/mc/explo/udpor/EventSet.cpp
  src/mc/explo/udpor/EventSet.hpp
  src/mc/explo/udpor/ExtensionSetCalculator.cpp
  src/mc/explo/udpor/ExtensionSetCalculator.hpp
  src/mc/explo/udpor/History.cpp
  src/mc/explo/udpor/History.hpp
  src/mc/explo/udpor/maximal_subsets_iterator.cpp
  src/mc/explo/udpor/maximal_subsets_iterator.hpp
  src/mc/explo/udpor/UnfoldingEvent.cpp
  src/mc/explo/udpor/UnfoldingEvent.hpp
  src/mc/explo/udpor/Unfolding.cpp
  src/mc/explo/udpor/Unfolding.hpp
  src/mc/explo/udpor/udpor_forward.hpp
  src/mc/explo/udpor/udpor_tests_private.hpp

  src/mc/explo/odpor/Execution.cpp
  src/mc/explo/odpor/Execution.hpp
  src/mc/explo/odpor/WakeupTree.cpp
  src/mc/explo/odpor/WakeupTree.hpp
  src/mc/explo/odpor/WakeupTreeIterator.cpp
  src/mc/explo/odpor/WakeupTreeIterator.hpp
  src/mc/explo/odpor/odpor_forward.hpp
  src/mc/explo/odpor/odpor_tests_private.hpp

  src/mc/remote/AppSide.cpp
  src/mc/remote/AppSide.hpp
  src/mc/remote/Channel.cpp
  src/mc/remote/Channel.hpp
  src/mc/remote/CheckerSide.cpp
  src/mc/remote/CheckerSide.hpp
  src/mc/remote/RemotePtr.hpp
  src/mc/remote/mc_protocol.h

  src/mc/transition/Transition.hpp
  src/mc/transition/TransitionActor.cpp
  src/mc/transition/TransitionActor.hpp
  src/mc/transition/TransitionAny.cpp
  src/mc/transition/TransitionAny.hpp
  src/mc/transition/TransitionComm.cpp
  src/mc/transition/TransitionComm.hpp
  src/mc/transition/TransitionObjectAccess.cpp
  src/mc/transition/TransitionObjectAccess.hpp
  src/mc/transition/TransitionRandom.cpp
  src/mc/transition/TransitionRandom.hpp
  src/mc/transition/TransitionSynchro.cpp
  src/mc/transition/TransitionSynchro.hpp

  src/mc/mc_environ.h
  src/mc/mc_exit.hpp
  src/mc/mc_forward.hpp
  src/mc/mc_private.hpp
  src/mc/mc_record.cpp

  src/mc/api/strategy/BasicStrategy.hpp
  src/mc/api/strategy/MaxMatchComm.hpp
  src/mc/api/strategy/MinMatchComm.hpp
  src/mc/api/strategy/Strategy.hpp
  src/mc/api/strategy/UniformStrategy.hpp
  )

set(MC_SIMGRID_MC_SRC  src/mc/explo/simgrid_mc.cpp)

set(headers_to_install
  include/simgrid/actor.h
  include/simgrid/activity_set.h
  include/simgrid/barrier.h
  include/simgrid/comm.h
  include/simgrid/engine.h
  include/simgrid/exec.h
  include/simgrid/Exception.hpp
  include/simgrid/chrono.hpp
  include/simgrid/plugins/battery.hpp
  include/simgrid/plugins/chiller.hpp
  include/simgrid/plugins/dvfs.h
  include/simgrid/plugins/energy.h
  include/simgrid/plugins/file_system.h
  include/simgrid/plugins/jbod.hpp
  include/simgrid/plugins/live_migration.h
  include/simgrid/plugins/load.h
  include/simgrid/plugins/solar_panel.hpp
  include/simgrid/plugins/ProducerConsumer.hpp
  include/simgrid/instr.h
  include/simgrid/mailbox.h
  include/simgrid/modelchecker.h
  include/simgrid/forward.h
  include/simgrid/simix.hpp
  include/simgrid/kernel/ProfileBuilder.hpp
  include/simgrid/kernel/Timer.hpp
  include/simgrid/disk.h
  include/simgrid/host.h
  include/simgrid/link.h
  include/simgrid/cond.h
  include/simgrid/mutex.h
  include/simgrid/semaphore.h
  include/simgrid/vm.h
  include/simgrid/zone.h
  include/simgrid/s4u/Activity.hpp
  include/simgrid/s4u/ActivitySet.hpp
  include/simgrid/s4u/Actor.hpp
  include/simgrid/s4u/Barrier.hpp
  include/simgrid/s4u/Comm.hpp
  include/simgrid/s4u/ConditionVariable.hpp
  include/simgrid/s4u/Disk.hpp
  include/simgrid/s4u/Engine.hpp
  include/simgrid/s4u/Exec.hpp
  include/simgrid/s4u/Host.hpp
  include/simgrid/s4u/Io.hpp
  include/simgrid/s4u/Link.hpp
  include/simgrid/s4u/Mailbox.hpp
  include/simgrid/s4u/MessageQueue.hpp
  include/simgrid/s4u/Mess.hpp
  include/simgrid/s4u/Mutex.hpp
  include/simgrid/s4u/NetZone.hpp
  include/simgrid/s4u/Semaphore.hpp
  include/simgrid/s4u/Task.hpp
  include/simgrid/s4u/VirtualMachine.hpp
  include/simgrid/s4u.hpp

  include/simgrid/kernel/resource/Action.hpp
  include/simgrid/kernel/resource/Model.hpp

  include/simgrid/kernel/routing/ClusterZone.hpp
  include/simgrid/kernel/routing/DijkstraZone.hpp
  include/simgrid/kernel/routing/DragonflyZone.hpp
  include/simgrid/kernel/routing/EmptyZone.hpp
  include/simgrid/kernel/routing/FatTreeZone.hpp
  include/simgrid/kernel/routing/FloydZone.hpp
  include/simgrid/kernel/routing/FullZone.hpp
  include/simgrid/kernel/routing/NetPoint.hpp
  include/simgrid/kernel/routing/NetZoneImpl.hpp
  include/simgrid/kernel/routing/RoutedZone.hpp
  include/simgrid/kernel/routing/StarZone.hpp
  include/simgrid/kernel/routing/TorusZone.hpp
  include/simgrid/kernel/routing/VivaldiZone.hpp
  include/simgrid/kernel/routing/WifiZone.hpp

  include/smpi/mpi.h
  include/smpi/sampi.h
  include/smpi/smpi.h
  include/smpi/smpi_helpers.h
  include/smpi/smpi_helpers_internal.h
  include/smpi/smpi_extended_traces.h
  include/smpi/smpi_extended_traces_fortran.h
  include/smpi/forward.hpp
  include/xbt.h
  include/xbt/asserts.h
  include/xbt/asserts.hpp
  include/xbt/backtrace.hpp
  include/xbt/base.h
  include/xbt/config.h
  include/xbt/config.hpp
  include/xbt/dict.h
  include/xbt/dynar.h
  include/xbt/ex.h
  include/xbt/Extendable.hpp
  include/xbt/file.hpp
  include/xbt/functional.hpp
  include/xbt/function_types.h
  include/xbt/graph.h
  include/xbt/log.h
  include/xbt/log.hpp
  include/xbt/mallocator.h
  include/xbt/misc.h
  include/xbt/module.h
  include/xbt/PropertyHolder.hpp
  include/xbt/parmap.h
  include/xbt/parse_units.hpp
  include/xbt/promise.hpp
  include/xbt/range.hpp
  include/xbt/random.hpp
  include/xbt/replay.hpp
  include/xbt/signal.hpp
  include/xbt/str.h
  include/xbt/string.hpp
  include/xbt/sysdep.h
  include/xbt/system_error.hpp
  include/xbt/utility.hpp
  include/xbt/virtu.h
  include/xbt/xbt_os_time.h
  )
set(source_of_generated_headers
  include/simgrid/config.h.in
  include/simgrid/version.h.in
  src/internal_config.h.in
  include/smpi/mpif.h.in)

### depend of some variables set upper
if(${HAVE_UCONTEXT_CONTEXTS}) #ucontext
  set(KERNEL_SRC  ${KERNEL_SRC} src/kernel/context/ContextUnix.hpp
                                src/kernel/context/ContextUnix.cpp)
else() # NOT ucontext
  set(EXTRA_DIST  ${EXTRA_DIST} src/kernel/context/ContextUnix.hpp
                                src/kernel/context/ContextUnix.cpp)
endif()

### SimGrid Lib sources
set(simgrid_sources
  ${S4U_SRC}
  ${SIMGRID_SRC}
  ${MC_SRC_BASE}
  ${KERNEL_SRC}
  ${TRACING_SRC}
  ${XBT_SRC}
  ${PLUGINS_SRC}
  ${DAG_SRC}
  )

if(enable_smpi)
  set(simgrid_sources  ${simgrid_sources}  ${SMPI_SRC})
endif()

if(SIMGRID_HAVE_MC)
  set(simgrid_sources  ${simgrid_sources}  ${MC_SRC_STATELESS})
endif()
set(EXTRA_DIST ${EXTRA_DIST} ${MC_SRC_STATELESS})

if(SIMGRID_HAVE_NS3)
  set(headers_to_install ${headers_to_install} include/simgrid/plugins/ns3.hpp)

  set(simgrid_sources  ${simgrid_sources}  ${NS3_SRC})
else()
  set(EXTRA_DIST ${EXTRA_DIST} include/simgrid/plugins/ns3.hpp)
endif()

set(DOC_SOURCES
  doc/doxygen/FAQ.doc
  doc/doxygen/inside_extending.doc
  doc/doxygen/inside_release.doc
  doc/doxygen/outcomes_vizu.doc
  doc/doxygen/uhood.doc
  doc/doxygen/uhood_switch.doc

  examples/README.rst

  docs/manpages/smpicc.1
  docs/manpages/smpicxx.1
  docs/manpages/smpif90.1
  docs/manpages/smpiff.1
  docs/manpages/smpirun.1
  docs/manpages/tesh.pod

  docs/Build.sh
  docs/README.md
  docs/bin/extract_logs_hierarchy.pl
  docs/requirements.txt
  docs/source/conf.py
  docs/source/Doxyfile
  docs/find-missing.ignore
  docs/find-missing.py
  docs/source/_ext/showfile.css
  docs/source/_ext/showfile.js
  docs/source/_ext/showfile.py
  docs/source/_static/css/custom.css
  docs/source/_templates/breadcrumbs.html

  docs/source/img/design-scheduling-parallel.svg
  docs/source/img/design-scheduling-simulatedtime.svg
  docs/source/img/design-scheduling-wallclock.svg
  docs/source/img/eclipseScreenShot.png
  docs/source/img/extlink.png
  docs/source/img/extlink.svg
  docs/source/img/graphical-toc.svg
  docs/source/img/lmm-overview.svg
  docs/source/img/plugin-energy.svg
  docs/source/img/smpi_simgrid_alltoall_pair_16.png
  docs/source/img/smpi_simgrid_alltoall_ring_16.png
  docs/source/img/starzone.drawio
  docs/source/img/starzone.svg
  docs/source/img/vivaldi.svg
  docs/source/img/zone_hierarchy.png
  docs/source/img/zone_tree.drawio
  docs/source/img/zone_tree.svg
  docs/source/img/zoom_comm.drawio
  docs/source/img/zoom_comm.svg

  docs/source/application.rst
  docs/source/app_s4u.rst
  docs/source/app_smpi.rst
  docs/source/The_XBT_toolbox.rst
  docs/source/Calibrating_the_models.rst
  docs/source/community.rst
  docs/source/Configuring_SimGrid.rst
  docs/source/Deploying_your_application.rst
  docs/source/Contributors_Documentation.rst
  docs/source/Examples.rst
  docs/source/Experimental_setup.rst
  docs/source/index.rst
  docs/source/intl.rst
  docs/source/Introduction.rst
  docs/source/Installing_SimGrid.rst
  docs/source/Start_your_own_project.rst
  docs/source/Models.rst
  docs/source/Modeling_howtos.rst
  docs/source/Outcomes.rst
  docs/source/Platform.rst
  docs/source/Platform_cpp.rst
  docs/source/Platform_examples.rst
  docs/source/Platform_routing.rst
  docs/source/Plugins.rst
  docs/source/Release_Notes.rst
  docs/source/XML_reference.rst
  docs/source/Design_goals.rst

  docs/source/Tutorial_Algorithms.rst
  docs/source/tuto_s4u/deployment1.xml
  docs/source/tuto_s4u/deployment2.xml
  docs/source/tuto_s4u/deployment3.xml
  docs/source/tuto_s4u/deployment5.xml
  docs/source/tuto_s4u/draw_gantt.R
  docs/source/tuto_s4u/img/intro.svg
  docs/source/tuto_s4u/img/question.svg
  docs/source/tuto_s4u/img/result.png
  docs/source/tuto_s4u/img/Rscript-screenshot.png
  docs/source/tuto_s4u/img/vite-screenshot.png
  docs/source/tuto_s4u/master-workers-lab1.cpp
  docs/source/tuto_s4u/master-workers-lab1.py
  docs/source/tuto_s4u/master-workers-lab2.cpp
  docs/source/tuto_s4u/master-workers-lab2.py
  docs/source/tuto_s4u/master-workers-lab3.cpp
  docs/source/tuto_s4u/master-workers-lab4.cpp

  docs/source/Tutorial_DAG.rst
  docs/source/img/battery_degradation.svg
  docs/source/img/dag1.svg
  docs/source/img/dag2.svg
  docs/source/img/dag.svg

  docs/source/Tutorial_MPI_Applications.rst
  docs/source/tuto_smpi/3hosts.png
  docs/source/tuto_smpi/3hosts.xml
  docs/source/tuto_smpi/img/big-picture.svg
  docs/source/tuto_smpi/img/lu.S.4.png
  docs/source/tuto_smpi/gemm_mpi.cpp
  docs/source/tuto_smpi/roundtrip.c

  docs/source/tuto_mc/ndet-receive-mpi.c
  docs/source/tuto_mc/ndet-receive-s4u.cpp

  docs/source/tuto_disk/analysis.org
  docs/source/tuto_disk/analysis.irst
  docs/source/tuto_disk/CMakeLists.txt
  docs/source/tuto_disk/Dockerfile
  docs/source/tuto_disk/fig/edel_read_dhist.png
  docs/source/tuto_disk/fig/edel_write_dhist.png
  docs/source/tuto_disk/fig/griffon_deg.png
  docs/source/tuto_disk/fig/griffon_read_dhist.png
  docs/source/tuto_disk/fig/griffon_write_dhist.png
  docs/source/tuto_disk/fig/simgrid_results.png
  docs/source/tuto_disk/init.el
  docs/source/tuto_disk/tuto_disk.cpp
  docs/source/tuto_network_calibration/CMakeLists.txt
  docs/source/tuto_network_calibration/dahu_platform_ckmeans.cpp
  docs/source/tuto_network_calibration/dahu_platform_dhist.cpp
  docs/source/tuto_network_calibration/Dockerfile
  docs/source/tuto_network_calibration/fig/pingpong_real.drawio
  docs/source/tuto_network_calibration/fig/pingpong_real.png
  docs/source/tuto_network_calibration/fig/pingpong_simgrid.drawio
  docs/source/tuto_network_calibration/fig/pingpong_simgrid.png
  docs/source/tuto_network_calibration/isend_ckmeans.json
  docs/source/tuto_network_calibration/isend_dhist.json
  docs/source/tuto_network_calibration/network_calibration_tutorial.rst
  docs/source/tuto_network_calibration/pingpong_ckmeans.json
  docs/source/tuto_network_calibration/pingpong_dhist.json
  docs/source/tuto_network_calibration/plot_ckmeans_PingPong.png
  docs/source/tuto_network_calibration/plot_dhist_PingPong.png
  docs/source/tuto_network_calibration/plot_op_average.png
  docs/source/tuto_network_calibration/plot_op_raw.png
  docs/source/tuto_network_calibration/plot_op_segmented.png
  docs/source/tuto_network_calibration/plot_op_simgrid_ckmeans.png
  docs/source/tuto_network_calibration/plot_op_simgrid_dhist.png
  docs/source/tuto_network_calibration/recv_ckmeans.json
  docs/source/tuto_network_calibration/recv_dhist.json
  docs/source/tuto_network_calibration/send_ckmeans.json
  docs/source/tuto_network_calibration/send_dhist.json
  docs/source/tuto_network_calibration/Utils.cpp
  docs/source/tuto_network_calibration/Utils.hpp

  docs/source/Tutorial_Model-checking.rst

  CITATION.bib
  )

set(DOC_TOOLS
  tools/doxygen/list_routing_models_examples.sh
  )

# these files get copied automatically to the html documentation

set(bin_files
  ${bin_files}
  src/smpi/smpicc.in
  src/smpi/smpicxx.in
  src/smpi/smpif90.in
  src/smpi/smpiff.in
  src/smpi/smpirun.in
  src/smpi/smpitools.sh
  )

set(txt_files
  ${txt_files}
  AUTHORS
  COPYING
  ChangeLog
  LICENSE-LGPL-2.1
  NEWS
  README.md
  )

# The list of cmake build directories is constructed from the following list.
# Add your CMakeLists file here to see your subdir built.
set(CMAKEFILES_TXT
  examples/c/CMakeLists.txt
  examples/cpp/CMakeLists.txt
  examples/platforms/CMakeLists.txt
  examples/python/CMakeLists.txt
  examples/smpi/CMakeLists.txt
  examples/smpi/NAS/CMakeLists.txt
  examples/smpi/comm_dynamic_costs/CMakeLists.txt
  examples/smpi/replay_multiple/CMakeLists.txt
  examples/smpi/replay_multiple_manual_deploy/CMakeLists.txt
  examples/smpi/smpi_s4u_masterworker/CMakeLists.txt
  examples/sthread/CMakeLists.txt

  teshsuite/kernel/CMakeLists.txt
  teshsuite/mc/CMakeLists.txt
  teshsuite/models/CMakeLists.txt
  teshsuite/platforms/CMakeLists.txt
  teshsuite/python/CMakeLists.txt
  teshsuite/s4u/CMakeLists.txt
  teshsuite/smpi/CMakeLists.txt

  teshsuite/smpi/MBI/CMakeLists.txt
  teshsuite/smpi/mpich3-test/CMakeLists.txt
  teshsuite/smpi/mpich3-test/attr/CMakeLists.txt
  teshsuite/smpi/mpich3-test/coll/CMakeLists.txt
  teshsuite/smpi/mpich3-test/comm/CMakeLists.txt
  teshsuite/smpi/mpich3-test/datatype/CMakeLists.txt
  teshsuite/smpi/mpich3-test/errhan/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/attr/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/coll/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/comm/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/datatype/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/ext/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/info/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/init/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/pt2pt/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/rma/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/topo/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f77/util/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/coll/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/datatype/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/info/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/init/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/pt2pt/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/rma/CMakeLists.txt
  teshsuite/smpi/mpich3-test/f90/util/CMakeLists.txt
  teshsuite/smpi/mpich3-test/group/CMakeLists.txt
  teshsuite/smpi/mpich3-test/info/CMakeLists.txt
  teshsuite/smpi/mpich3-test/init/CMakeLists.txt
  teshsuite/smpi/mpich3-test/io/CMakeLists.txt
  teshsuite/smpi/mpich3-test/perf/CMakeLists.txt
  teshsuite/smpi/mpich3-test/pt2pt/CMakeLists.txt
  teshsuite/smpi/mpich3-test/rma/CMakeLists.txt
  teshsuite/smpi/mpich3-test/topo/CMakeLists.txt

  teshsuite/xbt/CMakeLists.txt
  tools/CMakeLists.txt
  tools/graphicator/CMakeLists.txt
  tools/tesh/CMakeLists.txt
  )

set(CMAKE_SOURCE_FILES
  CMakeLists.txt
  FindSimGrid.cmake
  MANIFEST.in
  MANIFEST.in.in
  setup.py
  tools/cmake/CTestConfig.cmake
  tools/cmake/CTestCustom.cmake
  tools/cmake/DefinePackages.cmake
  tools/cmake/Distrib.cmake
  tools/cmake/Documentation.cmake
  tools/cmake/Flags.cmake
  tools/cmake/MaintainerMode.cmake
  tools/cmake/MakeLib.cmake
  tools/cmake/Modules/FindGraphviz.cmake
  tools/cmake/Modules/FindLibevent.cmake
  tools/cmake/Modules/FindNS3.cmake
  tools/cmake/Modules/FindPAPI.cmake
  tools/cmake/Modules/FindValgrind.cmake
  tools/cmake/Modules/nlohmann_jsonConfig.cmake
  tools/cmake/Modules/pybind11Config.cmake
  tools/cmake/Option.cmake
  tools/cmake/Tests.cmake
  tools/cmake/scripts/fixup_simgrid_dtd_l.pl
  tools/cmake/scripts/my_valgrind.pl
  tools/cmake/scripts/update_tesh.pl
  tools/cmake/test_prog/prog_asan.cpp
  tools/cmake/test_prog/prog_makecontext.c
  tools/cmake/test_prog/prog_ns3.cpp
  tools/cmake/test_prog/prog_stackgrowth.c
  tools/cmake/test_prog/prog_stacksetup.c
  tools/cmake/test_prog/prog_tsan.cpp
  tools/simgrid-monkey
  tools/smpi/generate_smpi_defines.pl
  tools/stack-cleaner/README
  tools/stack-cleaner/as
  tools/stack-cleaner/c++
  tools/stack-cleaner/cc
  tools/stack-cleaner/clean-stack-filter
  tools/stack-cleaner/compiler-wrapper
  tools/stack-cleaner/fortran
  )

set(PLATFORMS_EXAMPLES
  examples/platforms/bypassRoute.xml
  examples/platforms/bypassZoneRoute.xml
  examples/platforms/cloud.xml
  examples/platforms/cluster_and_one_host.xml
  examples/platforms/cluster_backbone.svg
  examples/platforms/cluster_backbone.xml
  examples/platforms/cluster_crossbar.svg
  examples/platforms/cluster_crossbar.xml
  examples/platforms/cluster_dragonfly.svg
  examples/platforms/cluster_dragonfly.xml
  examples/platforms/cluster_fat_tree.svg
  examples/platforms/cluster_fat_tree.xml
  examples/platforms/cluster_multi.xml
  examples/platforms/cluster_torus.svg
  examples/platforms/cluster_torus.xml
  examples/platforms/config.xml
  examples/platforms/config_tracing.xml
  examples/platforms/crosstraffic.xml
  examples/platforms/data_center.xml
  examples/platforms/dogbone.xml
  examples/platforms/energy_boot.xml
  examples/platforms/energy_cluster.xml
  examples/platforms/energy_platform.xml
  examples/platforms/faulty_host.xml
  examples/platforms/g5k.xml
  examples/platforms/griffon.cpp
  examples/platforms/griffon.xml
  examples/platforms/hosts_with_disks.xml
  examples/platforms/meta_cluster.xml
  examples/platforms/model_checker_platform.xml
  examples/platforms/multicore_machine.xml
  examples/platforms/ns3-big-cluster.xml
  examples/platforms/onelink.xml
  examples/platforms/optorsim/gridpp_grid_2004.conf
  examples/platforms/optorsim/lcg_sept2004_grid.conf
  examples/platforms/optorsim/transform_optorsim_platform.pl
  examples/platforms/profiles/fafard_state.profile
  examples/platforms/profiles/faulty_host.profile
  examples/platforms/profiles/ginette_state.profile
  examples/platforms/profiles/jupiter_speed.profile
  examples/platforms/profiles/jupiter_state.profile
  examples/platforms/profiles/link1_bandwidth.profile
  examples/platforms/profiles/link1_latency.profile
  examples/platforms/profiles/link3_state.profile
  examples/platforms/profiles/link4_state.profile
  examples/platforms/profiles/trace_A.txt
  examples/platforms/profiles/trace_A_failure.txt
  examples/platforms/profiles/trace_B.txt
  examples/platforms/prop.xml
  examples/platforms/ptask_L07.xml
  examples/platforms/routing_cluster.cpp
  examples/platforms/routing_cluster.xml
  examples/platforms/simulacrum_7_hosts.xml
  examples/platforms/small_platform.xml
  examples/platforms/small_platform_failures.xml
  examples/platforms/small_platform_fatpipe.xml
  examples/platforms/small_platform_one_link_routes.xml
  examples/platforms/small_platform_profile.xml
  examples/platforms/small_platform_routing_none.xml
  examples/platforms/small_platform_with_routers.xml
  examples/platforms/storage/content/small_content.txt
  examples/platforms/storage/content/storage_content.txt
  examples/platforms/supernode.cpp
  examples/platforms/supernode.py
  examples/platforms/supernode.svg
  examples/platforms/syscoord/generate_peer_platform.pl
  examples/platforms/syscoord/median_harvard.syscoord
  examples/platforms/syscoord/median_meridian.syscoord
  examples/platforms/syscoord/median_p2psim.syscoord
  examples/platforms/three_multicore_hosts.xml
  examples/platforms/two_hosts.xml
  examples/platforms/two_hosts_platform_shared.xml
  examples/platforms/two_hosts_platform_with_availability_included.xml
  examples/platforms/two_hosts_profiles.xml
  examples/platforms/two_peers.xml
  examples/platforms/vivaldi.xml
  examples/platforms/wifi.xml
  examples/platforms/wifi_energy.xml
  examples/platforms/wifi_large_cell.xml
  examples/platforms/wifi_ns3.xml
  )
