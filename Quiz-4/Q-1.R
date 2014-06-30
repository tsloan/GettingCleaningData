##############################################################################
## Question 1
##
## The American Community Survey distributes downloadable data about United
## States communities. Download the 2006 microdata survey about housing for 
## the state of Idaho using download.file() from here: 
##  
##    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
##
##  and load the data into R. The code book, describing the variable names 
##  is here: 
##  
##   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
##
## Apply strsplit() to split all the names of the data frame on the 
##  characters "wgtp". 
## What is the value of the 123 element of the resulting list?
##  "wgt" "15"
##  "" "15"
##  "15"
##  "wgtp" "15"
###############################################################################

###############################################################################
## Set path on home PC or laptop
###############################################################################

#setwd(
#    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//Quiz-3")
setwd(
  "C://Terry-Programming//Coursera//GettingCleaningData//Quiz-4")

###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data-Q1")){
  
  dir.create("data-Q1")
  
  ###########################################################################
  ## Download the file into the Create directory 
  ###########################################################################
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  
  download.file(fileUrl, destfile = "./data-Q1/fss06hid.csv")
  
  list.files("./data-Q1")
  dateDownloaded <- date()
  dateDownloaded
}

###############################################################################
## Load the data into a data frame
###############################################################################

data<-read.csv("./data-Q1/fss06hid.csv", 
               header=TRUE)

###############################################################################
## Get the column names, 
###############################################################################

colnames<-names(data)

splitNames<-strsplit(colnames,"wgtp")

###############################################################################
## Get the contents of the 123 element 
###############################################################################

print(splitNames[[123]])
 
