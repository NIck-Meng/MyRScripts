# 环境与函数

# 创建和调用函数
# 

hypotenuse <- function(x,y)
{
  sqrt(x^2+y^2)
}
hypotenuse(3,4)
hypotenuse(y=24,x=7)

# 默认参数
hypotenuse <- function(x=5,y=12)
{
  sqrt(x^2+y^2)
}
hypotenuse()

# formals函数可以取得函数的参数并返回一个列表
formals(hypotenuse)



# 变量的作用域

# 在函数内部的变量，该变量后面的语句和子函数都可以对其进行访问


f <- function(x)
{
  y <- 1
  g <- function(x)
  {
    (x+y)/2
  }
  g(x)
}

f(2)



f <- function(x)
{
  y <- 1
  g(x)
}
g <- function(x)
{
  (x+y)/2
}

f(2)

# get和exist函数用在其父环境和当前环境中搜索变量，








