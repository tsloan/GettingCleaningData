##############################################################################
## 
## GetData.R: This script does the following:
##
##  1. Sets the working directory to the relevant directory on my home PC
##
##  2. Checks to see if the data from
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
##     has already been downloaded and  unzipped.
##
##  3. If the data has not previously been downloaded and unzipped, it
##     a) Downloads the data into the ./data directory
##     b) Adds the file cal "DateDataDownloaded" to the ./data directory 
##     c) Writes the current time and date into that file
##     d) unzips the .zip archive in the ./data directory
##
##############################################################################

###############################################################################
## Set path on home PC
###############################################################################

setwd(
    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//CourseProject")

###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data")){
    
    dir.create("data")
    
    ###########################################################################
    ## Download the file into the Create directory 
    ###########################################################################
    
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    download.file(fileUrl, destfile = "./data/Dataset.zip")
    
    ###########################################################################
    ## Add a file that contains the time and date the data is downloaded 
    ###########################################################################
    
    dateFileCon<-file("./data/DateDataDownloaded","w")
    dateDownloaded <- date()
    write(dateDownloaded,dateFileCon)
    close(dateFileCon)

    ###########################################################################
    ## Unzip the archive into ./data
    ###########################################################################
    
    setwd("./data")
    unzip("Dataset.zip")
    setwd("..")
       
}
