###############################################################################
## Question 1
## The American Community Survey distributes downloadable data about United 
## States communities. 
## Download the 2006 microdata survey about housing for the state of Idaho 
## using download.file() from here: 
##    
##    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 
##
## and load the data into R.
##
## The code book, describing the variable names is here: 
##     
##    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 
##
## Create a logical vector that identifies the households on greater than 
## 10 acres who sold more than $10,000 worth of agriculture products. 
## Assign that logical vector to the variable agricultureLogical. 
## Apply the which() function like this to identify the rows of the 
## data frame where the logical vector is TRUE. 
## which(agricultureLogical) 
##
##  What are the first 3 values that result?
##
###############################################################################
###############################################################################
## Set path on home PC
###############################################################################

setwd(
    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//Quiz-3")

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
## Create a logical vector that identifies the households on greater than 
## 10 acres who sold more than $10,000 worth of agriculture products. 
###############################################################################

###############################################################################
## The field "ACR" is "Lot size" and the value 3 in this indicates
## a ".House on ten or more acres".
## The field "AGS" is "Sales of Agriculture Products" and the value 6 in this
## indicates ".$10000+"
## Assign that logical vector to the variable agricultureLogical. 
###############################################################################

x <- data[(data$ACR == 3),]
y <- data[(data$AGS == 6),]

agricultureLogical <- ifelse(
    (data$ACR==3 & !is.na(data$ACR))
    & (data$AGS == 6 & !is.na(data$AGS)), 
    TRUE, FALSE
    )

#############################################################################
## Apply the which() function like this to identify the rows of the 
## data frame where the logical vector is TRUE. 
## which(agricultureLogical) 
##
##  What are the first 3 values that result?
##############################################################################

res<-which(agricultureLogical)
print(res[1:3])