#!/bin/bash -l
#SBATCH --job-name=train   # Job name
#SBATCH --output=../../logs/train/filt/%j.output # Name of stdout output file
#SBATCH --error=../../logs/train/filt/%j.error  # Name of stderr error file
#SBATCH --partition=standard-g  # Partition (queue) name
#SBATCH --nodes=1               # Total number of nodes
#SBATCH --gpus-per-node=1       # Allocate one gpu per MPI rank
#SBATCH --time=0-10:00:00       # Run time (d-hh:mm:ss)
#SBATCH --account=project_465000872  # Project for billing

singularity exec -B /scratch/project_465000872 ../../envs/test_container_v3.sif \
    python3 ../../src/train.py \
        --base_dir /scratch/project_465000872/DATA \
        --config_path ../../src/train_config.json \
        --seed 42 \
        --filter_file LABSE_above_quantile_40.tsv