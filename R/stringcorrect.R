# finding frequency of the terms
findkeyword<-function(text_data){
  tdm_data <- tdm(text_data)
  stringData<-findFreqTerms(tdm_data,lowfreq = 0)
  library(hunspell)
  suggest_check<-hunspell_check(stringData)
  wrong_str<-stringData[!suggest_check]
  correct_str<-stringData[suggest_check]
  suggestions<-hunspell_suggest(stringData[!suggest_check])

  if(length(suggestions)!=0){
    for(d in 1:length(suggestions)){
      suggestions[[d]]<-tolower(suggestions[[d]])
    }
    x<-as.vector(NULL)
    y<-as.vector(NULL)
    count<-0
    fin<-as.vector(NULL)
    rec_str<-as.vector(NULL)
    big <- big()
    big_count<-sapply(gregexpr("\\W+", big), length)





    # Replacing wrong with right ones from suggestions

    for(i in 1:length(suggestions)){

      x<-wrong_str[i]

      if(length(suggestions[[i]])!=0){

        for(j in 1:length(suggestions[[i]])){

          y<-suggestions[[i]][j]

          count<-0
          a<-adist(x,y)
          prob_len <- 1-a/(stringr::str_count(suggestions[[i]][j]))
          prob_most <- (stringr::str_count(big,y))/big_count
          c <-  prob_len * prob_most
          fin[j]<-c

          y<-as.vector(NULL)

        }

        rec_str[i]<-suggestions[[i]][which.max(fin)]
        fin<-as.vector(NULL)
        x<-as.vector(NULL)

      }

      else{

        rec_str[i]<-wrong_str[i]
      }

    }
    str_final<-append(correct_str,rec_str)
  }



  if(length(suggestions)==0){
    str_final<-correct_str
  }
  return(str_final)
}
