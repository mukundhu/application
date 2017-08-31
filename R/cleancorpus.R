# creating a clean corpus function
clean_corpus<-function(text_data){

  corpus <-corpus_fun(text_data)
  corpus<- tm_map(corpus, removePunctuation)
  corpus<- tm_map(corpus, removeNumbers)
  corpus<- tm_map(corpus, tolower)
  corpus<- tm_map(corpus, removeWords, stopwords("english"))
  corpus<- tm_map(corpus, stripWhitespace)
  return(corpus)
}
