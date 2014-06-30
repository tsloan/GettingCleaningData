#############################################################################
## Question 3
## 
## In the data set from Question 2 what is a regular expression that would 
## allow you to count the number of countries whose name begins with 
## "United"? Assume that the variable with the country names in it is 
## named countryNames. How many countries begin with United?
## 
## grep("*United",countryNames), 5
## grep("^United",countryNames), 3
## grep("United$",countryNames), 3
## grep("*United",countryNames), 2
##
#############################################################################

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

if (!file.exists("data-Q2")){
  
  dir.create("data-Q2")
  
  ###########################################################################
  ## Download the file into the Create directory 
  ###########################################################################
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  
  download.file(fileUrl, destfile = "./data-Q2/GDP.csv")
  
  list.files("./data-Q2")
  dateDownloaded <- date()
  dateDownloaded
}

###############################################################################
## Load the data into a data frame
###############################################################################

data<-read.csv("./data-Q2/GDP.csv", 
               header=FALSE,
               skip=5,
               stringsAsFactors=FALSE,
               blank.lines.skip=TRUE)

###############################################################################
## Set the Colum names  
###############################################################################

###############################################################################
## Extract just the countries with a ranking
## Col 1 = country short name
## Col 2 = ranking
## Col 3 = 
## Col 4 = country long name
## Col 5 = gross domestic product in millions of dollars
###############################################################################

rankedCountries <- data.frame(data$V1,data$V2,data$V4,data$V5,
                              stringsAsFactors=FALSE)
names(rankedCountries)<-(c("Code","Ranking","Country","GDP"))

###############################################################################

countryNames <- rankedCountries$Country

# This grep gets those elements of countryNames whose contents
# begin with"United". The ^ indicates the beginning

grep("^United",countryNames)

