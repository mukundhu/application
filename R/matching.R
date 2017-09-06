matching<-function(finalkey){

  a<-as.vector(NULL)
  b<-as.vector(NULL)
  library(RCurl)
  myfile <- getURL('https://raw.githubusercontent.com/mukundhu/application/master/data/datafile.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
  datafile<- read.csv(textConnection(myfile), header=T)
  for(i in 1:length(finalkey)){
    a[i]<-pmatch(finalkey[i],datafile$keyword,0.5)
    if(a[i]==0){
      a[i]<-NA
    }
  }

  if(all(is.na(a))){
    again <- againtext()
    finalkey<-final_key(again)
    matching(finalkey)

  }else{
    a_table<-table(a)
    tab<-as.integer(names(a_table))
    index_match<-tab[which.min(datafile$Rank[tab])]
    if(datafile$sub[index_match]==""){

     for(i in 1:length(finalkey)){
    a[i]<-pmatch(finalkey[i],datafile$keyword,0.5)
    if(a[i]==0){
      a[i]<-NA
    }
  }

  if(all(is.na(a))){
    again <- againtext()
    finalkey<-final_key(again)
    matching(finalkey)

  }else{
    a_table<-table(a)
    tab<-as.integer(names(a_table))
    index_match<-tab[which.min(datafile$Rank[tab])]
    if(datafile$sub[index_match]==""){

      print(paste0("you have selected ",datafile$service[index_match]," services ",datafile$sub.service[index_match]),max.levels=0)
  
  }

 }
}
}
}
