# # 老友记的词汇分析

install.packages('stringr')
library(stringr)

words <- read.csv('D:\\English\\f6.csv',stringsAsFactors =FALSE,header=TRUE)
str(words)
words[1:2,]

divChap <- function(x)
{
  chapNum <- as.integer(paste('10',x,sep=''))
  chapter <- words[words$Chap==chapNum,]
  chapter
}

chapter01 <- divChap(1)

chapter01[1,]