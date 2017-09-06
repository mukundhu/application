matching<-function(finalkey){

  a<-as.vector(NULL)
  b<-as.vector(NULL)
  library(RCurl)
  myfile <- getURL('https://raw.githubusercontent.com/mukundhu/application/master/data/datafile.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
  datafile<- read.csv(textConnection(myfile), header=T)
 
  print(datafile)
  
  }

 
