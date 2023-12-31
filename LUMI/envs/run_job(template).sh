#!/bin/bash -l
#SBATCH --job-name=train   # Job name
#SBATCH --output=logs/train.o%j # Name of stdout output file
#SBATCH --error=logs/train.e%j  # Name of stderr error file
#SBATCH --partition=standard-g  # Partition (queue) name
#SBATCH --nodes=1               # Total number of nodes
#SBATCH --ntasks-per-node=8     # 8 MPI ranks per node, 128 total (16x8)
#SBATCH --gpus-per-node=1       # Allocate one gpu per MPI rank
#SBATCH --time=0-02:00:00       # Run time (d-hh:mm:ss)
#SBATCH --account=project_465000872  # Project for billing

singularity exec -B /scratch/project_465000872 test_container.sif python3 test.py