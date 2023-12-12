import networkx as nx
import random
import argparse
import numpy as np

def generate_random_perfect_matching(graph, seed):
    rs = np.random.RandomState(seed)
    nodes = list(graph.nodes())
    rs.shuffle(nodes)
    matching_edges = [(nodes[i], nodes[i + 1]) for i in range(0, len(nodes), 2)]
    matching_graph = nx.Graph()
    matching_graph.add_edges_from(matching_edges)
    return matching_graph

def gen_randcs(n_nodes, seed):
    complete_graph = nx.complete_graph(n_nodes)
    random_matching = generate_random_perfect_matching(complete_graph, seed)
    
    return random_matching

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='get node size')
    parser.add_argument('node_size', type=int, help='node size')
    parser.add_argument('seed', type=int, help='random seed')
    args = parser.parse_args()
    node_size = args.node_size
    seed = args.seed
    
    G_randcs = gen_randcs(node_size, seed)
    print(G_randcs.edges)
    nx.write_edgelist(G_randcs, "randcs_{}_{}.edges".format(node_size, seed), data=False)
