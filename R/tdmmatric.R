#generating Term Document frequency Matrix
tdm<-function(text_data){

  cleancorpus<-clean_corpus(text_data)
  return(TermDocumentMatrix(cleancorpus))
}
