# Wilson Ornithological Society Tweets

I am apart of the team that tweets on behalf of the Wilson Ornithological Society. My job is to tweet about the new articles published in the Wilson Journal of Ornithology 4 times a year when the new issues come out. 

Previously this involved around 8 hours of copying, pasting, writing tweets, and then scheduling them all by hand. I'm not a huge fan of copying and pasting, its boring and inefficient. So I've been working on figuring out a way to scrape the titles and links to the papers, and then also tweeting them, all from R. 

`write_wilson_tweets()` grabs the titles and urls for all the articles in the most recent issue of the Wilson Journal of Ornithology, and then pastes them together, along with the text "New in WJO:" and the #ornithology hashtag. 

such that the tweets look like this

```
tweets
 [1] "New In WJO: Frontispiece #ornithology http://www.bioone.org/doi/abs/10.1676/1559-4491-130.1.000"                                                                                                                                               
 [2] "New In WJO: Biology of landbird migrants: a stopover perspective #ornithology http://www.bioone.org/doi/abs/10.1676/1559-4491-130.1.1"                                                                                                         
 [3] "New In WJO: Potential distribution and climatic niche of seven species of Campylorhynchus (Aves, Troglodytidae): conservation implications for C. yucatanicus #ornithology http://www.bioone.org/doi/abs/10.1676/16-101.1" 
 ```
Then `automated_tweeting.R` walks you through creating the twitter token, and using a for loop, tweeting out each paper every 180 seconds. 
Now I can generate the tweets in just a few seconds, and then run this script several times in the week after the new issue is released, and tweet it out to everyone. 

To ensure I am reaching colleagues outside N American [where I am based] I can let the script run overnight on my laptop. 

Saving myself 8 hours a quarter, over 30 hours a year! 

