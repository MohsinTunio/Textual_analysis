library(quanteda)
library(readtext)
library(tm)
llcorpus<-readtext("September2017.txt")
myCorpus <- corpus(llcorpus)
system.time(theDFM <- dfm(myCorpus,tolower=TRUE,
                          remove=c(stopwords(),",",".","-","\"","'","(",")",";",":","=","$","/","2017","rs")))
system.time(textFreq <- textstat_frequency(theDFM))

hist(textFreq$frequency,
     main="Frequency Distribution of Words: UK 2010 Election Manifestos")

top20 <- textFreq[1:20,]
barplot(height=top20$frequency,
        names.arg=top20$feature,
        horiz=FALSE,
        las=2,
        main="Top 20 Words: Pakistan News Archive-20__")