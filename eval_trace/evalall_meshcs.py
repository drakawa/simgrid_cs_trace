import os
import itertools as it

from eval_meshcs import *

def get_files(directory, suffix):
    all_files = os.listdir(directory)
    suffix_files = [f for f in all_files if f.endswith(suffix)]
    return suffix_files
if __name__ == "__main__":
    matrix_dir = "traf_matrix"
    cs_dir = "cs_edges"
    
    matrix_suffix = ".txt"
    cs_suffix = ".edges"

    matrix_files = get_files(matrix_dir, matrix_suffix)
    cs_files = get_files(cs_dir, cs_suffix)
    print(matrix_files)
    print(cs_files)

    for matrix_file, cs_file in it.product(matrix_files, cs_files):
        eval_meshcs_single(matrix_file, cs_file)
        
    

    
