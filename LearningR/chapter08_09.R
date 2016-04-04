# 流程控制与循环语句


# if语句：接受一个逻辑值，当为真时才执行下一条语句，
# if语句条件中不允许缺失值，否则引发错误，可以用is.na函数测试
if(TRUE) message('it was true')
if(FALSE) message('it was not true')
if(NA) message('who knows it was true?')
if(is.na(NA)) message('the value is missing')

if(runif(1) >0.5) message('this message appears with a 50% chance')
# 如果有条件地执行多条语句，可以将其括在大括号中
x <- 3
if(x>2)
{
  y <- 2*x
  z <- 3*y
}

# if-else语句：else必须与if语句的右大括号紧接在同一行，否则出现错误
if(FALSE)
{
  message("this won't execute")
} else
{
  message("but this will")
}

(r <- round(rnorm(2),1))
(x <- r[1]/r[2])
if(is.nan(x))
{
  message('x is missing')
} else if(is.infinite(x))
{
  message('x is infinite')
} else if(x>0)
{
  message('x is positive')
} else if(x<0)
{
  message('x is negative')
} else
{
  message('x is zero')
}

# 矢量化的if语句：elseif语句
# 当一般的if语句中传入一个以上的逻辑值，那么R会发出警告并且仅仅第一个被使用
# ifelse()为矢量化的if语句，其有三个参数，第一个是逻辑向量，
# 第二个参数值在向量为TRUE时返回，第三个参数在向量为FALSE时返回
# ifelse语句的第二个和第三个参数也可以是向量，应该与第一个向量长度相同
# 如果条件确实，那么结果中的相应位置也是确实的
ifelse(rbinom(10,1,0.5),'head','tail')
(yn <- rep.int(c(TRUE,FALSE),6))
ifelse(yn,1:3,-1:-12)
yn[c(3,6,9,12)] <- NA
ifelse(yn,1:3,-1:-12)

# 多个分支
# 如果语句中包含太多的else语句会降低代码的可读性，可以使用switch语句美化

# 第一个参数为返回字符串的表达式，后面的参数为与该表达式匹配时的返回值，
# 如找不到匹配的名字将返回NULL，此时可以提供一个没有命名的参数

(greek <- switch(
  'gamma',
  alpha=1,
  beta=sqrt(4),
  gamma=
{
  a <- sin(pi/3)
  4*a ^2
}
  ))


(greek <- switch(
  'delta',
  alpha=1,
  beta=sqrt(4),
  gamma=
{
  a <- sin(pi/3)
  4*a ^2
},
5
))

####################循环语句######################################

# 重复循环
# repeat可以反复执行代码,使用break可以跳出循环语句，
# 使用next可以跳出当前循环，进入下一次循环过程

repeat
{
  message('happy grounding day!')
  action <- sample(
    c('learn franch',
      'make an ice statue',
      'rob a bank',
      'win heart of andie mcdowell'),1)
  message('action=',action)
  if(action=='win heart of andie mcdowell') break
}



repeat
{
  message('happy grounding day!')
  action <- sample(
    c('learn franch',
      'make an ice statue',
      'rob a bank',
      'win heart of andie mcdowell'),1)
  message('action=',action)
  if(action=='rob a bank')
  {
    message('quitely skipping to the next iteration')
    next
  }
  message('action=',action)
  if(action=='win heart of audie mcdowell') break
}


# while循环

action <- sample(
  c('learn franch',
    'make an ice statue',
    'rob a bank',
    'win heart of andie mcdowell'),1)

while(action!='win heart of audie mcdowell')
{
  message('happy grounding day!')
  action <- sample(
    c('learn franch',
      'make an ice statue',
      'rob a bank',
      'win heart of andie mcdowell'),1)
  message('action=',action)
  
}

# for循环

for(i in 1:5) message('i=',i)

for(i in 1:5)
{
  j <- i^2
  message('j=',j)
}

for(month in month.name)
{message('the month of',month)}

