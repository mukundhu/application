big <- function(){

library(RCurl)

data <- getURL("http://www.norvig.com/big.txt")
 return(data)

}
