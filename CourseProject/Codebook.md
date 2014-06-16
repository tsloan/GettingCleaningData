Codebook.md
===========

This file is code book for the tidy data set I produced as part of the Course
Project of the Coursera Getting And Cleaning Data Course.

The original data for this Course Project came from 

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This code book describes 
- the variables, 
- the data, 
- and transformations or work that I have performed to clean up this data. 

Here are the steps that describe the work I have undertaken to the clean this 
data.

1. The GetData.R script in this directory has been called to download the 
required data.  The GetData.R script does the following
    - Sets the working directory 
    - Checks to see if the data from
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has already been downloaded and  unzipped.
    - If the data has not previously been downloaded and unzipped, it
        * Downloads the data into the ./data directory
        * Adds the file cal "DateDataDownloaded" to the ./data directory 
        * Writes the current time and date into that file
        * unzips the .zip archive in the ./data directory
        
2. The run_analysis.R script merges the training and the test sets to create one data set as follows.
    -  The original training set is held in the directory with 
    relative path "./data/UCI HAR Dataset/train". This contains the
    following files: 
        * subject_train.txt - In this, each row identifies the 
        subject who performed the activity in the window sample
        corresponding to that row. Its range of possible values 
        is from 1 to 30. 
        * y_train.txt - Here, each row contains a label for the 
        activity undertaken by the subject in the 
        window sample corresponding to that row. 
        * X_train.txt - each row contains the 561 feature vector
        for a window sample. This is the window sample for the
        subject in the corresponding row in subject_train.txt
        performing the activity stated in the corresponding row 
        in y_train.txt.
    - The original test set is held in the directory with relative
    path "./data/UCI HAR Dataset/test". This contains the
    corresponding subject, y and X files for the test data, that 
    is: 
      * subject_test.txt
      * y_test.txt
      * X_test.txt
Within run_analysis.R, these training and test files are each read into an R object. The subject_test and subject_train data  are then combined into a new R object where the test data appear first. The same process occurs for the    
