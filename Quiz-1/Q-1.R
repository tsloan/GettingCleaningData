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



getdata.data.ss06hid <-
read.csv("C:/Terry-R-stuff/Coursera-R/GettingAndCleaningData/Quiz-1/getdata-data-ss06hid.csv")
download.file(
    "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
    destfile)
#data<-getdata.data.ss06hid
#data<-read.csv(getdata.data.ss06hid.csv)
bad<-is.na(data$VAL)
gooddata <- data[!bad,]
nrow(gooddata)
nrow(gooddata[gooddata$VAL==24,])