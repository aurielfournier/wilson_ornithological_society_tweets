# https://github.com/aurielfournier/wilson_ornithological_society_tweets

library(dplyr)
library(rtweet)

# I have these saved in a .Rdata file elsewhere
# https://cran.r-project.org/web/packages/rtweet/vignettes/auth.html
load("~/../Dropbox/wilson/key_secret.Rdata")
source("write_wilson_tweets_bioone.R")


#change out url in this function 
tweets <- write_wos_tweets_bioone()

# check to make sure they are short enough
nchar(tweets) > 280

appname <- "wilson_tweets"

key <- key_secret[[1]]

secret <- key_secret[[2]]

twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

post_tweet("Birds are amazing. Are you ready for the Latest Issue of WJO? #ornithology",token=twitter_token)

for(i in 1:length(tweets)){  
  
    post_tweet(tweets[[i]], 
               token=twitter_token)
  
    if(i<length(tweets)){Sys.sleep(time=180)}
}