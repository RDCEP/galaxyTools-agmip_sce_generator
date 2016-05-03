#! /bin/bash

if [ -z "$PACKAGE_BASE" ];
then
  # For testing purposes
  export PACKAGE_BASE="/mnt/galaxyTools/agmip_sce_generator/1.0.0"
  echo "Setting PACKAGE_BASE=$PACKAGE_BASE"
fi

export PATH=$PACKAGE_BASE:$PATH
export CLASSPATH=$PACKAGE_BASE:$CLASSPATH

#export PATH=/mnt/galaxyTools/agmip_sce_generator/1.0.0:$PATH
#export CLASSPATH=/mnt/galaxyTools/agmip_sce_generator/1.0.0:$CLASSPATH
