UNZIP=unzip
WGET=wget
LOGFILE=$PWD/log
RUNDIR=rundir

LABEL=`cat label`
ZIPFILE=$LABEL.zip
ZIPFILELOG=$LABEL.log

URL_ROOT="https://fz-juelich.sciebo.de/s/3ldKV8hYgDQbKWx/download?path=%2F&files="

# redirect all following stdout + stderr to log file
{

echo "########################################"
echo "# Header -- Download Case -- $LABEL"
echo "label: $LABEL"
echo "current time: `date`"
echo "user: $USER"
echo "machine: `hostname`"

echo "" 
echo "########################################"
echo "# Directory Contents"
ls -lah .

# check for existing run dir
if [ -d $RUNDIR ]; then
    echo "INFO: Run directory does exist. Please remove it prior to download. Abort."
    exit 1
fi

echo "" 
echo "########################################"
echo "# wget Version"
$WGET --version 

echo "" 
echo "########################################"
echo "# Download files"

$WGET "$URL_ROOT$ZIPFILE" -O $ZIPFILE
$WGET "$URL_ROOT$ZIPFILELOG" -O $ZIPFILELOG

echo "" 
echo "########################################"
echo "# unzip Version"
$UNZIP --version 

echo "" 
echo "########################################"
echo "# Print Zip File Contents"

$UNZIP -v $ZIPFILE

echo "" 
echo "########################################"
echo "# unzip Command"

$UNZIP $ZIPFILE

echo "" 
echo "########################################"
echo "# Print Run Directory Contents"
ls -lah $RUNDIR

echo ""
echo "########################################" 
echo "# Tail -- Download Case -- $LABEL"
echo "current time: `date`" 

} 2>&1 | tee -a $LOGFILE

