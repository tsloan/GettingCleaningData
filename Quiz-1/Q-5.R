###############################################################################
## The American Community Survey distributes downloadable data about United 
## States communities. Download the 2006 microdata survey about housing for
## the state of Idaho using download.file() from here: 
##
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
##
## using the fread() command load the data into an R object
##  DT
## 
## Which of the following is the fastest way to calculate the average value of 
## the variable
##   pwgtp15 
## broken down by sex using the data.table package?
##
## 1. mean(DT$pwgtp15,by=DT$SEX)
## 2. mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
## 3. rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
## 4. DT[,mean(pwgtp15),by=SEX]
## 5. tapply(DT$pwgtp15,DT$SEX,mean)
## 6. sapply(split(DT$pwgtp15,DT$SEX),mean)

###############################################################################
library(data.table)
NITERS <- 30

###############################################################################
## Set path on my laptop
###############################################################################

setwd("C:\\Terry-Programming\\Coursera\\GettingCleaningData\\Quiz-1")

###############################################################################
## Create directory to hold the data
###############################################################################

if (!file.exists("data-Q5")){
    
    dir.create("data-Q5")
    
    ###########################################################################
    ## Download the file into the Create directory 
    ###########################################################################
    
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    
    download.file(fileUrl, destfile = "./data-Q5/USCommunitySurvey.csv")
    
    list.files("./data-Q5")
    dateDownloaded <- date()
    dateDownloaded
}

###############################################################################
## using the fread() command load the data into an R object
##    DT
###############################################################################

DT <- fread("./data-Q5/USCommunitySurvey.csv", header=TRUE,)
print(nrow(DT))

###############################################################################
# Extract the records for the state of Idaho
###############################################################################

stateCode = 16
# remove all the records where 
bad<-is.na(DT$ST)
DT <- DT[!bad,]

DT <- DT[DT$ST == stateCode,]
print(nrow(DT))

###############################################################################
# calculate the average value of 
# the variable
#     pwgtp15 
# broken down by sex using the data.table package?
###############################################################################

print("overall mean")
print( mean(DT$pwgtp15) )
male <- copy(DT)
male <- male[male$SEX == 1,]
print("mean for SEX==1")
print(male[ , list( mean(male$pwgtp15) ) ])

female <- copy(DT)
female <- female[female$SEX == 2,]
print("mean for SEX==2")
print(female[ , list( mean(female$pwgtp15) ) ])

###############################################################################
# 
# Which of the following is the fastest way to calculate the average value of 
# the variable
#     pwgtp15 
# broken down by sex using the data.table package?
# 1. mean(DT$pwgtp15,by=DT$SEX)
# 2. mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
# 3. rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# 4. DT[,mean(pwgtp15),by=SEX]
# 5. tapply(DT$pwgtp15,DT$SEX,mean)
# 6. sapply(split(DT$pwgtp15,DT$SEX),mean)
###############################################################################

#print ("1. mean(DT$pwgtp15,by=DT$SEX)")
#print(mean(DT$pwgtp15,by=DT$SEX)) # only gives the mean for one of the sexes
#print ("1. mean(DT$pwgtp15,by=DT$SEX)")
#system.time(mean(DT$pwgtp15,by=DT$SEX))

print("2. mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)")
print( mean( DT[DT$SEX==1,]$pwgtp15 ) )
print( mean( DT[DT$SEX==2,]$pwgtp15 ) ) 

time2<-system.time( 
    for (i in 1:NITERS)
    {mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)}
)
print(time2)

# This one does not work, it comes up with an error 
# print("3. rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]")
#system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])

print("4. DT[,mean(pwgtp15),by=SEX]")
print( DT[,mean(pwgtp15),by=SEX] )
time4<- system.time( 
    for (i in 1:NITERS){DT[,mean(pwgtp15),by=SEX]} 
    )
print(time4)

print("5. tapply(DT$pwgtp15,DT$SEX,mean)")
print(tapply(DT$pwgtp15,DT$SEX,mean))
time5<- system.time( 
    for (i in 1:NITERS){tapply(DT$pwgtp15,DT$SEX,mean)} 
)
print(time5)


print("6. sapply(split(DT$pwgtp15,DT$SEX),mean)")
print( sapply(split(DT$pwgtp15,DT$SEX),mean) )
time6<- system.time( 
    for (i in 1:NITERS){
        sapply(split(DT$pwgtp15,DT$SEX),mean)
    } 
)
print(time6)



#system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
