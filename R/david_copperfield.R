## get David Copperfield
library(stringi)
text <- readLines("http://www.textfiles.com/etext/AUTHORS/DICKENS/dickens-david-626.txt")

text <- paste(text,collapse=" ")
booktext<- substr(text,stri_locate(regex = "CHAPTER 1",str = text)[1],stri_locate(regex = "pointing upward!",str = text)[2])

spaces <-  stri_locate_all(str = booktext, regex = " ")[[1]]
numspaces <- nrow(spaces)
whichspace <- sample(numspaces,1)
substr(booktext,spaces[whichspace,1]+1,spaces[whichspace+1,1]-1)

characters <- strsplit(paste(text,collapse = " "),split = "")
characters <- characters[[1]]
allchars <- sort(unique(characters))

charfreqmat<- matrix(nrow = length(allchars),ncol = 2)
charfreqmat[,1] <- allchars

totalletters <- length(characters)
for (i in 1:length(allchars)) {
  charfreqmat[i,2] <- sum(characters == allchars[i]) / totalletters
}

get_log_likelihood<- function(letter1,letter2) {
  letter1*letter2
}
