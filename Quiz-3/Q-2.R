#############################################################################
##  Question 2
##
## Using the jpeg package read in the following picture of your 
## instructor into R 
##
##   https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 
## 
## Use the parameter native=TRUE. What are the 30th and 80th quantiles of 
## the resulting data? (some Linux systems may produce an answer 638 
##  different for the 30th quantile)
##   -15259150 -10575416
##   -16776430 -15390165
##   10904118 -594524
##  -10904118 -10575416
#############################################################################

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

if (!file.exists("data-Q2")){
  
  dir.create("data-Q2")
  
  ###########################################################################
  ## Download the file into the Create directory 
  ###########################################################################
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  
  download.file(fileUrl, destfile = "./data-Q2/jeff.jpg", mode="wb")
  # note need mode="wb" to download the file properly in binary. pdf's
  # images, xslx and the like often need this mode
  list.files("./data-Q2")
  dateDownloaded <- date()
  dateDownloaded
}
library(jpeg)

jpegfile <- "./data-Q2/jeff.jpg"
image<-readJPEG(jpegfile, native = TRUE)
print(quantile(image,probs=c(0.3,0.8,1),na.rm=TRUE))
