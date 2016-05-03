#! /bin/bash

#if [$# -ne 3]
#then
#  echo "Usage: `basename $0` {acmofile} {xvariable} {yvariable} {group1} {group2} {pngoutput}"
#  exit -1
#fi

INSTALL_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
rootDir=$INSTALL_DIR
dataDir=$INSTALL_DIR
workDir=$PWD


basefile=$1
if [ "$basefile" == "1" ]
then
  seedfile=$2
  #SiteInfo=$(sed -n '4p' $seedfile)
  read -a arr <<< $(sed -n '4p' $seedfile)
  shortname=${arr[0]}
  stnname=${arr[0]}
  stnlat=${arr[1]}
  stnlon=${arr[2]}
  mmstart=$3
  mmend=$4
  thisrcp=$5
  thisfut=$6
  pdfoutput=$7
else
  seedfile=$rootDir/data/Historical/USMA0XXX.AgMIP
  shortname=$2
  stnname=$3
  stnlat=$4
  stnlon=$5
  mmstart=$6
  mmend=$7
  thisrcp=$8
  thisfut=$9
  pdfoutput=${10}
fi

#echo $rootDir 
#echo $dataDir 
#echo $workDir 
#echo $basefile
#echo $seedfile 
#echo $shortname
#echo $stnname 
#echo $stnlat 
#echo $stnlon 
#echo $mmstart
#echo $mmend 
#echo $thisrcp 
#echo $thisfut
#echo pdfouput=$pdfoutput

command -v R >/dev/null 2>&1 || { echo >&2 "'R' is required by this tool but was not found on past";exit 1;}

run_agmip_CMIP5_TandP=$INSTALL_DIR/run_agmip_CMIP5_TandP.R

xvfb-run -a R --no-save --vanilla --slave --args $rootDir $dataDir $workDir $basefile $seedfile "$shortname" "$stnname" $stnlat $stnlon $mmstart $mmend "$thisrcp" "$thisfut" "$pdfoutput"< $run_agmip_CMIP5_TandP


exit
