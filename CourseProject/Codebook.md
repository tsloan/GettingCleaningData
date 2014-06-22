Codebook.md
===========

This file is code book for the tidy2data.txt and tidydata.csv files created 
by this author using the GetData.R and run_analysis.R scripts in this 
directory.

These files were produced as part of the Course Project of the Coursera 
Getting And Cleaning Data Course June 2014.

The original data for this Course Project came from 

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Contents and Format of tidy2data.txt
------------------------------------

This is a text file containing a table where each column name and its values are seperated by a single space. This file was produced as the final output of the
run_analysis.R script.

The first line of the file contains the column names. The subsequent lines 
are the table rows containing the values.  

The column names and their contents are as follows.

+ "PersonId" : a number between 1 and 30 corresponding to a subject who undertook
             the study 
+ "Activity" : a number between 1 and 6 that signifies an activity undertaken
             by the corresponding subject in the PersonId field.
+ "Name" : a character string describes the activity in the corresponding 
           Activity. That is,  
    + Activity "1"  has the Name "WALKING"
    + "2" is "WALKING_UPSTAIRS"
    + "3" is "WALKING_DOWNSTAIRS"
    + "4" is "SITTING"
    + "5" is "STANDING"
    + "6" is "LAYING"
+ all the subsequent colums are the Average (ie mean) of a particular mean or 
standard deviation of a measurement taken when the subject indicated by 
PersonId was undertaking the corresponding activity indicated by 
Activity and Name. The measurements, from which these averages were derived, 
were taken by the embedded accelerometer and gyroscope of a Samsung Galaxy S II
smartphone worn on the subject's waist. The column name contains the 
measurment name from the original collected data but with the prefix 
"Average_" added. Further information on these original measurements and the 
study where they were collected is in the README.txt that is available with the original data at 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Here are the subsequent column names in tidy2data.txt
+ "Average-tBodyAcc-mean()-X" 
+ "Average-tBodyAcc-mean()-Y" 
+ "Average-tBodyAcc-mean()-Z" 
+ "Average-tBodyAcc-std()-X" 
+ "Average-tBodyAcc-std()-Y" 
+ "Average-tBodyAcc-std()-Z" 
+ "Average-tGravityAcc-mean()-X" 
+ "Average-tGravityAcc-mean()-Y" 
+ "Average-tGravityAcc-mean()-Z" 
+ "Average-tGravityAcc-std()-X" 
+ "Average-tGravityAcc-std()-Y" 
+ "Average-tGravityAcc-std()-Z" 
+ "Average-tBodyAccJerk-mean()-X" 
+ "Average-tBodyAccJerk-mean()-Y" 
+ "Average-tBodyAccJerk-mean()-Z" 
+ "Average-tBodyAccJerk-std()-X" 
+ "Average-tBodyAccJerk-std()-Y" 
+ "Average-tBodyAccJerk-std()-Z" 
+ "Average-tBodyGyro-mean()-X" 
+ "Average-tBodyGyro-mean()-Y" 
+ "Average-tBodyGyro-mean()-Z" 
+ "Average-tBodyGyro-std()-X" 
+ "Average-tBodyGyro-std()-Y" 
+ "Average-tBodyGyro-std()-Z" 
+ "Average-tBodyGyroJerk-mean()-X" 
+ "Average-tBodyGyroJerk-mean()-Y" 
+ "Average-tBodyGyroJerk-mean()-Z" 
+ "Average-tBodyGyroJerk-std()-X" 
+ "Average-tBodyGyroJerk-std()-Y" 
+ "Average-tBodyGyroJerk-std()-Z" 
+ "Average-tBodyAccMag-mean()" 
+ "Average-tBodyAccMag-std()" 
+ "Average-tGravityAccMag-mean()" 
+ "Average-tGravityAccMag-std()" 
+ "Average-tBodyAccJerkMag-mean()" 
+ "Average-tBodyAccJerkMag-std()" 
+ "Average-tBodyGyroMag-mean()" 
+ "Average-tBodyGyroMag-std()" 
+ "Average-tBodyGyroJerkMag-mean()" 
+ "Average-tBodyGyroJerkMag-std()" 
+ "Average-fBodyAcc-mean()-X" 
+ "Average-fBodyAcc-mean()-Y" 
+ "Average-fBodyAcc-mean()-Z" 
+ "Average-fBodyAcc-std()-X" 
+ "Average-fBodyAcc-std()-Y" 
+ "Average-fBodyAcc-std()-Z" 
+ "Average-fBodyAccJerk-mean()-X" 
+ "Average-fBodyAccJerk-mean()-Y" 
+ "Average-fBodyAccJerk-mean()-Z" 
+ "Average-fBodyAccJerk-std()-X" 
+ "Average-fBodyAccJerk-std()-Y" 
+ "Average-fBodyAccJerk-std()-Z" 
+ "Average-fBodyGyro-mean()-X" 
+ "Average-fBodyGyro-mean()-Y" 
+ "Average-fBodyGyro-mean()-Z" 
+ "Average-fBodyGyro-std()-X" 
+ "Average-fBodyGyro-std()-Y" 
+ "Average-fBodyGyro-std()-Z" 
+ "Average-fBodyAccMag-mean()" 
+ "Average-fBodyAccMag-std()" 
+ "Average-fBodyBodyAccJerkMag-std()" 
+ "Average-fBodyBodyGyroMag-mean()" 
+ "Average-fBodyBodyGyroMag-std()" 
+ "Average-fBodyBodyGyroJerkMag-mean()" 
+ "Average-fBodyBodyGyroJerkMag-std()"

