library(dplyr)
library(rtweet)

# I have these saved in a .Rdata file elsewhere
load("~/../Dropbox/wilson/key_secret.Rdata")
source("write_wilson_tweets.R")

tweets <- write_wos_tweets()

nchar(tweets) > 280

tweets[[2]] <- "New In WJO: Density and population estimates of Rose-bellied Bunting, Cinnamon-tailed Sparrow , and Orange-breasted Bunting in the Sierra Tolistoque, Oaxaca, Mexico #ornithology http://www.bioone.org/doi/abs/10.1676/16-217.1"

longertweets <- paste0(tweets,"   ")

appname <- "wilson_tweets"

key <- key_secret[[1]]

secret <- key_secret[[2]]

twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

for(i in 1:length(tweets)){  
    post_tweet(longertweets[[i]], 
               token=twitter_token)
    if(i<length(tweets)){Sys.sleep(time=180)}
}
