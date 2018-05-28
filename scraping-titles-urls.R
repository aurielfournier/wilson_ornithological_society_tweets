library(rvest)
library(stringr)
library(magrittr)

write_wos_tweets <- function(){
  
  url <- "http://www.bioone.org/toc/wils/current"

  # Retrieve the individual listings
  titles <- read_html(url) %>%
    html_nodes(css = ".hlFld-Title") %>%
    html_text %>%
    purrr::map_chr(~.x)
  
  articleurls <- read_html(url) %>%
    html_nodes(css = ".useQueryHash") %>%
    html_attr("href")  %>% 
    purrr::map_chr(~paste0("http://www.bioone.org", .x) ) %>%
    str_subset(pattern="abs")

  
  tweets <- paste0("New In WJO: ",titles, " #ornithology ", articleurls)

  return(tweets)
  }  