Transformations to produce tidy2data.txt
----------------------------------------

1. The GetData.R script in this directory has been executed to download the 
required data.  The GetData.R script does the following
    - Sets the working directory 
    - Checks to see if the data from
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has already been downloaded and  unzipped.
    - If the data has not previously been downloaded and unzipped, it
        * Downloads the data into the ./data directory
        * Adds the file cal "DateDataDownloaded" to the ./data directory 
        * Writes the current time and date into that file
        * unzips the .zip archive in the ./data directory

2. The run_analysis.R has been executed to clean and transform the downloaded
  data as follows.
    - assumes this UCI HAR Samsung training and test data are located
       contained in the sub-directories  ./data/UCI HAR Dataset/train
       and ./data/UCI HAR Dataset/test, respectively, of the 
       working directory.  (For the purposes of the course project, the script
       sets the working directory to an appropriate one on the script author's
       available machines. These can be commented out as appropriate.)
    - Merges the training files 
      - subject_train.txt
      - y_train.txt
      - X_train.txt    
    - and the test files 
      - subject_test.txt
      - y_test.txt
      - X_test.txt     
    - to create one data set.
    - In the subject_(train|test).txt files, each row identifies the subject 
       who performed the activity in the window sample corresponding to that 
       row. The window samples are held in the X_(train|test).txt files.
       The range of possible values in the subject_ files is from 1 to 30. 
    - In the y_(train|test).txt files, each row contains a label for the 
      activity undertaken by the subject in the window sample 
       corresponding to that row. A label can take a value between 1 and 6.
    - In the X_(train|test).txt files, each row contains the 561 feature vector
      for a window sample. This is the window sample for the
      subject in the corresponding row in subject_(train|test).txt files
      performing the activity stated in the corresponding row 
      in y_(train|test).txt file. Each of the 561 features in the vector
      corresponds to a measurement from the Samsung worn on the subject.
    - run_analysis.R extracts only those features containing the mean or 
      standard deviation for measurements from the merged training 
      and testing data. This is done by examining the 
      ./data/UCI HAR Dataset/features.txt and
      extracting those fields that contain the strings "mean()" or
      "std()" in their names.  These fields are then extracted from the
      merged data.
    - Uses the activity labels from ./data/UCI HAR Dataset/activity_labels.txt
      to create descriptive activity names to name the activities in the
      merged data set
    - Labels the data set with descriptive variable names, the field names
      for the "mean()" and "std()" are the same as their names in ./data/UCI HAR Dataset/features.txt
    - This merged data set is written out to file called "tidydata.csv" in the
      working directory.  The data is written in a comman separated value 
      (i.e. csv) format. This data set is tidy since it has descriptive
      variable names and one observation per row.
    - This finally creates a creates a second, independent tidy data set 
      with the average of each "mean()" and "std()" field for each activity 
      and each subject. 
    - The names of the "mean()" and "std" fields in this second tidy dataset
      are the same as in the first tidy data set but with the prefix "Average-"
    - This second tidy data set is written to the working directory as a space
      delimited file called "tidy2data.txt". This format and naming convention 
      is used to ensure that it can be uploaded to the Coursera site for marking.

Contents and Format of tidydata.csv
-----------------------------------

This the intermediate tidy data set produced by run_analysis.R on the way to 
creating the tidy2data.txt file. It is comma separated value (csv) where
that contains a table where the first line is the column names and each 
subsequent line is a row of the table.

The column names and their contents are as follows.

