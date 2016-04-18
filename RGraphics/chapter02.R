# 第二章：从qplot开始入门

# qplot是ggplot2包中的第一个作图函数，qplot即quick plot，快速作图
library(ggplot2)
data(diamonds,package='ggplot2')

# 随机从数据集中选取100行作为样本数据
set.seed(1410)
dsmall <- diamonds[sample(nrow(diamonds),100),]

# 基本用法
# qplot的前两个参数为x和y,还有一个可选的data参数
qplot(carat,price,data=diamonds)

qplot(log(carat),log(price),data=diamonds)

qplot(carat,x*y*z,data=diamonds)

# 颜色，大小，形状，及其他图形属性

qplot(carat,price,data=dsmall,colour=color)
qplot(carat,price,data=dsmall,shape=cut)

# 也可以使用I()来手动设定图形属性，如colour=I('red'),size=I(2),alpha=I(1/10)
qplot(carat,price,data=diamonds,alpha=I(1/10))
qplot(carat,price,data=diamonds,alpha=I(1/100))
qplot(carat,price,data=diamonds,alpha=I(1/200))

# 几何对象
# 通过改变几何对象geom，可以画出任何一种类型的图形

# geom='point'可以绘制散点图，为指定了x和y参数的默认设置
# geom='smooth'可以拟合一条平滑的曲线
# geom='boxplot'可以绘制箱线图
# geom='path'和geom='line'可以在数据点之间绘制连线

# geom='histogram'可以绘制直方图
# geom='density'绘制密度曲线，geom='bar'绘制条形图

# 向图中添加平滑曲线

# 可以使用c()函数将多个几何对象组成一个向量传递给geom，几何对象会按照指定的顺序进行堆叠
qplot(carat,price,data=dsmall,geom=c('point','smooth'))
qplot(carat,price,data=diamonds,geom=c('point','smooth'))
















