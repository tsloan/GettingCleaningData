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
## What is the equivalent function to unique(acs$AGEP) ?
##
## 1. sqldf("select distinct pwgtp1 from acs")
## 2. sqldf("select unique AGEP from acs")
## 3. sqldf("select distinct AGEP from acs")
## 4. sqldf("select AGEP where unique from acs")
##
###############################################################################

library(sqldf)

###############################################################################
## Set path on our home PC
###############################################################################

setwd("C:\\Terry-R-stuff\\Coursera-R\\GettingAndCleaningData\\GettingCleaningData\\Quiz-2")

###############################################################################
## Create directory to hold the data - Uses the same data as Q-2.R
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
## What is the equivalent function to unique(acs$AGEP) ?
###############################################################################

###############################################################################
## Let's do this in R first
###############################################################################

UniqueRes<-unique(acs$AGEP)

###############################################################################
## 1. sqldf("select distinct pwgtp1 from acs")
###############################################################################
res1<-sqldf("select distinct pwgtp1 from acs")

# compare the two results to see if they contain the same values

print( '## 1. sqldf("select distinct pwgtp1 from acs")' )
print(all(UniqueRes == res1))

###############################################################################
## 2. sqldf("select unique AGEP from acs")
###############################################################################
# res2<-sqldf("select unique AGEP from acs")
# above invalid SQL statement 

###############################################################################
## 3. sqldf("select distinct AGEP from acs")
###############################################################################
res3<-sqldf("select distinct AGEP from acs")

# compare the two results to see if they contain the same values

print( '## 3. sqldf("select distinct AGEP from acs")' )
print(all(UniqueRes == res3))

###############################################################################
## 4. sqldf("select AGEP where unique from acs")
###############################################################################
# res4<-sqldf("select AGEP where unique from acs")
# above is invalid SQL statement


