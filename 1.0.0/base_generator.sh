#! /bin/bash

# Check if the variable PACKAGE_BASE has been set in env.sh
if [ -z "$PACKAGE_BASE" ];
then
  echo "source env.sh before running this script"
  exit -1
fi

# Check if the number of parameters is correct
if [ $# -lt 8 ]
then
    echo "Usage: $0 seedfiledata seedfile shortregion headplus lat lon datashort output"
    exit -1
fi

# If needed, trap the tool scratch directory somewhere else
THISDIR=`pwd`
#THISDIR="/scratch/wrf/sandbox/base_generator/"
cd $THISDIR

# Save a copy of a command line for fast debug
echo "$0 $@" > `basename $0`.cmd
chmod +x `basename $0`.cmd

# The actual script begins here
###############################

#set -x

#if [$# -ne 3]
#then
#  echo "Usage: `basename $0` {acmofile} {xvariable} {yvariable} {group1} {group2} {pngoutput}"
#  exit -1
#fi
seedfiledata=$1
seedfile=$2
shortregion=$3
headplus=$4
lat=$5
lon=$6
datashort=$7
output=$8

rootDir=$PWD
INSTALL_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
dataDir=$INSTALL_DIR

mkdir $rootDir/input
mkdir $rootDir/output

cd $rootDir/input
cp $seedfiledata $seedfile



seedname=${seedfile%.*}
#echo $seedfile 
echo $rootDir 
echo $dataDir 
echo $seedname 
echo $shortregion 
echo $headplus 
echo $lat 
echo $lon 
echo $datashort 
echo $output

command -v R >/dev/null 2>&1 || { echo >&2 "'R' is required by this tool but was not found on past";exit 1;}

run_agmip_farmclimate=$INSTALL_DIR/run_agmip_farmclimate.R

xvfb-run -a R --no-save --vanilla --slave --args $rootDir $dataDir $seedname $shortregion "$headplus" "$lat" "$lon" $datashort < $run_agmip_farmclimate

cd ../output
zip base.zip *
cp base.zip $output
rm -rf ../input
rm -rf ../output
exit
