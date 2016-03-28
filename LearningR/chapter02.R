# 第二章：科学计算器

# 向量：c()函数可以将一系列的值拼接成一个向量，c是concatenate的第一个字母
1:5+6:10
c(1,3,6,10,15)+c(0,1,3,6,10)
# 向量化:
# 第一层含义是：运算符或函数可以作用于向量中的每个元素，而无需显式地编写循环语句，
# 第二层含义是：当一个函数把一个向量作为输入时，能计算汇总统计，

# R中所有的运算符都是向量化的，

sum(1:5)
median(1:5)
c(2,3,5,7,11,13)-2
-2:2*-2:2
identical(2^3,2**3)
1:10/3# 浮点数除法
1:10%/%3# 整数除法
1:10%%3# 取余数
cos(c(0,pi/4,pi/2,pi))
choose(5,0:5)

# 比较整数值是否相等用双等号==而不是单等号=，双等号也是向量化的，要检查是否不相等用！=
c(3,4-1,1*3,1+1+1)==3
1:3 != 3:1
exp(1:5)<100
(1:5)^2>=16
# 用==检查非整数相等可能会出问题，
sqrt(2)^2==2
sqrt(2)^2-2

# all.equal()可以用于检查数字是否相等，它提供了一个容忍度，默认为1.5e-8,小于此容忍度的误差被忽略
all.equal(sqrt(2)^2,2)
all.equal(sqrt(2)^2,3)
isTRUE(all.equal(sqrt(2)^2,3))

# 要检查两个数字是否相等，使用all.equal()函数
# 也可以使用==比较字符串
c('Can','can','a','can','as','canner','can?')=='can'
c('A','B','C','D')<'C'
c('a','b','c','d')<'C'

# 变量赋值:可以使用=或者<-，
# <-是首选,一般为防止混淆，在<-左右两边各加一个空格
#
# 变量赋值前不需要声明，
# 变量名可以包含字母，数字，点，下划线，但不能以数字或点后跟数字开头，也不许使用保留字，
x <- 1:5
y=6:10
x+2*y-3

x <- 3
x < -3
x<-3

# <<- 是全局赋值符号，
x <<- exp(exp(1))

# 还可以通过assign函数赋值，
assign('my_local_var',9^3+10^3)
assign('my_global_var',9^2+10^2,globalenv())

z <- rnorm(5);z
(zz <- rlnorm(5))

# 特殊数字
# Inf,-Inf,NaN,NA分别为正无穷，负无穷，非数字，缺失值，
c(Inf+1,Inf-1,Inf-Inf)
c(1/Inf,Inf/1,Inf/Inf)
c(sqrt(Inf),sin(Inf))
c(log(Inf)),log(Inf,base=Inf)
c(NA+1,NA*5,NA+Inf)

c(NA+NA,NaN+NaN,NaN+NA,NA+NaN)
x <- c(0,Inf,-Inf,NaN,NA)
is.finite(x)
is.infinite(x)
is.nan(x)
is.na(x)

# 逻辑向量

(x <- 1:10 >=5)
!x
(y <- 1:10 %% 2==0)
x & y
x | y

x<- c(TRUE,FALSE,NA)
xy <- expand.grid(x=x,y=x)
within(
  xy,
{
  and <- x & y
  or <- x | y
  not.y <- !y
  not.x <- !x
}
  )

# expand.grid(..., KEEP.OUT.ATTRS = TRUE, stringsAsFactors = TRUE)
# Create a data frame from all combinations of the supplied vectors or factors.
expand.grid(height = seq(60, 80, 5), weight = seq(100, 300, 50),
            sex = c("Male","Female"))

# any函数,输入向量中只要有一个TURE就返回TRUE，
# all函数，输入向量中的所有值为TRUE时返回TRUE
none_true <- c(FALSE,FALSE,FALSE)
some_true <- c(FALSE,TRUE,FALSE)
all_true <- c(TRUE,TRUE,TRUE)
any(none_true)
any(some_true)
any(all_true)
all(none_true)
all(some_true)
all(all_true)
















