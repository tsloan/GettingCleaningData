#############################################################################
## Question 3
## Load the Gross Domestic Product data for the 190 ranked countries in 
## this data set: 
##  
##  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
##
## Load the educational data from this data set: 
##  
##   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
##
## Match the data based on the country shortcode. 
## How many of the IDs match? Sort the data frame in descending order by 
## GDP rank (so United States is last). What is the 13th country in the 
## resulting data frame? 
##
## Original data sources: 
##   http://data.worldbank.org/data-catalog/GDP-ranking-table 
##   http://data.worldbank.org/data-catalog/ed-stats
## 
## 189, Spain
## 234, St. Kitts and Nevis
## 190, St. Kitts and Nevis
## 234, Spain
## 189, St. Kitts and Nevis
## 190, Spain
##############################################################################
###############################################################################
## Set path on home PC or laptop
###############################################################################

#setwd(
#    "C://Terry-R-stuff//Coursera-R//GettingAndCleaningData//GettingCleaningData//Quiz-3")
setwd(
  "C://Terry-Programming//Coursera//GettingCleaningData//Quiz-3")

###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data-Q3")){
  
  dir.create("data-Q3")
  
  ###########################################################################
  ## Download the file into the Create directory 
  ###########################################################################
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileUrl, destfile = "./data-Q3/FGDP.csv")

  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileUrl, destfile = "./data-Q3/FEDSTATS_Country.csv")
  
  list.files("./data-Q3")
  dateDownloaded <- date()
  dateDownloaded
}

# need to skip the first four lines of this
gdp<-read.csv("./data-Q3/FGDP.csv", skip=4, header=TRUE, 
              stringsAsFactors=FALSE)

#need to skip the blank lines
edstats <-read.csv("./data-Q3/FEDSTATS_Country.csv", 
                   blank.lines.skip=TRUE,
                   header=TRUE,
                   stringsAsFactors=FALSE)

##############################################################################
## Match the data based on the country shortcode.
##
## the edstats$countrycode and gdp$X are the fields
## containing country shortcode 
## the all.x = FALSE removes any rows where there is no matching output
##############################################################################

mergeData<-merge(edstats,gdp, by.x="CountryCode", by.y="X",all.x=FALSE)

# extract just the relevant fields
sdf <- data.frame(Code=mergeData$CountryCode, 
                  CountryName=mergeData$Long.Name,
                    Ranking=mergeData$X.1,
                  IncomeGroup=mergeData$Income.Group,
                  stringsAsFactors=FALSE)

#############################################################################
## How many of the IDs match?
#############################################################################

print(paste("number of ID matches  is ",nrow(sdf), 
            " but not all have gdp rank data") )
print("after removing countries where there is no gdp rank data")

sdf<-sdf[(sdf$Ranking != ""),]

print(paste("number of ID matches  is ", nrow(sdf) ) )

#############################################################################
## Sort the data frame in descending order by GDP rank 
## (so United States is last). 
## What is the 13th country in the resulting data frame? 
#############################################################################

sdfrank<-sdf[order(- as.numeric(sdf$Ranking)),]
print(paste("13th rank nation is ", sdfrank[13,2]))

#############################################################################
## Question 4
## 
## What is the average GDP ranking for the 
## "High income: OECD" and 
## "High income: nonOECD" group?
##  See Q-3.R 
############################################################################

spIns<-split(as.numeric(sdf$Ranking),sdf$IncomeGroup)
print(lapply(spIns,mean))

#############################################################################
## Question 5
##
## Cut the GDP ranking into 5 separate quantile groups. 
## Make a table versus Income.Group. 
## How many countries are Lower middle income but among the 38 nations 
## with highest GDP?
##
##  See Q-3.R
#############################################################################

# coerce Ranking into a numeric
sdf$Ranking<-as.numeric(sdf$Ranking)

# cut the GDP ranking into 5 seperate groups with a 
# boundary for the top 38 

sdf$gdpquants = cut(sdf$Ranking, 
                    breaks = c(1,38, 100, 150, 190) )
                    
# create a logical indicating if a country is in the lower middle income
# group
sdf$LMI <- sdf$IncomeGroup %in% c("Lower middle income")
# create a table to get the answer
print(table(sdf$LMI,sdf$gdpquants))
