##############################################################################
## 
## run_analysis.R: This script does the following:
##
##  
##
##############################################################################

###############################################################################
## Set the working directory on home PC
###############################################################################

courseProjDir <- 
    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//CourseProject"
setwd(courseProjDir)
    
###############################################################################
## Read the training data. This script assumes this is contained in the 
## directory
##     ./data/UCI HAR Dataset/train
## in the files
##   subject_train.txt
##   y_train.txt
##   X_train.txt
###############################################################################

trainDir <-"./data/UCI HAR Dataset/train"

setwd(trainDir)

subjectTrain<- read.table("subject_train.txt", header = FALSE)
yTrain <- read.table("y_train.txt", header = FALSE)
XTrain <- read.table("X_train.txt", header = FALSE)
