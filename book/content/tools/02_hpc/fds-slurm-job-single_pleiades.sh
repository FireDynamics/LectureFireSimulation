#!/bin/bash -x

##########   PLEIADES   ##########

#SBATCH --job-name=my_FDS_simulation
#SBATCH --partition=normal
#SBATCH --ntasks=16
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j
#SBATCH --time=00:30:00  # days-hours:minutes:seconds

# Add firesim modules
module use -a ~larnold/modules/

# Load FDS in the version 6.8.0
module load FDS/6.8.0_IntelComp_IntelMPI.2021.2_mkl

# Execute FDS, here it is assumed, that there is only one FDS input file
# in the current directory. Additionally, srun uses implicitly the number
# of tasks specified in the SLURM header
mpiexec fds ./*.fds
