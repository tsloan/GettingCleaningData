###############################################################################
## 
## The sqldf package allows for execution of SQL commands on R data frames. 
## We will use the sqldf package to practice the queries we might send with 
## the dbSendQuery command in RMySQL. Download the American Community Survey 
## data and load it into an R object called
##   acs
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
##
## Which of the following commands will select only the data for the 
## probability weights pwgtp1 with ages less than 50?
##
## 1. sqldf("select * from acs where AGEP < 50 and pwgtp1")
## 2. sqldf("select * from acs where AGEP < 50")
## 3. sqldf("select * from acs")
## 4. sqldf("select pwgtp1 from acs where AGEP < 50")
##
###############################################################################

library(sqldf)

###############################################################################
## Set path on our home PC
###############################################################################

setwd("C:\\Terry-R-stuff\\Coursera-R\\GettingAndCleaningData\\GettingCleaningData\\Quiz-2")

###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data-Q2")){
    
    dir.create("data-Q2")
    
    ###########################################################################
    ## Download the file into the Create directory 
    ###########################################################################
    
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    
    download.file(fileUrl, destfile = "./data-Q2/USCommunitySurvey.csv")
    
    list.files("./data-Q2")
    dateDownloaded <- date()
    dateDownloaded
}

###############################################################################
## Load the data into a data frame
###############################################################################

acs <- read.csv("./data-Q2/USCommunitySurvey.csv", header=TRUE,)

###############################################################################
## Which of the following commands will select only the data for the 
## probability weights pwgtp1 with ages less than 50?
###############################################################################

###############################################################################
## Let's do this in R first
###############################################################################

agelessthan50<-acs[acs$AGEP < 50,]
agelessthan50$pwgtp1

###############################################################################
## sqldf("select pwgtp1 from acs where AGEP < 50")
###############################################################################
result<-sqldf("select pwgtp1 from acs where AGEP < 50")

# compare the two resuls to see if they contain the same values

print(all(agelessthan50$pwgtp1 == result))

