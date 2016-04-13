#----------------------------------------------------#
# R in Action: Chapter 5                             #
#----------------------------------------------------#

x <- c(2,1,5,6,2,NA,9,3,NA)
y <- mean(x,na.rm=TRUE)
z <- mean(x,trim=0.05,na.rm=TRUE)

# Listing 5.1 -  Calculating the mean and 
# standard deviation

x <- c(1, 2, 3, 4, 5, 6, 7, 8)
mean(x)
sd(x)
n <- length(x)
meanx <- sum(x)/n
css <- sum((x - meanx)**2)            
sdx <- sqrt(css / (n-1))
meanx
sdx

# 数据标准化
# scale()可以对矩阵或数据框的指定列进行均值为0，标准差为1的标准化
newdata <- scale(mydata)


# Listing 5.2 - Generating pseudo-random numbers from 
# a uniform distribution

runif(5)
runif(5)
set.seed(1234)                                                     
runif(5)
set.seed(1234)                                                      
runif(5)

# 使用MASS包中的mvrnorm()函数生成多元正太分布数据

# mvrnorm(n,mean,sigma)中，n为样本数，mean为均值向量，sigma为方差协方差矩阵



# Listing 5.3 - Generating data from a multivariate normal distribution

library(MASS)
options(digits=3)
set.seed(1234)

mean <- c(230.7, 146.7, 3.6)                                           
sigma <- matrix( c(15360.8, 6721.2, -47.1,                              
                   6721.2, 4700.9, -16.5,
                   -47.1,  -16.5,   0.3), nrow=3, ncol=3)

mydata <- mvrnorm(500, mean, sigma)   
class(mydata)
mydata <- as.data.frame(mydata)                                         
names(mydata) <- c("y", "x1", "x2")                                       

dim(mydata)                                                             
head(mydata, n=10)   

# Listing 5.4 - Applying functions to data objects

a <- 5
sqrt(a)
b <- c(1.243, 5.654, 2.99)
round(b)
c <- matrix(runif(12), nrow=3)
c
log(c)
mean(c)

# Listing 5.5 - Applying a function to the rows 
# (columns) of a matrix

mydata <- matrix(rnorm(30), nrow=6)
mydata
apply(mydata, 1, mean)     
apply(mydata, 2, mean) 
apply(mydata, 2, mean, trim=.4)   

# Listing 5.6 - A solution to the learning example

options(digits=2)

Student <- c("John Davis", "Angela Williams", 
             "Bullwinkle Moose", "David Jones", 
             "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English,
                     stringsAsFactors=FALSE)

z <- scale(roster[,2:4]) # 数据标准化
score <- apply(z, 1, mean)   # 计算每个学生的平均得分                                         
roster <- cbind(roster, score) # 列连接成一个新的数据框

# 对学生的评分进行等级划分
y <- quantile(score, c(.8,.6,.4,.2))                                   
roster$grade[score >= y[1]] <- "A"                                     
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

name <- strsplit((roster$Student), " ") # 将学生姓名分隔成两部分                               
lastname <- sapply(name, "[", 2)
firstname <- sapply(name, "[", 1)

roster <- cbind(firstname,lastname, roster[,-1])
roster <- roster[order(lastname,firstname),]

roster

# "[" :Operators acting on vectors, matrices, arrays and lists to extract or replace parts.


# Listing 5.7 - A switch example

feelings <- c("sad", "afraid")
for (i in feelings)
  print(
    switch(i,
           happy  = "I am glad you are happy",
           afraid = "There is nothing to fear",
           sad    = "Cheer up",
           angry  = "Calm down now"
    )
  )

# 自定义函数

# Listing 5.8 - mystats(): a user-written function 
# for summary statistics

mystats <- function(x, parametric=TRUE, print=FALSE) {
  if (parametric) {
    center <- mean(x); spread <- sd(x) 
  } else {
    center <- median(x); spread <- mad(x) 
  }
  if (print & parametric) {
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center=center, spread=spread)
  return(result)
}

# trying it out
set.seed(1234)
x <- rnorm(500) 
y <- mystats(x)
y <- mystats(x, parametric=FALSE, print=TRUE)

# Another switch example
mydate <- function(type="long") {
  switch(type,
         long =  format(Sys.time(), "%A %B %d %Y"), 
         short = format(Sys.time(), "%m-%d-%y"),
         cat(type, "is not a recognized type\n"))
}
mydate("long")
mydate("short")
mydate()
mydate("medium")


# Listing 5.9 - Transposing a dataset

cars <- mtcars[1:5, 1:4]      
cars
t(cars)

# Listing 5.10 - Aggregating data

options(digits=3)
attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,gear), 
                    FUN=mean, na.rm=TRUE)
aggdata

library(reshape2)
# reshape2的精髓是把整体数据（比如数据框）打碎（melt，或说熔化），让其回到一个一个数据点的状态，
# 不过，这个数据点是可以根据观测的id名称和变量名称定位找到的（事实上，数据框是二维的，在数据框中，根据观测id和某变量名称，即可交叉定位到某数据点）。
# 然后，再根据观测id和变量名称的组合，随心所欲的锻造需要的数据形态（cast），中间可能有求和、求平均值之类的数据运算。



id <- c(1,1,2,2)
Time <- c(1,2,1,2)
X1 <- c(5,3,6,2)
X2 <- c(6,5,1,4)
mydata <- data.frame(id,Time,X1,X2)
melt(mydata,id='id')
md <- melt(mydata,id=c('id','Time'))
melt(mydata,id=c('id','Time','X1'))

dcast(md,id+Time~variable)