for(yn in c(TRUE,FALSE,NA)) message('this statement is',yn)

l <- list(
  pi,
  LETTERS[1:5],
  charToRaw('not as complicated as it looks'),
  list(TRUE)
  )
for(i in l)
{print(i)}

# 高级循环

# rep可以将输入的参数重复数次，replicate可以调用表达式数次，
rep(runif(1),5)
replicate(5,runif(1))

time_for_commute <- function()
{
  mode_of_transport <- sample(
    c('car','bus','train','bike'),
    size=1,
    prob=c(0.1,0.2,0.3,0.4)
    )
  time <- switch(
    mode_of_transport,
    car=rlnorm(1,log(30),0.5),
    bus=rlnorm(1,log(40),0.5),
    train=rnorm(1,30,10),
    bike=rnorm(1,60,5))
  names(time) <- mode_of_transport
  time
}
replicate(5,time_for_commute())
 
# 遍历列表：lapply
prime_factors <- list(
  two=2,
  three=3,
  four=c(2,2),
  five=5,
  six=c(2,3),
  seven=7,
  eight=c(2,2,2),
  nine=c(3,3),
  ten=c(2,5))
head(prime_factors)
# 质因数分解：

# 可以使用for循环来遍历，但是速度太慢，效率太低
lapply(prime_factors,unique)

# 
sapply(prime_factors,unique)
sapply(prime_factors,length)


sapply(prime_factors,summary)

complemented <- c(2,3,6,18)
lapply(complemented,rep.int,times=4)

rep4x <- function(x) rep.int(4,times=x)
lapply(complemented,rep4x)

lapply(complemented,function(x) rep.int(4,times=x))


# 遍历数组：apply
install.packages('matlab')
library(matlab)

(magic4 <- magic(4))
class(magic4)
apply(magic4,1,sum)
apply(magic4,1,toString)
apply(magic4,2,toString)

(baldwins <- data.frame(
  name=c('alec','daniel','billy','stephen'),
  data_of_birth=c('1958-04-03','1960-10-05','1963-02-21','1966-03-12'),
  n_spouses=c(2,3,1,1),
  n_children=c(1,5,3,2),
  stringAsFactors=FALSE
  ))
apply(baldwins,1,toString)

apply(baldwins,2,toString)


# 输入多个向量参数
msg <- function(name,factors)
{
  ifelse(
    length(factors)==1,
    paste(name,'is prime'),
    paste(name,'has factors',toString(factors))
    ) 
}

mapply(msg,names(prime_factors),prime_factors)


# 即时向量化


Vertorize向量可以将一个接受标量的函数转换成一个接受向量的函数
baby_gender_report <- function(gender)
{
  switch(
    gender,
    male='it is a boy',
    female='it is a girl',
    '...')
}
genders <- c('male','female','other')
vector_baby_gender_report <- Vectorize(baby_gender_report)
vector_baby_gender_report(genders)

# 拆分-应用-合并
(frogger_scores <- data.frame(
  player=rep(c('tom','dick','harry'),times=c(2,5,3))
  ,score=round(rlnorm(10,8),-1)
  ))
(scores_by_player <- with(frogger_scores,split(score,player)))
(list_of_means_by_player <- lapply(scores_by_player,mean))
(mean_by_player <- unlist(list_of_means_by_player))

# plyr包：包含一系列名为**ply的函数，**分别表示函数的输入和输出形式
# llply输入和输出都是list，laply输入list，输出array，


library(plyr)
llply(prime_factors,unique)
laply(prime_factors,length)
laply(list(),length)


# raply能取代replicate函数，
raply(5,runif(1))
rlply(5,runif(1))
rdply(5,runif(1))
r_ply(5,runif(1))

frogger_scores$level <- floor(log(frogger_scores$score))
ddply(frogger_scores,
      .(player),
      colwise(mean))

ddply(frogger_scores,
      .(player),
      summarize,
      mean_score=mean(score),
      max_level=max(level)
      
      )
















