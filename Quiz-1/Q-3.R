###############################################################################
## Download the Excel spreadsheet on Natural Gas Aquisition Program 
## here: 
##
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 
##
## Read rows 18-23 and columns 7-15 into R and assign the result to a
## variable called:
##    dat 
## What is the value of
##    sum(dat$Zip*dat$Ext,na.rm=T) 
##
###############################################################################

library(xlsx)

###############################################################################
## Set path on my laptop
###############################################################################

setwd("C:\\Terry-Programming\\Coursera\\GettingCleaningData\\Quiz-1")


###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data-Q3")){
    
    dir.create("data-Q3")
    
    ###########################################################################
    ## Download the file into the Create directory 
    ###########################################################################
    
    fileUrl<-
        "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
    
    download.file(fileUrl, destfile = "./data-Q3/Gas.xlsx",mode="wb")
    
    list.files("./data-Q3")
    dateDownloaded <- date()
    dateDownloaded
}

###############################################################################
## Read rows 18-23 and columns 7-15 into R and assign the result to a
## variable called:
##    dat 
###############################################################################
colIndex<-7:15
rowIndex<-18:23 
dat <- read.xlsx("./data-Q3/Gas.xlsx", header=TRUE,sheetIndex=1,
                     colIndex=colIndex, rowIndex=rowIndex)

###############################################################################
## What is the value of
##    sum(dat$Zip*dat$Ext,na.rm=T) 
##
###############################################################################
DatSum<-sum(dat$Zip*dat$Ext,na.rm=T)
print(DatSum)
