# 第十三章：数据清洗和转换

# 清理字符串

# 将Y和N编码成TRUE和FALSE
yn_to_logical <- function(x)
{
  y <- rep.int(NA,length(x))
  y[x=='Y'] <- TRUE
  y[x=='N'] <- FALSE
  y
}
aple_d_huez$DrugUse <- yn_to_logical(alpe_d_huez$DrugUse)



data(english_monarchs,package='learningr')
head(english_monarchs)

install.packages('stringr')
library(stringr)
multiple_kingdoms <- str_detect(english_monarchs$domain,fixed(','))
english_monarchs[multiple_kingdoms,c('name','domain')]

multiple_rulers <- str_detect(english_monarchs$name,',|and')
english_monarchs$name[multiple_rulers & !is.na(multiple_rulers)]

individual_rulers <- str_split(english_monarchs$name,',|and')
head(individual_rulers[sapply(individual_rulers,length)>1])


th <- c('th','e','ð','S')
sapply(th,
       function(th)
         {
         sum(str_count(english_monarchs$name,th),na.rm = TRUE)        
       })

gender <- c('MALE','MALE','male','M','FEMALE','Female','female','f',NA)
clean_gender <- str_replace(gender,ignore.case('^m(ale)?$'),'MALE')
(clean_gender <- str_replace(
  clean_gender,
  ignore.case('^f(female)?$'),'Female'
  ))



# 操作数据框


# 添加和替换列
english_monarchs$length.of.reign.years <- with(english_monarchs,end.of.reign - start.of.reign)

english_monarchs <- within(
  english_monarchs,
{
  length.of.reign.years <- end.of.reign - start.of.reign
}
) 

english_monarchs <- within(english_monarchs,{
  length.of.reign.years <- end.of.reign - start.of.reign
  reign.was.more.than.30.years <- length.of.reign.years >30
  
})

# 正在创建或改变某一列，使用with，
# 当一次操作多个列，使用within

# 处理缺失值
data(package='learningr')
data('deer_endocranial_volume',package='learningr')

has_all_measurements <- complete.cases(deer_endocranial_volume)
deer_endocranial_volume[has_all_measurements,]


# na.omit函数能够删除带有缺失值的行
na.omit(deer_endocranial_volume)
na.fail(deer_endocranial_volume)

# 在宽表格和长表格之间转换

# 一般的数据格式为宽格式，有时需要将宽格式转换成长格式
# 

#  下为宽格式n*k
#  姓名  物理  数学  英语
#  李四  78    99    86 
#  李三  66    87    97
#
#  下位长格式n(k-1)*3
#  姓名   科目  成绩
#  李四   物理  78
#  李三   物理  66
#  李四   数学  99
#  李三   数学  87
#  李四   英语  86
#  李三   英语  97
#


install.packages('reshape2')
require(reshape2)

deer_endocranial_volume[1:5,]
(deer_wide <- deer_endocranial_volume[,1:5])

deer_long <- melt(deer_wide,id.vars='SkullID')
head(deer_long)
# 
melt(deer_wide,measure.vars=c('VolCT','VolBead','VolLWH','VolFinarelli'))

# dcast函数将长格式转换成宽格式，返回一个数据框

deer_wide_again <- dcast(deer_long,SkullID~variable)
head(deer_wide_again)

# 使用SQL

install.packages('sqldf')
require(sqldf)


subset(
  deer_endocranial_volume,
  VolCT>400 | VolCT2 >400,
  c(VolCT,VolCT2) 
  )

query <- 
  'SELECT VolCT,VolCT2
FROM deer_endocranial_volume
WHERE VolCT>400 OR VolCT2 >400'
sqldf(query)


# 排序

x <- c(2,32,4,16,8)
sort(x)
sort(x,decreasing=TRUE)

# 字符串也可以排序，但顺序取决于语言环境，通常字母从a到z排序
sort(c('I','shot','the','city','sheriff'))

# x[order(x)]与sort()相同
order(x)
x[order(x)]

year_order <- order(english_monarchs$start.of.reign)
english_monarchs[year_order,]

# plyr包中的arrange函数可以对数据框排序
library(plyr)
arrange(english_monarchs,start.of.reign)


# rank为数据集中的每个元素给出排名，
(x <- sample(3,7,replace=TRUE))
rank(x)
rank(x,ties.method='first')

# 函数式编程













