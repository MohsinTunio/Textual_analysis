library(tm)
library(SnowballC)
library(ff)
reuters<- readLines('September2017.txt')
reuters<- VCorpus(VectorSource(reuters))

reuters <- VCorpus(DirSource(directory ="September2017.txt" , mode = "text"), readerControl = list(reader = readPlain))
reuters <- tm_map(reuters, stripWhitespace)
reuters <- tm_map(reuters, content_transformer(tolower))
reuters <- tm_map(reuters, removeWords, stopwords("english"))
tm_map(reuters, stemDocument)
dtm <- DocumentTermMatrix(reuters)
#inspect(dtm)
mnk<-as.matrix(dtm)
#terms<-findFreqTerms(dtm, 100) # term that appeared atleast 100 times

