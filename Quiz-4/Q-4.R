#############################################################################
## Question 4
##
## Load the Gross Domestic Product data for the 190 ranked countries in 
## this data set: 
##  
##    https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
##
## Load the educational data from this data set: 
##  
##   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
##
## Match the data based on the country shortcode. 
## Of the countries for which the end of the fiscal year is available, 
## how many end in June? 
##
## Original data sources: 
##   http://data.worldbank.org/data-catalog/GDP-ranking-table 
##   http://data.worldbank.org/data-catalog/ed-stats
## 31
## 8
## 13
## 16
##
##############################################################################

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

if (!file.exists("data-Q4")){
  
  dir.create("data-Q4")
  
  ###########################################################################
  ## Download the GDP data file into the Create directory 
  ###########################################################################
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  download.file(fileUrl, destfile = "./data-Q4/GDP.csv")
  
  ###########################################################################
  ## Download the educational data into the Create directory 
  ###########################################################################
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  download.file(fileUrl, destfile = "./data-Q4/EDSTATS.csv")
  
  list.files("./data-Q4")
  dateDownloaded <- date()
  dateDownloaded
}

###############################################################################
## Load the GDP data for the 190 ranked countries into a data frame
###############################################################################

GDPdata<-read.csv("./data-Q4/GDP.csv", 
               header=FALSE,
               skip=5,
               stringsAsFactors=FALSE,
               blank.lines.skip=TRUE)

###############################################################################
## Extract just the countries with a ranking
## Col 1 = country short name
## Col 2 = ranking
## Col 3 = 
## Col 4 = country long name
## Col 5 = gross domestic product in millions of dollars
###############################################################################

GDPrank <- data.frame(GDPdata$V1,GDPdata$V2,GDPdata$V4,GDPdata$V5,
                      stringsAsFactors=FALSE)
names(GDPrank)<-(c("Code","Ranking","Country","GDP"))

###############################################################################
## tidy up the GDP data
###############################################################################

GDPrank <- 
  GDPrank[GDPrank$Ranking != "",] # remove blank lines

GDPrank$Ranking <- 
  as.numeric(GDPrank$Ranking) # convert to numeric

GDPrank<-
  GDPrank[GDPrank$Ranking != "NA",] # remove rows with NA rankings

# remove those rows without a ranking between 1 and 190
GDPrank<-GDPrank[GDPrank$Ranking %in% 1:190,] 

###############################################################################
## Load the educational data into a data frame
###############################################################################

edstats<-read.csv("./data-Q4/EDSTATS.csv", 
                  header=TRUE,
                  stringsAsFactors=FALSE,
                  blank.lines.skip=TRUE)

##############################################################################
## Match the data based on the country shortcode.
##
## the edstats$CountryCode and GDPrank$Code are the fields
## containing country shortcode 
## the all.x = FALSE removes any rows where there is no matching output
##############################################################################

mergeData<-merge(edstats, GDPrank, 
                 by.x="CountryCode", by.y="Code",all.x=FALSE)

##############################################################################
## Extract those rows where end of the fiscal year is in June
##
## Special.Notes column contains free text which often has something
## about the fiscal year
##
##############################################################################

june<-mergeData[grepl("^[Ff]iscal year end.*[Jj]une", mergeData$Special.Notes),]
print(june$Special.Notes)
print(
  paste("number of countries where June is end of fiscal year is ",
            nrow(june)
        )
  )

