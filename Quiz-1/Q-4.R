###############################################################################
## Read the XML data on Baltimore restaurants from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 
##
## How many restaurants have zipcode 21231?
##
###############################################################################
library(XML)

###############################################################################
## Set path on my laptop
###############################################################################

setwd("C:\\Terry-Programming\\Coursera\\GettingCleaningData\\Quiz-1")

###############################################################################
## Read the XML file into R
###############################################################################
    
fileUrl<-
    "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

doc <- xmlTreeParse(fileUrl,useInternal=TRUE)

dateDownloaded <- date()
dateDownloaded

###############################################################################
## Get the rootnode for the XML file 
###############################################################################

rootNode <- xmlRoot(doc)

###############################################################################
## Get all the Zipcode values 
###############################################################################

zipcodes<-xpathSApply(rootNode,"//zipcode",xmlValue)

###############################################################################
## How many restaurants have zipcode 21231?
###############################################################################

print(zipcodes[zipcodes == 21231])

print(length(zipcodes[zipcodes == 21231]))
