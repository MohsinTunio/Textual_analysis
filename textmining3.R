

library(tm)
library(rpart)
library(readtext)

#Load the files into corpus

full <- readtext("September2017.txt")
fullCorpus<- VCorpus(VectorSource(full))
#Do basic processing on the loaded corpus
fullCorpus.cleansed <- tm_map(fullCorpus, removePunctuation)
fullCorpus.cleansed <- tm_map(fullCorpus.cleansed, stripWhitespace)
fullCorpus.cleansed <- tm_map(fullCorpus.cleansed, tolower)
fullCorpus.cleansed <- tm_map(fullCorpus.cleansed, removeWords, stopwords("english"))
fullCorpus.cleansed <- tm_map(fullCorpus.cleansed, PlainTextDocument)

#Create the term document matrix for analysis
full.dtm <- DocumentTermMatrix(fullCorpus.cleansed)

#Remove sparse terms
full.dtm.spars <- removeSparseTerms(full.dtm , 0.6)

#Convert the Document term matrix to data frame for easy manipulation
full.matix <- data.matrix(full.dtm.spars)
full.df <- as.data.frame(full.matix)