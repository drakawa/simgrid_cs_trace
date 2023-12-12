import argparse
import networkx as nx
import itertools as it
import numpy as np
import yaml
import os

xml_head = """
<?xml version='1.0'?>
<!DOCTYPE platform SYSTEM "https://simgrid.org/simgrid.dtd">
<platform version="4.1">
  <zone id="AS0" routing="Floyd">
"""
xml_tail = """
  </zone>
</platform>
"""
host_speed = 40

def gen_mesh(dim):
    G_mesh = nx.grid_graph(dim)
    nodes = sorted(list(G_mesh.nodes))
    # print(nodes)
    mapping = {e:i for i,e in enumerate(nodes)}
    # print(mapping)

    G_mesh_relabeled = nx.relabel_nodes(G_mesh, mapping)
    # print(G_mesh_relabeled.edges)

    return G_mesh_relabeled

def gen_xml_meshcs(cs_file, link_yaml, dim, cs_dir, xml_dir):
    G_mesh = gen_mesh(dim)
    # print(G_mesh.edges)

    G_cs = nx.read_edgelist(os.path.join(cs_dir, cs_file), nodetype=int, data=False)
    # print(G_cs.edges)

    n_nodes = np.prod(dim)
    # print(n_nodes)

    with open(link_yaml, "r") as yml:
        config = yaml.safe_load(yml)

    HR_bw = config["HR"]["bw"]
    HR_lat = config["HR"]["lat"]
    RR_bw = config["RR"]["bw"]
    RR_lat = config["RR"]["lat"]
    cs_bw = config["cs"]["bw"]
    cs_lat = config["cs"]["lat"]

    # print(HR_bw)
    
    outf = os.path.join(xml_dir, "{}_{}mesh_{}.xml".format(link_yaml, "x".join(map(str, dim)), cs_file))
    # print(outf)
    with open(outf, mode="w") as f:
        f.write(xml_head)
        for i in range(n_nodes):
            f.write("    <host id=\"host{}\" speed=\"{}Gf\"/>\n".format(i, host_speed))
        for i in range(n_nodes):
            f.write("    <router id=\"router{}\"/>\n".format(i))

        for i in range(n_nodes):
            f.write("    <link id=\"link{}\" bandwidth=\"{}MBps\" latency=\"{}us\"/>\n".format(i, HR_bw, HR_lat))

        for i,j in G_mesh.edges:
            f.write("    <link id=\"link{}-{}\" bandwidth=\"{}MBps\" latency=\"{}us\"/>\n".format(i, j, RR_bw, RR_lat))

        for i,j in G_cs.edges:
            f.write("    <link id=\"cs{}-{}\" bandwidth=\"{}MBps\" latency=\"{}us\"/>\n".format(i, j, cs_bw, cs_lat))

        for i in range(n_nodes):
            f.write("    <route src=\"host{}\" dst=\"router{}\"><link_ctn id=\"link{}\"/></route>\n".format(i, i, i))
        for i,j in G_mesh.edges:
            f.write("    <route src=\"router{}\" dst=\"router{}\"><link_ctn id=\"link{}-{}\"/></route>\n".format(i, j, i, j))
        for i,j in G_cs.edges:
            if not G_mesh.has_edge(i,j):
                f.write("    <route src=\"router{}\" dst=\"router{}\"><link_ctn id=\"cs{}-{}\"/></route>\n".format(i, j, i, j))
            
            
        f.write(xml_tail)
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='get xml config')
    parser.add_argument("cs_file", type=str, help="cs edgefile")
    parser.add_argument("link_yaml", type=str, help="link config yaml")
    parser.add_argument("cs_dir", type=str, help="directory for load cs/yaml")
    parser.add_argument("xml_dir", type=str, help="directory for save xml")
    parser.add_argument('--dim', required=True, type=int, nargs="+", help='size of each dimension in mesh')

    args = parser.parse_args()

    cs_file = args.cs_file
    link_yaml = args.link_yaml
    cs_dir = args.cs_dir
    xml_dir = args.xml_dir
    dim = args.dim
    
    gen_xml_meshcs(cs_file, link_yaml, dim, cs_dir, xml_dir)
