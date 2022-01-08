require(bitops)
require(curl)
require(RCurl)
require(wordcloud)
require(NLP)
require(tm)

khiheat.text<-readLines('exchangenews.txt')
khiheat.text <- tolower(khiheat.text)

# Replace blank space ("rt")
khiheat.text <- gsub("rt", "", khiheat.text)

# Replace @UserName
khiheat.text <- gsub("@\\w+", "", khiheat.text)

# Remove punctuation
khiheat.text <- gsub("[[:punct:]]", "", khiheat.text)

# Remove links
khiheat.text <-gsub("http\\w+", "", khiheat.text)

# Remove links
khiheat.text <gsub("https\\w+", "", khiheat.text)

# Remove tabs
khiheat.text <gsub("[ |\t]{2,}", "", khiheat.text)

# Remove blank spaces at the beginning
khiheat.text <- gsub("^ ", "", khiheat.text)

# Remove blank spaces at the end
khiheat.text <- gsub(" $", "", khiheat.text)
khiheat.text.corpus <- Corpus(VectorSource(khiheat.text))

#clean up by removing stop words
khiheat.text.corpus <- tm_map(khiheat.text.corpus, function(x)removeWords(x,stopwords()))

writeLines(as.character(khiheat.text.corpus), con="mycorpus.txt")
wordcloud(khiheat.text.corpus,scale=c(4,.2),min.freq=5, max.words=Inf, random.order=FALSE, rot.per=.60,colors=rainbow(50))