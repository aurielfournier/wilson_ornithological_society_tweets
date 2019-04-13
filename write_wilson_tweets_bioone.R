


library(rvest)
library(stringr)
library(magrittr)

write_wos_tweets_bioone <- function(){
  
  url <- "https://bioone.org/journals/the-wilson-journal-of-ornithology/current"
  
  
  # Retrieve the individual listings
  # https://selectorgadget.com/
  titles <- read_html(url) %>%
    html_nodes(css = ".TOCLineItemBoldText") %>%
    html_text() 
  
  
  urlpart1 <- read_html(url) %>% 
    html_nodes(css="a")
  
  urlpart2 <- urlpart1[grep(urlpart1, pattern="https://doi.org/")]
  
  articleurls <- urlpart2 %>%
    html_attr("href")  
  
  # creates each tweet 
  tweets <- paste0("New In WJO: ",titles, " #ornithology ", articleurls)
  
  return(tweets)
}  

