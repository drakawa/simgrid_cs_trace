from gen_traffic import *
from gen_xml_meshcs import *
import numpy as np
import os
import subprocess
import re
import yaml

def get_simtime(input_text):
    keyword = "Simulation time"
    pattern = re.compile(fr'.*{re.escape(keyword)}.*', re.MULTILINE)

    matching_lines = pattern.findall(input_text)

    return float(matching_lines[0].split()[-1])

def smpirun_trace(trace_dir, trace_file, xml_dir, xml_file, log_dir, n_processes):
    # print(trace_dir, trace_file, xml_dir, xml_file, n_processes)
    exec_str = "smpirun -no-privatize -replay {} --log=replay.thresh:critical --log=no_loc -np {} -platform {} ./replay/smpi_replay --log=smpi_config.thres:warning --log=xbt_cfg.thres:warning".format(os.path.join(trace_dir, trace_file), n_processes, os.path.join(xml_dir, xml_file))

    print(exec_str)
    with open(os.path.join(log_dir, "{}_{}.log".format(trace_file, xml_file)), "w") as outf:
        proc = subprocess.run(exec_str.split(), capture_output=True)
        proc_output = proc.stderr.decode("utf-8")
        print(proc_output)
        simtime = get_simtime(proc_output)
        # print(simtime)
        
        outf.write("{}\n".format(simtime))
        # subprocess.call(exec_str.split(), stderr=outf)

def eval_meshcs_single(matrix_file, cs_file):
    eval_yaml = "eval_config.yaml"
    with open(eval_yaml, "r") as yml:
        eval_config = yaml.safe_load(yml)
        
    rate = eval_config["rate"]
    dim = eval_config["dim"]
    
    n_processes = np.prod(dim)
    
    matrix_dir = "traf_matrix"

    gen_traffic(matrix_file, rate, matrix_dir)

    link_yaml = "link_config.yaml"
    cs_dir = "cs_edges"
    xml_dir = "xmlfiles"
    log_dir = "logfiles"

    gen_xml_meshcs(cs_file, link_yaml, dim, cs_dir, xml_dir)

    smpirun_trace(matrix_dir, "{}_{}".format(matrix_file, rate), xml_dir, "{}_{}mesh_{}.xml".format(link_yaml, "x".join(map(str, dim)), cs_file), log_dir, n_processes)

if __name__ == "__main__":
    # eval_yaml = "eval_config.yaml"
    # with open(eval_yaml, "r") as yml:
    #     eval_config = yaml.safe_load(yml)
        
    # rate = eval_config["rate"]
    # dim = eval_config["dim"]
    
    # n_processes = np.prod(dim)
    
    parser = argparse.ArgumentParser(description='get smpirun config')
    parser.add_argument("matrix_file", type=str, help="matrix edgefile")
    parser.add_argument("cs_file", type=str, help="cs edgefile")

    args = parser.parse_args()

    matrix_file = args.matrix_file
    cs_file = args.cs_file

    eval_meshcs_single(matrix_file, cs_file)

    # matrix_dir = "traf_matrix"

    # gen_traffic(matrix_file, rate, matrix_dir)

    # link_yaml = "link_config.yaml"
    # cs_dir = "cs_edges"
    # xml_dir = "xmlfiles"

    # gen_xml_meshcs(cs_file, link_yaml, dim, cs_dir, xml_dir)

    # smpirun_trace(matrix_dir, "{}_{}".format(matrix_file, rate), xml_dir, "{}_{}mesh_{}.xml".format(link_yaml, "x".join(map(str, dim)), cs_file), n_processes)
    
