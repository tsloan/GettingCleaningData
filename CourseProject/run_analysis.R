##############################################################################
## 
## run_analysis.R: This script does the following:
##   - assumes this UCI HAR Samsung training and test data are located
##     contained in the sub-directories  ./data/UCI HAR Dataset/train
##     and ./data/UCI HAR Dataset/test, respectively, of the 
##     working directory.  (For the purposes of the course project, the script
##     sets the working directory to an appropriate one on the script author's
##     available machines. These can be commented out as appropriate.)
##   - Merges the training files 
##         subject_train.txt
##         y_train.txt
##         X_train.txt
##     and the test files 
##         subject_test.txt
##         y_test.txt
##         X_test.txt     
##     to create one data set.
##   - Extracts only the measurements on the mean and standard deviation 
##     for each measurement from the merged training and testing data. This is
##     done by examining the ./data/UCI HAR Dataset/features.txt and
##     extracting those fields those that contain the strings "mean()" or
##     "std()" in their names.  These fields are then extracted from the
##     merged data.
##   - Uses the activity labels from 
##         ./data/UCI HAR Dataset/activity_labels.txt
##     to create descriptive activity names to name the activities in the
##     merged data set
##   - Labels the data set with descriptive variable names, the field names
##     for the "mean()" and "std()" are the same as their names in 
##     ./data/UCI HAR Dataset/features.txt
##   - This merged data set is written out to file called "tidydata.csv" in the
##     working directory.  The data is written in a comman separated variable
##     (i.e. csv) format. This data set is tidy since it has descriptive
##     variable names and one observation per row.
##   - This finally creates a creates a second, independent tidy data set 
##     with the average of each "mean()" and "std()" field for each activity 
##     and each subject. 
##   - The names of the "mean()" and "std" fields in this second tidy dataset
##     are the same as in the first tidy data set but with the prefix 
##     "Average-"
##   - This second tidy data set is written to the working directory as a 
##     space delimited file called "tidy2data.txt". This format and
##     naming convention is used to ensure that it can be uploaded to 
##     the Coursera site for marking.
##
##   Author: T Sloan
##   Date: 22nd June 2014
##
##############################################################################

###############################################################################
## Set the working directory on script author's home PC
## Comment out as appropriate
###############################################################################

courseProjDir <- 
    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//CourseProject"

###############################################################################
## Set the working directory on script author's laptop
## Comment out as appropriate
###############################################################################

#courseProjDir <- 
#  "C://Terry-Programming//Coursera//GettingCleaningData//CourseProject"

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
##    the merging order is the same across the R objects holding the training
##    and test data
## 2. Extracting the mean and standard deviation.
## 3. Creating a single R object containing the merged subject, y and X
##    data.
## 4. Add the column names 
###############################################################################

subject <- rbind(subjectTest, subjectTrain)
rm(subjectTest) # to tidy memory
rm(subjectTrain) # to tidy memory

y <- rbind(yTest, yTrain)
rm(yTest)
rm(yTrain)

###############################################################################
## Merge subject and y so that each row corresponds to a person performing
## an acivity. Give the columns a descriptive name.
###############################################################################

subjectActivity <- data.frame(PersonId = subject$V1, Activity = y$V1)

###############################################################################
## Convert the activity labels in the subject object to descriptive 
## activity names from the activity_labels.txt file.
###############################################################################

activityLabelsFile <-"./data/UCI HAR Dataset/activity_labels.txt"
activityLabels <- read.table(activityLabelsFile, header = FALSE)

labelname <- function(labelnum, activityLabels){
    activityLabels[activityLabels$V1 == labelnum,]$V2
} 
##############################################################################
## Add a new column to SubjectActivity to contain the descriptive name
## of the activity label. Populate this with the descriptive name
##############################################################################

subjectActivity["Name"]<-NA

for (i in 1:nrow(subjectActivity)){
    subjectActivity$Name[i] <- 
        as.character(
            labelname(subjectActivity$Activity[i], activityLabels)
        )
}

