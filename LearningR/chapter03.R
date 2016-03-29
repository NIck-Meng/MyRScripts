# 第三章：检查变量和工作区

# R中的每个变量都有一个类，表明该变量属于什么类型，可以使用class()函数来查看变量的类型

# 数字向量属于numeric类，逻辑值向量属于logical类，
# 用于存储文本的字符属于character类，储存类别数据的因子factor类，以及存储二进制数据的raw类，

class(c(TRUE,FALSE))
class(c(2,3,8,5))

# 数字分为浮点值numeric，整数值integer，复数值complex，
class(sqrt(1:10))
class(3+1i)
class(1)
class(1L)
class(0.5:4.5)
class(1:5)

class(c('she','wears','a','red','skirt'))
(gender <- factor(c('male','female','female','male','female')))
levels(gender)
nlevels(gender)
# 因子水平按字母顺序排序，female为第一水平，male为第二水平
# 在底层，因子的值被存储为整数而非字符，可以调用as.integer()来查看
as.integer(gender)

gender_char <- sample(c('female','male'),10000,replace=TRUE)
gender_fac <- sample(c('female','male'),10000,replace=TRUE)

object.size(gender_char)
object.size(gender_fac)


# sample(x, size, replace = FALSE, prob = NULL)
# replace参数表示默认无放回抽样，抽样的size必须必总体少
# x <- sample(c(1,2,3),5,replace=TRUE)
# y <- sample(c(1,2,3,6,8,9,0),8,replace=FALSE)

# 当处理因子水平的内容时，最好的做法是先用as.character()函数把因子水平转换成字符串
as.character(gender)


# 可以在脚本中使用is函数测试对象的类型，
if(!is(x,'some_class'))
{
  # some behavior 
}
# 大部分类都有自己的is.*函数，可以直接调用,必使用通用的is函数更加高效
is.character('red lorry')
is.logical(FALSE)
is.list(list(a=1,b='time'))
# 可以使用ls函数查看所有is函数，实证是正则表达式匹配
ls(pattern='^is',baseenv())

is.numeric(1)
is.numeric(1L)
is.integer(1)
is.integer(1L)
is.double(1)
is.double(1L)

# 类型转换函数as，大部分类型都有自己的as.*函数，可以直接调用
x <- '123.456'
as(x,'numeric')
as.numeric(x)

# 可以使用options(digits=n)来设置小数点保留位数

# 检查变量

# 在命令行模式下，输入运算或变量时隐式调用print函数
# 但是在内循环或函数中，隐式调用不起作用，必须显式调用print函数

ulams_spiral <- c(1,8,23,46,77)
for (i in ulams_spiral) i
for (i in ulams_spiral) print(i)

# summary函数可以为不同的数据类型提供汇总信息
num <- runif(30)
summary(num)

# dunif(x, min = 0, max = 1, log = FALSE)
# punif(q, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
# qunif(p, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
# runif(n, min = 0, max = 1)
# These functions provide information about the uniform distribution on the interval from min to max. 
# dunif gives the density, punif gives the distribution function qunif gives the quantile function,runif generates random deviates.

# 类别变量和逻辑向量都可以进行汇总信息,多维对象，矩阵，数据框也可以通过summary汇总
# letters,LETTERS分别是内置的常数，包括了小写和大写的26个英文字母
fac <- factor(sample(letters[1:5],30,replace=TRUE))
summary(fac)

bool <- sample(c(TRUE,FALSE,NA),30,replace=TRUE)
summary(bool)

dfr <- data.frame(num,fac,bool)
head(dfr)
summary(dfr)
# head函数可以显示前几行

# str可以显示对象的结构，
str(num)
str(dfr)

# 每个类都有自己的print方法，以此来控制如何显示到控制台，但是这可能会导致忽略其内部结构
# 可以调用unclass函数来显示变量的结构

unclass(fac)

# attributes函数可以显示当前对象的所有属性列表
attributes(fac)

# 可以使用View函数查看矩阵、数据框等二维变量，edit，fix函数可以修改数据

View(dfr)
new_dfr <- edit(dfr)
fix(dfr)

View(head(dfr,50))

# 工作区

# 可以使用ls()列出所有变量名
peach <- 1
plum <- 'fruity'
pear <- TRUE
ls()

ls(pattern='ea')

# 可以使用rm()删除变量
rm(peach,plum,pear)
rm(list=ls())
































