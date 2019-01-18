# https://github.com/aurielfournier/wilson_ornithological_society_tweets 


library(rvest)
library(stringr)
library(magrittr)

write_wos_tweets <- function(){
  
  url <- "http://www.bioone.org/toc/wils/current"

  # Retrieve the individual listings
  # https://selectorgadget.com/
  titles <- read_html(url) %>%
    html_nodes(css = ".TOCLineItemBoldText") %>%
    html_text() 
  
  articleurls <- read_html(url) %>%
    html_nodes(css = ".TOCLineItemText3 a") %>%
    html_attr("href") 

  # creates each tweet 
  tweets <- paste0("New In WJO: ",titles, " #ornithology ", articleurls)

  return(tweets)
}  

