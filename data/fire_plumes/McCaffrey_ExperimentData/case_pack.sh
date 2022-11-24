ZIP=zip
UNZIP=unzip
LOGFILE=$PWD/log
RUNDIR=rundir

LABEL=`cat label`
ZIPFILE=$LABEL.zip

# redirect all following stdout + stderr to log file
{

echo "########################################"
echo "# Header -- Pack Case -- $LABEL"
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
echo "# zip Version"
$ZIP --version 

echo "" 
echo "########################################"
echo "# Print Run Directory Contents"
ls -lah $RUNDIR

echo "" 
echo "########################################"
echo "# zip Command"

# check for existing zip file
SKIPZIP=false
if [ -f $ZIPFILE ]; then
    if [ $RUNDIR -ot $ZIPFILE ]; then
        echo "INFO: Run directory older than zip file. Skipping execution."
        echo "Modification time run dir  : `date -r $RUNDIR +'%Y-%m-%d %H:%M:%S'`"
        echo "Modification time zip file : `date -r $ZIPFILE +'%Y-%m-%d %H:%M:%S'`"
        SKIPZIP=true
    else
        echo "INFO: Zip file older than run directory. Removing zip file for update."
        echo "Modification time run dir    : `date -r $RUNDIR +'%Y-%m-%d %H:%M:%S'`"
        echo "Modification time input file : `date -r $ZIPFILE +'%Y-%m-%d %H:%M:%S'`"
        rm -f $ZIPFILE
    fi
fi

if [ "$SKIPZIP" = false ]; then
    $ZIP -r $ZIPFILE McCaffrey*
fi

echo ""
echo "zip file stats: `ls -lah $ZIPFILE`"

echo "" 
echo "########################################"
echo "# Print zip File Contents"

$UNZIP -v $ZIPFILE

echo ""
echo "########################################" 
echo "# Tail -- Pack Case -- $LABEL"
echo "current time: `date`" 

} 2>&1 | tee -a $LOGFILE

# make copy of log file to be added for upload, if needed
cp log $LABEL.log
