##############################################################################
## Question 4
## How many characters are in the 10th, 20th, 30th and 100th lines of HTML 
## from this page: 
##    
##    http://biostat.jhsph.edu/~jleek/contact.html 
##
## (Hint: the nchar() function in R may be helpful)
##############################################################################

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode<-readLines(con)
close(con)


##############################################################################
## get the number of characters in 10th line
##############################################################################

line10NChars <- nchar(htmlCode[10])

##############################################################################
## get the number of characters in 20th line
##############################################################################

line20NChars <- nchar(htmlCode[20])

##############################################################################
## get the number of characters in 30th line
##############################################################################

line30NChars <- nchar(htmlCode[30])

##############################################################################
## get the number of characters in 30th line
##############################################################################

line100NChars <- nchar(htmlCode[100])

##############################################################################
## write output
##############################################################################

print("Number of in the 10th, 20th, 30th and 100th lines of HTML are" )
print(
    paste(line10NChars, 
          line20NChars, 
          line30NChars, 
          line100NChars, 
          sep = " " )
    )
