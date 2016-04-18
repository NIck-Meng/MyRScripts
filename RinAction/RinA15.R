# 处理缺失值

# 安装VIM和mice包
sapply(c('VIM','mice'),install.packages)


data(sleep,package='VIM')
str(sleep)
# 识别缺失数据
sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]

complete.cases(sleep)

# 逻辑值TRUE和FALSE分别等价于1和0，可以用sum，mean函数获取缺失值的有用信息

sum(is.na(sleep$Dream))
mean(is.na(sleep$Dream))
mean(!complete.cases(sleep))

# complete.case()将NA，NaN作为缺失值，其随着数据量的增大，该方法效率较低

# 探索缺失值模式

# 列表显示缺失值
# mice包中的md.pattern()可以生成以矩阵或数据框形式展示缺失值模式的表格

library(mice)
data(sleep,package='VIM')
md.pattern(sleep)

# 图形探索缺失数据

# VIM包中的aggr()不仅绘制了每个变量的缺失值数，而且绘制了变量组合的缺失值数
# matrixplot()可以生成每个实例数据的图形，缺失值为红色，用灰度表示数值大小，浅色表示值小。
# matrixplot()还可以生成一副散点图，

library(VIM)
aggr(sleep, prop = FALSE, numbers = TRUE)
# numbers = TRUE表示删去数值型的标签

matrixplot(sleep) 
marginplot(sleep[c("Gest", "Dream")], pch = c(20), 
           col = c("darkgray", "red", "blue"))

# 
# use correlations to explore missing values

# 影子矩阵：用指示变量替代数据集中的数据，比如用1表示缺失,0表示存在

x <- as.data.frame(abs(is.na(sleep)))
head(sleep, n=5)
head(x, n=5)
y <- x[which(sd(x) > 0),]
cor(y)
cor(sleep, y, use = "pairwise.complete.obs")



hh <- data.frame(a=c(1,2,3),b=c(4,5,6),c=c(7,8,9))
hh[which(sd(hh)>0)]




