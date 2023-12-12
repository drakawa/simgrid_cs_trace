import numpy as np
import argparse

def generate_probability_matrix(size, seed):
    rs = np.random.RandomState(seed)
    matrix = rs.rand(size, size)
    # normalize for each row
    matrix /= matrix.sum(axis=1, keepdims=True)
    
    return matrix

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='get matrix size')
    parser.add_argument('mat_size', type=int, help='matrix size')
    parser.add_argument("seed", type=int, help="random seed")
    args = parser.parse_args()
    size = args.mat_size
    seed = args.seed
    
    mat = generate_probability_matrix(size, seed)

    outf = "matrix_{}_{}.txt".format(size, seed)
    np.savetxt(outf, mat, fmt="%f", delimiter="\t")
