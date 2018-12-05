# https://github.com/aurielfournier/wilson_ornithological_society_tweets

library(dplyr)
library(rtweet)

# I have these saved in a .Rdata file elsewhere
# https://cran.r-project.org/web/packages/rtweet/vignettes/auth.html
load("~/../Dropbox/wilson/key_secret.Rdata")

tweets <- read.csv("../Desktop/sora_tweets.csv",
                   stringsAsFactors = FALSE)

# check to make sure they are short enough
length(tweets$tweet1) > 280
length(tweets$tweet2) > 280

appname <- "wilson_tweets"

key <- key_secret[[1]]

secret <- key_secret[[2]]

twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)


    post_tweet(tweets$tweet1, 
               token=twitter_token,
               media=tweets$photo1)

    post_tweet(tweets$tweet2, 
               token=twitter_token,
               media=tweets$photo2)

    Sys.sleep(time=18000) # 5 hours

    post_tweet(tweets$tweet1, 
               token=twitter_token,
               media=tweets$photo1)
    
    post_tweet(tweets$tweet2, 
               token=twitter_token,
               media=tweets$photo2)
    
    Sys.sleep(time=18000) # 5 hours
    
    post_tweet(tweets$tweet1, 
               token=twitter_token,
               media=tweets$photo1)
    
    post_tweet(tweets$tweet2, 
               token=twitter_token,
               media=tweets$photo2)
    
    Sys.sleep(time=18000) # 5 hours