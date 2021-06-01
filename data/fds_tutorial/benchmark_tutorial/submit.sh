#!/bin/bash -x
#SBATCH --job-name=mustermann_job_1
#SBATCH --account=ias-7
#SBATCH --partition=dc-cpu
#SBATCH --ntasks=512
#SBATCH --cpus-per-task=1
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j
#SBATCH --time=00:30:00

# set the number of OMP threads
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# use 2018b stage
#ml use /usr/local/software/jurecabooster/stages
#ml 2018b

# add firesim modules
module use -a ~arnold1/modules_fire/
module load FDS/6.7.5-IntelComp2020.2_ParaStationMPI_5.4.7

# execute FDS
srun fds ./*.fds
