#changing text file into corpus
corpus_fun<-function(text_data){
  library(NLP)
  library(tm)
  docs1 <- Corpus(VectorSource(text_data)) #file path #
  docs<-docs1
  return(docs)
}