+ "PersonId" : a number between 1 and 30 corresponding to a subject who undertook
             the study 
+ "Activity" : a number between 1 and 6 that signifies an activity undertaken
             by the corresponding subject in the PersonId field.
+ "Name" : a character string describes the activity in the corresponding 
           Activity. That is,  
    + Activity "1"  has the Name "WALKING"
    + "2" is "WALKING_UPSTAIRS"
    + "3" is "WALKING_DOWNSTAIRS"
    + "4" is "SITTING"
    + "5" is "STANDING"
    + "6" is "LAYING"
+ all the subsequent colums are the mean or standard deviation of a measurement 
taken when the subject indicated by PersonId was undertaking the corresponding activity indicated by Activity and Name. Each subject(PersonId) performed
each Activity a number of times. There are therefore a number of rows where 
the PersonId, Activity and Name are the same but the subsequent values 
are for a different occurence of that particular activity that PersonId.
The measurements were taken by the embedded accelerometer and gyroscope of 
a Samsung Galaxy S II smartphone worn on the subject's waist. The column name 
contains the measurment name from the original collected data.
Further information on these original measurements and the study where they
were collected is in the README.txt that is available with the original data
at 
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Here are the subsequent column names in tidydata.csv
+ "tBodyAcc-mean()-X" 
+ "tBodyAcc-mean()-Y" 
+ "tBodyAcc-mean()-Z" 
+ "tBodyAcc-std()-X" 
+ "tBodyAcc-std()-Y" 
+ "tBodyAcc-std()-Z" 
+ "tGravityAcc-mean()-X" 
+ "tGravityAcc-mean()-Y" 
+ "tGravityAcc-mean()-Z" 
+ "tGravityAcc-std()-X" 
+ "tGravityAcc-std()-Y" 
+ "tGravityAcc-std()-Z" 
+ "tBodyAccJerk-mean()-X" 
+ "tBodyAccJerk-mean()-Y" 
+ "tBodyAccJerk-mean()-Z" 
+ "tBodyAccJerk-std()-X" 
+ "tBodyAccJerk-std()-Y" 
+ "tBodyAccJerk-std()-Z" 
+ "tBodyGyro-mean()-X" 
+ "tBodyGyro-mean()-Y" 
+ "tBodyGyro-mean()-Z" 
+ "tBodyGyro-std()-X" 
+ "tBodyGyro-std()-Y" 
+ "tBodyGyro-std()-Z" 
+ "tBodyGyroJerk-mean()-X" 
+ "tBodyGyroJerk-mean()-Y" 
+ "tBodyGyroJerk-mean()-Z" 
+ "tBodyGyroJerk-std()-X" 
+ "tBodyGyroJerk-std()-Y" 
+ "tBodyGyroJerk-std()-Z" 
+ "tBodyAccMag-mean()" 
+ "tBodyAccMag-std()" 
+ "tGravityAccMag-mean()" 
+ "tGravityAccMag-std()" 
+ "tBodyAccJerkMag-mean()" 
+ "tBodyAccJerkMag-std()" 
+ "tBodyGyroMag-mean()" 
+ "tBodyGyroMag-std()" 
+ "tBodyGyroJerkMag-mean()" 
+ "tBodyGyroJerkMag-std()" 
+ "fBodyAcc-mean()-X" 
+ "fBodyAcc-mean()-Y" 
+ "fBodyAcc-mean()-Z" 
+ "fBodyAcc-std()-X" 
+ "fBodyAcc-std()-Y" 
+ "fBodyAcc-std()-Z" 
+ "fBodyAccJerk-mean()-X" 
+ "fBodyAccJerk-mean()-Y" 
+ "fBodyAccJerk-mean()-Z" 
+ "fBodyAccJerk-std()-X" 
+ "fBodyAccJerk-std()-Y" 
+ "fBodyAccJerk-std()-Z" 
+ "fBodyGyro-mean()-X" 
+ "fBodyGyro-mean()-Y" 
+ "fBodyGyro-mean()-Z" 
+ "fBodyGyro-std()-X" 
+ "fBodyGyro-std()-Y" 
+ "fBodyGyro-std()-Z" 
+ "fBodyAccMag-mean()" 
+ "fBodyAccMag-std()" 
+ "fBodyBodyAccJerkMag-std()" 
+ "fBodyBodyGyroMag-mean()" 
+ "fBodyBodyGyroMag-std()" 
+ "fBodyBodyGyroJerkMag-mean()" 
+ "fBodyBodyGyroJerkMag-std()"

END OF Codebook.md
==================


