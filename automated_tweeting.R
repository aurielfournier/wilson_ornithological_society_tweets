library(dplyr)
library(rtweet)

# I have these saved in a .Rdata file elsewhere
load("~/../Dropbox/wilson/key_secret.Rdata")
source("scraping-titles-urls.R")

tweets <- write_wos_tweets()

appname <- "wilson_tweets"

key <- key_secret[[1]]

secret <- key_secret[[2]]

twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

for(i in 1:length(tweets)){  
    post_tweet(tweets[[i]], 
               token=twitter_token)
    if(i<length(tweets)){Sys.sleep(time=60)}
}