##############################################################################
# Merge the X data
##############################################################################

X <- rbind(XTest, XTrain)
rm(XTest)
rm(XTrain)

###############################################################################
# Read the features.txt file to get the column names for the X data
###############################################################################

featuresFile <-"./data/UCI HAR Dataset/features.txt"
features <- read.table(featuresFile, header = FALSE)

###############################################################################
## Extract only the measurements on the mean and standard deviation 
## for each measurement in the mereged X data.
## Determine which columns in the feature vector 
## contain the mean() or standard deviation std()
###############################################################################

colIndex<-grep("mean\\(\\)|std\\(\\)",features$V2)

###############################################################################
## Extract these columns and their corresponding column names from all the 
## feature vectors stored in the X object and the features object
###############################################################################

XSubset<-X[,colIndex]

XColnames<-as.character(features$V2[colIndex])

names(XSubset) <- XColnames

###############################################################################
## Combine the extracted columns with the subject and y objects
###############################################################################

tidydata <- data.frame(subjectActivity, XSubset)

###############################################################################
## tidydata has the following contents:
## column 1 = PersonId (Number 1 to 30)
## column 2 = Activity (Number 1 to 6)
## column 3 = Descriptive Name of Activity in column 2
## columns 3 to ncol(tidydata) = those columns from the feature vector 
##            whose name contains either the string "mean()" or "std()"
###############################################################################

###############################################################################
## Write out tidydata as a file
###############################################################################

tidydataFile <- "tidydata.csv"
if (file.exists(tidydataFile)){
  file.remove(tidydataFile)
}

tidydataFileCon<-file(tidydataFile,"w")
write.table(tidydata,tidydataFileCon,sep=",", row.names=FALSE)
close(tidydataFileCon)

###############################################################################
## From the tidydata data frame create a second, independent tidy data set 
## with the average of each variable for each activity and each subject. 
###############################################################################

NSUBJECTS <- 30   # the nmber of subjects (people) as specified in the 
                  # original input data
NACTIVITIES <- 6  # the number of activities as specified in the 
                  # original data
offset <- 3       # for the first columns of tidydata being the PersonId,
                  # Activty and Name.

nAverages <- length(XColnames)
for (i in 1:NSUBJECTS){
    temp<-tidydata[tidydata$PersonId==i,]    
    for (j in 1:NACTIVITIES){
       averages<- rep(NA, nAverages) # initialise a vector to 
                                     # hold the averages
       for (k in 1:nAverages){ 
           averages[k] <- mean(temp[temp$Activity==j,][,offset+k])     
       }
       tmpRow <- c(i,j,
                   as.character(labelname(j, activityLabels)),
                   averages)
       rm(averages)
       if (i ==1 & j==1){
           tidy2<-tmpRow
       }
       else{
           rows<-tidy2
           tidy2<-rbind(rows,tmpRow)
           rm(rows)
       }
       rm(tmpRow)
    }
}

###############################################################################
## Construct the column names for the tidy2 averages
###############################################################################

# construct the column names for the averages
avgColnames <- rep(NA,nAverages)
for (i in 1:nAverages){
  avgColnames[i] <- paste("Average-",XColnames[i],sep="")
}
tidy2Colnames <- c("PersonId", "Activity","Name", avgColnames)

## Make tidy2 a data frame and add the columns

tidy2df<-data.frame(tidy2,row.names=NULL)
names(tidy2df) <- tidy2Colnames

###############################################################################
## Write out tidy2df as a file
###############################################################################

tidy2dataFile <- "tidy2data.txt"
if (file.exists(tidy2dataFile)){
  file.remove(tidy2dataFile)
}

tidy2dataFileCon<-file(tidy2dataFile,"w")
write.table(tidy2df,tidy2dataFileCon,sep=" ", row.names=FALSE)
close(tidy2dataFileCon)


##############################################################################
## End of run_analysis.R
##############################################################################
