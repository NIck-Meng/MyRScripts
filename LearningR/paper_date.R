price <- read.csv("C:\\Users\\mxr\\Desktop\\XAGUSD5.csv")
head(price)
names(price) <- c('date','time','open','high','low','close','mount')
price$seque <- paste(price$date,price$time)
price$seque <- strptime(price$seque,"%Y.%m.%d %H:%M")
price <- price[,c(-1,-2,-7)]
library(ggplot2)
t1  <- subset(price,price$seque>=as.POSIXct("2017-01-10"))
ggplot(t1,aes(seque,close))+geom_line()
