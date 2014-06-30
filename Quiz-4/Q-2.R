##############################################################################
## Question 2
##
## Load the Gross Domestic Product data for the 190 ranked countries in 
## this data set: 
##  
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
##
## Remove the commas from the GDP numbers in millions of dollars and 
## average them. What is the average? 
##
##  Original data sources: 
##      http://data.worldbank.org/data-catalog/GDP-ranking-table
##
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
## tidy up the data
###############################################################################

rankedCountries <- 
  rankedCountries[rankedCountries$Ranking != "",] # remove blank lines

rankedCountries$Ranking <- 
  as.numeric(rankedCountries$Ranking) # convert to numeric

rankedCountries<-
  rankedCountries[rankedCountries$Ranking != "NA",] # remove rows with NA rankings

# remove those rows without a ranking between 1 and 190
rankedCountries<-rankedCountries[rankedCountries$Ranking %in% 1:190,] 

###############################################################################
## Remove the , from the values in the GDP column
## and calculate its average
###############################################################################

rankedCountries$GDP<-as.numeric(gsub(",","",rankedCountries$GDP))

print(mean(rankedCountries$GDP))


