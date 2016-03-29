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





















