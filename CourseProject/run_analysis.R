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

#courseProjDir <- 
#    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//CourseProject"

###############################################################################
## Set the working directory on laptop
###############################################################################

courseProjDir <- 
  "C://Terry-Programming//Coursera//GettingCleaningData//CourseProject"

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

################################################################################
# Note that when viewing a value in XTrain not all the digits are shown
# but if a value eg XTrain[1,1] is printed with eg. digits=12 then
# all the digits shown.
################################################################################

###############################################################################
## Read the test data. This script assumes this is contained in the 
## directory relative to the Course Project directory
##     ./data/UCI HAR Dataset/test
## in the files
##   subject_test.txt
##   y_test.txt
##   X_test.txt
###############################################################################

setwd(courseProjDir) # need to reset to Course Project Directory so relative
                     # paths are correct

testDir <-"./data/UCI HAR Dataset/test"

setwd(testDir)

subjectTest<- read.table("subject_test.txt", header = FALSE)
yTest <- read.table("y_test.txt", header = FALSE)
XTest <- read.table("X_test.txt", header = FALSE)

setwd(courseProjDir) # need to reset to Course Project Directory so relative
                     # paths are correct

###############################################################################
## Create a single dataset by 
## 1. Merging the training and test data from the corresponding 
##    subject, y and X files. When doing this you must ensure the order of 
##    the merging is the same across the R objects holding the training
##    and test data
## 2. Extract the mean and standard deviation.
##
## 2. Creating a single R object containing the merged subject, y and X
##    data.
## 3. Add the column names 
###############################################################################

subject <- rbind(subjectTest, subjectTrain)
rm(subjectTest) # to tidy memory
rm(subjectTrain) # to tidy memory

y <- rbind(yTest, yTrain)
rm(yTest)
rm(yTrain)

X <- rbind(XTest, XTrain)
rm(XTest)
rm(XTrain)

###############################################################################
## Extract only the measurements on the mean and standard deviation 
## for each measurement in the mereged X data 
###############################################################################

# 1. get the column names from the features.txt file

setwd(courseProjDir) # need to reset to Course Project Directory so relative
                     # paths are correct

# Read the features.txt file from the directory 

featuresFile <-"./data/UCI HAR Dataset/features.txt"
features <- read.table(featuresFile, header = FALSE)


# 2. Determine which columns contains the mean and standard deviation

table( features[2] %in% c("mean","std")) # something like this

# 3. Extract those columns
