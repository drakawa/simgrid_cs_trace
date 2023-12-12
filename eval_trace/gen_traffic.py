import numpy as np
import argparse
import os

def gen_traffic(matrix_file, rate, matrix_dir):
    # read matrix file and get rank size
    matrix = np.loadtxt(os.path.join(matrix_dir, matrix_file), dtype=float, delimiter='\t')
    size = matrix.shape[0]
    # print(matrix)
    # print(size)

    # create trace list file and trace folder
    trace = "{}_{}".format(matrix_file, rate)
    trace_folder = "{}_files".format(trace)
    with open(os.path.join(matrix_dir, trace), mode="w") as f:
        for rank in range(size):
            f.write("{}/{}/rank-{}.txt\n".format(matrix_dir, trace_folder, rank))

    if not os.path.isdir(os.path.join(matrix_dir, trace_folder)):
        os.mkdir(os.path.join(matrix_dir, trace_folder))
    
    # multiply rate to get traffic matrix
    int_mat = np.rint(matrix * rate).astype(int)
    # print(int_mat)

    # calculate total sends/recvs
    total_sends = int_mat.sum(axis=1)
    total_recvs = int_mat.sum(axis=0)
    # print(total_sends)
    # print(total_recvs)

    # create trace files
    for rank in range(size):
        typeid_byte = 6
        sendcounts = " ".join(map(str, int_mat[rank]))
        recvcounts = " ".join(map(str, int_mat[:, rank]))
        rank_str = "{} alltoallv {} {} {} {} {} {}".format(rank, total_sends[rank], sendcounts, total_recvs[rank], recvcounts, typeid_byte, typeid_byte)
        # print(rank_str)
        # print(rank)
        # print(total_sends[rank])
        # print(total_recvs[rank])
        # print(int_mat[rank])
        # print(int_mat[:, rank])
        

        with open(os.path.join(matrix_dir, "{}/rank-{}.txt".format(trace_folder, rank)), mode="w") as f:
            f.write("{} init\n".format(rank))
            f.write("{}\n".format(rank_str))
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='get matrix file and traffic rate')
    parser.add_argument('matrix_file', type=str, help='matrix file')
    parser.add_argument('data_rate', type=int, help='traffic rate (byte); send size = matrix element * rate')
    parser.add_argument('matrix_dir', type=str, help='directory name for load/save')
    args = parser.parse_args()
    matrix_file = args.matrix_file
    rate = args.data_rate
    matrix_dir = args.matrix_dir

    gen_traffic(matrix_file, rate, matrix_dir)
