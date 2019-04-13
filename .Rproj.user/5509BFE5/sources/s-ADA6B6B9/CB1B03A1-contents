# https://github.com/aurielfournier/wilson_ornithological_society_tweets 


library(rvest)
library(stringr)
library(magrittr)

write_wos_tweets <- function(){
  
  url <- "http://wjoonline.org/toc/wils/130/4"

  # Retrieve the individual listings
  # https://selectorgadget.com/
  titles <- read_html(url) %>%
    html_nodes(css = ".art_title") %>%
    html_text() 
  
  articleurls <- read_html(url) %>%
    html_nodes(css = "br+ .useQueryHash") %>%
    html_attr("href") %>% 
    # makes it a full url
    purrr::map_chr(~paste0("http://wjoonline.org", .x) ) 

  # creates each tweet 
  tweets <- paste0("New In WJO: ",titles, " #ornithology ", articleurls)

  return(tweets)
}  

