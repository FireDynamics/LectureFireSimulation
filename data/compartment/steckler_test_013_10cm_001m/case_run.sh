FDSPRE=''
FDS=fds
FDSTHREADS=1
LOGFILE=$PWD/log
RUNDIR=rundir

LABEL=`cat label`

# redirect all following stdout + stderr to log file
{

echo "########################################"
echo "# Header -- Run Case -- $LABEL"
echo "label: $LABEL"
echo "current time: `date`"
echo "user: $USER"
echo "machine: `hostname`"

echo "" 
echo "########################################"
echo "# Directory Contents"
ls -lah

echo "" 
echo "########################################"
echo "# FDS Version"
$FDS 

echo ""
echo "########################################"
echo "# FDS File Check"
FDSFILE=( *.fds )

# check for only a single FDS input file
FDSFILECOUNT=${#FDSFILE[@]}   
echo "number of FDS input files found: $FDSFILECOUNT"
if [ "$FDSFILECOUNT" != 1 ]; then
    echo "ERROR: Multiple or no FDS input files found. Abort."
    exit 1
fi

echo "name of FDS input file: $FDSFILE"

echo ""
echo "########################################"
echo "# FDS File Contents"
cat $FDSFILE

echo ""
echo "########################################"
echo "# Prepare Run Directory "

# check if run directory does already exist 
SKIPEXECUTION=false
if [[ -d $RUNDIR ]]; then
    if [ $RUNDIR -ot $FDSFILE ]; then
        echo "ERROR: Run directory older than input file. Remove the run directory and retry. Abort."
        echo "Modification time run dir    : `date -r $RUNDIR +'%Y-%m-%d %H:%M:%S'`"
        echo "Modification time input file : `date -r $FDSFILE +'%Y-%m-%d %H:%M:%S'`"
        exit 1
    else
        echo "INFO: Input file older than run directory. Skipping execution."
        echo "Modification time run dir    : `date -r $RUNDIR +'%Y-%m-%d %H:%M:%S'`"
        echo "Modification time input file : `date -r $FDSFILE +'%Y-%m-%d %H:%M:%S'`"
        SKIPEXECUTION=true
    fi
else 
    mkdir -p $RUNDIR
fi

cp $FDSFILE $RUNDIR
cd $RUNDIR


echo "" 
echo "########################################"
echo "# Execute FDS"

if [ "$SKIPEXECUTION" = true ]; then
    echo "skipping execution"
else
    echo "FDSPRE:     $FDSPRE"
    echo "FDSTHREADS: $FDSTHREADS"
    echo "FDS:        $FDS"
    echo "FDSFILE:    $FDSFILE"
    OMP_NUM_THREADS=$FDSTHREADS $FDSPRE $FDS $FDSFILE
fi

echo "" 
echo "########################################"
echo "# Run Directory Contents"
ls -lah .

echo "" 
echo "########################################"
echo "# Back To Initial Directory"
cd -

echo ""
echo "########################################"
echo "# Tail -- Run Case -- $LABEL"
echo "current time: `date`" 

} 2>&1 | tee -a $LOGFILE

# copy log and label file to run directory for potential archive
cp $LOGFILE $RUNDIR
cp label $RUNDIR
