# Lab 11 Assignment
# By Yunhan Zhang

library(quanteda)
library(quanteda.textstats)
library(quanteda.textplots)

# Question 1
library(tidyverse)
tweetDF <- read_csv("https://intro-datascience.s3.us-east-2.amazonaws.com/ClimatePosts.csv")
glimpse(tweetDF)
# There are total 18 rows and 3 columns in this data frame.
# ID means users' id; 0 and 1 means the user is skeptic or not; Tweet is just the a line of text that tweeted by the user.

# Question 2
tweetCorpus	<- corpus(tweetDF$Tweet,	docnames=tweetDF$ID) # Make corpus for the web data.
toks	<- tokens(tweetCorpus,	remove_punct=TRUE) # Remove the punctuation.
toks_nostop	<- tokens_select(toks,	pattern	=	stopwords("en"),	selection	=	"remove") # Remove the stop words.

# Question 3
tweetDFM <- dfm(toks_nostop)

# Question 4
# There are total of 18 documents, 223 features and, the sparsity of the matrix is 93.2%.

# Question 5
textplot_wordcloud(tweetDFM,	min_count	=	1)
# The more a specific word appears in a source of textual data (such as climate, change, or global)
# Also the bigger and bolder it appears in the word cloud. A word cloud is a collection, or cluster, of words depicted in different sizes.

# Question 6
freqWords <- textstat_frequency(tweetDFM)
freqWords[1:10, c("feature", "frequency")]
# 13-6-6-4-4-3-3-3-3-3 times

# Question 7
URL	<- "https://intro-datascience.s3.us-east-2.amazonaws.com/positive-words.txt"
posWords <- scan(URL,	character(0),	sep	=	"\n")
posWords <- posWords[-1:-34]

# Question 8
posDFM <- dfm_match(tweetDFM,	posWords) # match the words
posFreq	<- textstat_frequency(posDFM) # count the words

# Question 9
str(posFreq)
glimpse(posFreq)

# Question 10
# The positive words are: enough, like, advanced, cool, great, hot, hottest, reliably, right, uesful, warm, wow.
# Frequencies are 2,2,1,1,1,1,1,1,1,1,1,1

# Question 11
URL	<- "https://intro-datascience.s3.us-east-2.amazonaws.com/negative-words.txt"
negWords <- scan(URL,	character(0),	sep	=	"\n")
negWords <- negWords[-1:-34]
negDFM <- dfm_match(tweetDFM,	negWords)
negFreq	<- textstat_frequency(negDFM)
str(negFreq)
glimpse(negFreq)
# Done. There are 17 negative words and their frequencies are listed.
