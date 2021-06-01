#!/bin/bash

#SBATCH --job-name=my_FDS_simulation
#SBATCH --account=ias-7
#SBATCH --partition=dc-cpu
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1
#SBATCH --output=stdout.%j
#SBATCH --error=stderr.%j
#SBATCH --time=00:30:00
#SBATCH --signal=B:SIGUSR1@600

# define FDS input file
FDSSTEM=./

# grep the CHID (used for stop file)
CHID=`sed -n "s/^.*CHID='\([-0-9a-zA-Z_]*\)'.*$/\1/p" < $FDSSTEM*.fds`

# append the start time to file 'time_start'
echo "$SLURM_JOB_ID -- `date`" >> time_start

# handle the signal sent before the end of the wall clock time
function handler_sigusr1
{
  # protocol stopping time
  echo "$SLURM_JOB_ID -- `date`" >> time_stop
  echo "`date` Shell received stop signal"

  # create FDS stop file
  touch $CHID.stop
  
  # as manual stop was triggered, the end of simulation time was
  # not reached, remove flag file 'simulation_time_end'
  rm simulation_time_end
  wait
}

# register the function 'hander_sigusr1' to handle the signal send out
# just before the end of the wall clock time
trap "handler_sigusr1" SIGUSR1

# check for the simulation finished flag file 'simulation_time_end'
# if it is found, just quit
if [ -e simulation_time_end ]; then

    ## simulation has already finished, nothing left to do
    echo "FDS simulation already finished"
    exit 0
fi

# simulation not finished yet
# create flag file to check for reaching simulation end time
touch simulation_time_end

# load FDS modules 
module use -a /p/home/jusers/rommeswinkel2/jureca/jjsc46/modules_fire
module load FDS/6.7.1_intel2019.lua

# set the number of OMP threads
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# run FDS executable
srun fds $FDSSTEM*.fds & wait

# set RESTART to TRUE in FDS input file
sed -i 's/RESTART=.FALSE./RESTART=.TRUE./g' $FDSSTEM*.fds

# remove the stop file, otherwise the following chain parts
# would not run
rm $CHID.stop