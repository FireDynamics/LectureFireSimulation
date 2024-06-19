#!/bin/bash -x

##########   JURECA   ##########

#SBATCH --job-name=my_FDS_simulation
#SBATCH --account=ias-7
#SBATCH --partition=dc-cpu
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j
#SBATCH --time=00-00:30:00  # days-hours:minutes:seconds

# Set the number of OMP threads
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# Add firesim modules
module use -a /p/project1/cias-7/modules_fire

# Load FDS in the version 6.9.1
module load FDS/6.9.1-IntelCompiler_2023.2.1_IntelMPI_2021.10.0

# Execute FDS, here it is assumed, that there is only one FDS input file
# in the current directory. Additionally, srun uses implicitly the number
# of tasks specified in the SLURM header
srun fds ./*.fds
