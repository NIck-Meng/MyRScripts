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






























