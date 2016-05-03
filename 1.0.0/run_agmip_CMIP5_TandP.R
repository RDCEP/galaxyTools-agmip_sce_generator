####################################################################################################
###----------------------------------------------------------------------------------------------###
#                     \    ||   /
#      AA             \    ||   /  MMM    MMM  IIII  PPPPP
#     AAAA            \\   ||   /   MMM  MMM    II    P  PP
#    AA  AA    ggggg  \\\\ ||  //   M  MM  M    II    PPPP
#   AAAAAAAA  gg  gg     \\ ////    M      M    II    P
#  AA      AA  ggggg  \\   //      MM      MM  IIII  PPP
#                  g  \\\\     //    
#              gggg      \\ ////     The Agricultural Model Intercomparison and Improvement Project
#                          //
###----------------------------------------------------------------------------------------------###
####################################################################################################
###----------------------------------------------------------------------------------------------###
#   			run_agmip_CMIP5_TandP.R
# 
#  Runs agmip_CMIP5_TandP_nobase.R to produce GCM #  This script analyzes CMIP5 Model output for a given location and 
#  makes a scatterplot showing which model is which.  This one doesn't need a baseline file, so everything is placed 
#  in deltaT, deltaP rather than raw values
#
# 		Author: Alex Ruane
# 									alexander.c.ruane@nasa.gov
#    	Created:date:  07/02/13
# 		Translated to R: 05/1/2015 by John Simmons (jms2402@columbia.edu)
###----------------------------------------------------------------------------------------------###
####################################################################################################
###----------------------------------------------------------------------------------------------###
#
# This script and associated scripts have been developed collaboratively by the AgMIP Climate Team
#  and are to be used solely for the ongoing research efforts of AgMIP.
#
# There is ABSOLUTELY NO GUARANTEE that these scripts will produce accurate and precise results.
#  Accordingly, results should be confirmed and validated prior to publication.  Also, there is
#  ABSOLUTELY NO WARRANTY that comes with these scripts.
#
# Should you encounter any bugs or difficulties or have any suggestions or recommendations, please
#  feel free to contact us.
#
# Thank you for your contribution to AgMIP and best of luck with your research!
#
###----------------------------------------------------------------------------------------------###
####################################################################################################

run_agmip_CMIP5_TandR <- function(rootDir,dataDir,workDir,Basefile,histfile,shortname,stnname,stnlat,stnlon,mmstart,mmend,thisrcp,thisfut,output){

## Input variables
### These should be the only variables you will have to change for running the script for 
###  another file as long as all files are located in the correct folders
#shortname = 'USDD' #used for saving figures
#stnname = 'Delay, USA';
#stnlat = 59.43 #'42.017;
#stnlon = -89.75 #-93.750;
#mmstart = 6;
#mmend = 9;
#thisrcp = 'rcp85';
#thisfut = 'mid';

# if Basefile exists and is located in baseloc, set to 1
# otherwise set to 0
#Basefile = 0

#Optional Variables - for plotting - 
Tmin = NaN;
Tmax = NaN;
Pmin = NaN;
Pmax = NaN; 

### You must enter the location of the R folder into rootDir below using \\ between folders.
### For example, 'C:\\Users\\Your Name Here\\Desktop\\R\\'
#rootDir     <- '/Users/weixiong/Development/face-it/RIA/AgMIP_Scenarios_Generator/' #'C:\\Users\\Alex\\Documents\\_work\\R\\'

## <- Enter figure location here <-
#figDir <- workDir #'/Users/weixiong/Development/face-it/RIA/AgMIP_Scenarios_Generator/'#'C:\\Users\\Alex\\Documents\\_work\\R\\Figures\\'

#programDir  <- paste(rootDir, 'Version\ 1.0.7/', sep='')
programDir <- rootDir
dataDir     <- paste(rootDir, '/data/', sep='')
baseloc  <- paste(dataDir, '/Climate/Historical/', sep='')
#histfile    <- paste(baseloc,shortname,'0XXX.AgMIP', sep='') # Don't need whole filename here, as it pulls the shortname above. Make sure to note last 3 digits

############################ No need to edit beyond this line ######################
## Load required packages
library <- c("R.matlab","R.utils")
lapply(library, require, character.only = T)
rm(library)

## Source scripts
source(paste(programDir, '/acr_findspot.R', sep=''))
source(paste(programDir, '/agmip_CMIP5_TandP.R', sep=''))


# Plot deltT and deltP from Global Climate models
  agmip_CMIP5_TandP(rootDir,Basefile,histfile,shortname,stnname,stnlat,stnlon,
    mmstart,mmend,thisrcp,thisfut,Tmin,Tmax,Pmin,Pmax,output)
}
args<-commandArgs(trailingOnly=TRUE)
rootDir<- args[1]
dataDir<- args[2]
workDir<- args[3]
Basefile<- args[4]
histfile<-  args[5]
shortname<- args[6]
stnname<- args[7]
stnlat<- as.numeric(args[8])
stnlon<- as.numeric(args[9])
mmstart<- as.numeric(args[10])
mmend<- as.numeric(args[11])
thisrcp<- args[12]
thisfut<- args[13]
output<- args[14]
run_agmip_CMIP5_TandR(rootDir,dataDir,workDir,Basefile,histfile,shortname,stnname,stnlat,stnlon,mmstart,mmend,thisrcp,thisfut,output)
