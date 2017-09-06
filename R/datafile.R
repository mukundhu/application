dataf <- function(){
  datafile <- read.csv(text=getURL("https://raw.githubusercontent.com/mukundhu/application/master/R/datafile.csv"),header=T)
  return(datafile)
}

