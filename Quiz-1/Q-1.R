###############################################################################
## The American Community Survey distributes downloadable data about 
## United States communities. Download the 2006 microdata survey about 
## housing for the state of Idaho using download.file() from here: 
##    
##    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
##
## and load the data into R. The code book, describing the variable 
## names is here: 
##
##    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
## 
## How many housing units in this survey were worth more than $1,000,000?
##
###############################################################################

###############################################################################
## Set path on my laptop
###############################################################################

setwd("C:\\Terry-Programming\\Coursera\\GettingCleaningData\\Quiz-1")

###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data-Q1")){
    
    dir.create("data-Q1")
    
    ###########################################################################
    ## Download the file into the Create directory 
    ###########################################################################
    
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    
    download.file(fileUrl, destfile = "./data-Q1/USCommunitySurvey.csv")
    
    list.files("./data-Q1")
    dateDownloaded <- date()
    dateDownloaded
}

###############################################################################
## Load the data into a data frame
###############################################################################

SurveyData <- read.csv("./data-Q1/USCommunitySurvey.csv", header=TRUE,)

###############################################################################
# Property Value is in the VAL field
# houses of $1M or over have the field value 24
###############################################################################

bad<-is.na(SurveyData$VAL)
SurveyData <- SurveyData[!bad,]

houses<-nrow(SurveyData[SurveyData$VAL == 24,])

print(houses)

