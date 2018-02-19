# load twitter library - the rtweet library is recommended now over twitteR
#install.packages('rtweet')
library(rtweet)
# plotting and pipes - tidyverse!
#install.packages('ggplot2')
library(ggplot2)
#install.packages('dplyr')
library(dplyr)
# text mining library
#install.packages('tidytext')
library(tidytext)
#install httpuv
#install.packages('httpuv')
library(httpuv)


# whatever name you assigned to your created app
appname <- "Name"

## api key (example below is not a real key)
key <- "Key"

## api secret (example below is not a real key)
secret <- "Secret"

# create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

# post a tweet from R
post_tweet("Tweet check")
## your tweet has been posted!

#Create empty data frame
stocktweets <- data.frame()
## Download tweets for each stock
for (i in 1:length(Symbols)){

stocksymbol <- Symbols[i]  
  
#Extract tweets based on symbol hashtag
Tweets <- search_tweets(paste('#',stocksymbol,sep=''),n = 100)
print(Symbols[i])

#Add stock symbol to data frame
if(nrow(Tweets) > 0){
Tweets$stock <- stocksymbol}

#Bind the data frame to one dataset
if(nrow(Tweets) > 0){
stocktweets <- rbind(stocktweets,Tweets)}
}
