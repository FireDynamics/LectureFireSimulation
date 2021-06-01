#!/bin/bash -x

#SBATCH --job-name=my_FDS_simulation
#SBATCH --account=ias-7
#SBATCH --partition=dc-cpu
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j
#SBATCH --time=00:30:00

# Set the number of OMP threads
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# Add firesim modules
module use -a ~arnold1/modules_fire/

# Load FDS in the version 6.7.5
module load FDS/6.7.5-IntelComp2020.2_ParaStationMPI_5.4.7

# Execute FDS, here it is assumed, that there is only one FDS input file
# in the current directory. Additionally, srun uses implicitly the number 
# of tasks specified in the SLURM header
srun fds ./*.fds