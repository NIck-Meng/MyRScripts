# 列表和数据框

# 列表用list函数创建，list的元素类型不限，可以是向量，数组，矩阵，函数
(a_list <- list(c(1,1,2,5,14,42),
                month.abb,
                matrix(c(3,-8,1,-3),nrow=2),asin))
names(a_list) <- c('catalan','months','involutary','arcsin')
a_list

(the_same_list <- list(
  catalan=c(1,1,2,5,14,42),
  months=month.abb,
  involutary=matrix(c(3,-8,1,-3),nrow=2),
  arcsin=asin
  )) 


main_list <- list(
  middle_list=list(element_in_middle_list=diag(3),
                   inner_list=list(element_in_inner_list=pi^1:4,
                                   another_element_in_inner_list='a')),
                   element_in_main_lsit=log10(1:10)

  )

# 
length(a_list)
length(main_list)

l1 <- list(1:5)
l2 <- list(6:10)
l1[[1]]+l2[[1]]

#索引列表

l <- list(
  first=1,
  second=2,
  third=list(
    alpha=3.1,
    beta=3.2))

l[1:2]
l[-3]
l[c('first','second')]
l[c(TRUE,TRUE,FALSE)]

l[[1]]
l[['first']]

is.list(l[1])
is.list(l[[1]])


l$first

l[['third']]['beta']

l[['third']][['beta']]


l[c(4,2,5)]
l[c('fourth','second','fifth')]

l[['fourth']]
l$fourth





# 向量和列表之间的转换
# 向量可以使用as.list函数将其转换成列表，

busy_beaver <- c(1,6,21,107)
as.list(busy_beaver)

# 如果列表中每个元素都是标量值，那么可以通过as系列函数将其转换成向量，
# 如果列表中含有非标量值，这种方法不起作用,可以使用unlist将其转换成向量
as.numeric(list(1,6,21,107))

(prime_factors <- list(two=2,
                       three=3,
                       four=c(2,2),
                       five=5,
                       six=c(2,3),
                       seven=7,
                       eight=c(2,2,2),
                       nine=c(3,3),
                       ten=c(2,5)))


unlist(prime_factors)

# 组合列表
# c函数既可以拼接向量，也可以拼接列表,如果用来拼接向量和列表，那么向量被转换成列表然后进行拼接，
c(list(a=1,b=2),list(3))
c(list(a=1,b=2),3)

# NULL值

# NULL和NA不同，NA是一个标量值，会占用内存空间，而NULL不占用任何空间，长度为零
# 可以使用is.null函数判断变量是否为NULL
(uk_bank_holidays_2013 <- list(
  jan='new year\'s day',
  feb=NULL,
  mar='good friday',
  apr='easter monday',
  may=c('early may bank holiday','spring bank holiday'),
  jun=NULL,
  jul=NULL,
  aug='summer bank holiday',
  sep=NULL,
  oct=NULL,
  nov=NULL,
  dec=c('christmas day','boxing day')))
length(NULL)
length(NA)

is.null(NULL)
is.null(NA)

# NULL可以用于删除列表中的元素，将其设置为NULL即删除
uk_bank_holidays_2013$jan <- NULL

# 要将某个元素设置为NULL，不能为其分配NULL，因为这会删除这个元素，应该用list(NULL)来设置，
uk_bank_holidays_2013[['aug']] <- list(NULL)
uk_bank_holidays_2013

# 数据框
# 用data.frame函数创建数据框

a_data_frame <- data.frame(x=letters[1:5],
                           y=rnorm(5),
                           z=runif(5)>0.5)
class(a_data_frame)

y <- rnorm(5)
names(y) <- month.name[1:5]
data.frame(
  x=letters[1:5],
  y=y,
  z=runif(5)>0.5)

data.frame(
  x=letters[1:5],
  y=y,
  z=runif(5)>0.5,
  row.names=NULL)

data.frame(
  x=letters[1:5],
  y=y,
  z=runif(5)>0.5,
  row.names=c('jackie','tito','jermaine','marlon','micheal'))


















