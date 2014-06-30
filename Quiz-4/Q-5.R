#############################################################################
## Question 5
## 
## You can use the quantmod (http://www.quantmod.com/) package to get 
## historical stock prices for publicly traded companies on the NASDAQ and 
## NYSE. Use the following code to download data on Amazon's stock price and 
## get the times the data was sampled.
## library(quantmod)
## amzn = getSymbols("AMZN",auto.assign=FALSE)
## sampleTimes = index(amzn) 
##
## How many values were collected in 2012? 
## How many values were collected on Mondays in 2012?
## 
## 251, 47
## 252, 50
## 251,51
## 250, 47
##
##############################################################################
library(quantmod)

##############################################################################
## get the quantmod xts (real-time series) object for Amazon
##############################################################################
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) # this says when the time series started

#############################################################################
# Get the amazon 2012 data from this xts object
# (Note; this is using the example from the quantmod documentation to get
#  the data for a particular year)
# and count the number of rows
#############################################################################
amzn2012<- amzn['2012']
print(paste("Number of values collected in 2012 is ",nrow(amzn2012)))

##############################################################################
# How many values were collected on Mondays in 2012?
##############################################################################


