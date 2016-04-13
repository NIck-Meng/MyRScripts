#------------------------------------------------------#
# R in Action: Chapter 1                               #
#------------------------------------------------------#
# author：mxr
# In the following code q() is commented out so that
# you don't quit the session

# R语言的赋值符号是 <- ,最好在符号前后均使用一个空格符，
# R语言允许使用=作为赋值符号，但是不推荐这样做，
x <- rnorm(5)

# 可以使用c()函数构造向量，其将传入的参数拼接成一个向量

# Listing 1.1 - A Sample R session

age <- c(1, 3, 5, 2, 11, 9, 3, 9, 12, 3)
weight <- c(4.4, 5.3, 7.2, 5.2, 8.5, 7.3, 6, 10.4, 
    10.2, 6.1)
mean(weight)
sd(weight)
cor(age, weight)
plot(age, weight)
# q()

# Listing 1.2 - An example of commands used to manage
# the R Workspace. Change the next line to one of your 
# directories

setwd("C:/myprojects/project1")
options()
options(digits=3)
x <- runif(20)
summary(x)
hist(x)
savehistory()
save.image()
# q()

# Listing 1.3 - Working with a new package

help.start()
install.packages("vcd")
help(package = "vcd")
library(vcd)
help(Arthritis)
Arthritis
example(Arthritis)
# q()
