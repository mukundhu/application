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
    matching(finalkey)

  }else{
    a_table<-table(a)
    tab<-as.integer(names(a_table))
    index_match<-tab[which.min(datafile$Rank[tab])]
    if(datafile$sub[index_match]==""){

      print(paste0("you have selected ",datafile$service[index_match]," services ",datafile$sub.service[index_match]),max.levels=0)
      x<-1
      while(x==1){
        if(tolower(confirm)=="no"){
          x<-0
          matching(finalkey)
        }else{
          x<-0
          if(tolower(confirm)=="yes"){
            print("your services are forwared to the department. Thank you for using our services")

          }
          else{
            x<-1

          }
        }
        x<-as.numeric(0)
      }
    }else{
      print(paste0("Are you looking for services in ",datafile$keyword[index_match]),max.levels=0)
      y<-1
      while(y==1){
        confirm<-conf()
        if(tolower(confirm)=="no"){
          y<-0
          matching(finalkey)
        }else{
          if(tolower(confirm)=="yes"){
            y<-0
            print(paste0("please select from ",datafile$sub[index_match]),max.levels=0)

      
            matching(finalkey)
          }else{
            y<-1
          }
        }
      }
      y<-as.numeric(0)
    }
  }
}
