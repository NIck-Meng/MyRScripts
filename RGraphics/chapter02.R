# 第二章：从qplot开始入门


# 2.1qplot是ggplot2包中的第一个作图函数，qplot即quick plot，快速作图
library(ggplot2)
data(diamonds,package='ggplot2')

# 2.2随机从数据集中选取100行作为样本数据

# nrow and ncol return the number of rows or columns present in x
set.seed(1410) ##让样本可重复
dsmall <- diamonds[sample(nrow(diamonds),100),]


# 2.3基本用法
# qplot的前两个参数为x和y,还有一个可选的data参数，如果进行了指定，那么函数首先在数据框内寻找变量名，然后在R的工作空间中搜索
qplot(carat,price,data=diamonds)
# carat克拉

# qplot函数支持将变量的函数作为参数
qplot(log(carat),log(price),data=diamonds)

qplot(carat,x*y*z,data=diamonds)

# 2.4颜色，大小，形状，及其他图形属性

qplot(carat,price,data=dsmall,colour=color)
qplot(carat,price,data=dsmall,shape=cut)

# 也可以使用I()来手动设定图形属性，如颜色colour=I('red'),大小size=I(2),透明度alpha=I(1/10)
qplot(carat,price,data=diamonds,alpha=I(1/10))
qplot(carat,price,data=diamonds,alpha=I(1/100))
qplot(carat,price,data=diamonds,alpha=I(1/200))

# 2.5几何对象geom
# 通过改变几何对象geom，可以画出任何一种类型的图形

# geom='point'可以绘制散点图，为指定了x和y参数的默认设置
# geom='smooth'可以拟合一条平滑的曲线
# geom='boxplot'可以绘制箱线图
# geom='path'和geom='line'可以在数据点之间绘制连线

# 对于一维的分布，几何对象的选择的由变量类型决定的，
# 对于连续变量geom='histogram'可以绘制直方图，geom='freqploy'可以绘制多边形
# geom='density'绘制密度曲线，
# 对于离散变量，geom='bar'绘制条形图

# 2.5.1向图中添加平滑曲线

# 可以使用c()函数将多个几何对象组成一个向量传递给geom，几何对象会按照指定的顺序进行堆叠
qplot(carat,price,data=dsmall,geom=c('point','smooth'))
qplot(carat,price,data=diamonds,geom=c('point','smooth'))


# --------------------------------------------------------
# 以下内容仅可在ggplot2 1.x中使用，在ggplot2 2.x中删除,
#利用method可以选择不同的平滑器，
# 设置method=‘loess’，使用局部回归方法，是n小于1000时的默认选项
# 设置method=‘gam’，formula=y~s(x)来调用mgcv包拟合一个广义可加模型，
# 对于大数据，需使用公式y~s(x,bs='cs')

library(mgcv)
qplot(carat,price,data=dsmall,geom=c('point','smooth'),
      method='gam',formula=y~s(x))

qplot(carat,price,data=dsmall,geom=c('point','smooth'),
      method='gam',formula=y~s(x,bs='cs'))
# method='lm'拟合线性模型，可以通过指定formula=y~ploy(x,2)来拟合一个二次多项式或加载splines包以使用自然样条：
# formula=y~ns(x,3),第二个参数是自由度，越大曲线的波动就越大

library(splines)
qplot(carat,price,data=dsmall,geom=c('point','smooth'),
      method='lm')

qplot(carat,price,data=dsmall,geom=c('point','smooth'),
      method='lm',formula=y~ns(x,5))

# method='rlm'采用一种更加稳健的拟合算法，使得结果对异常值不太敏感，不过这种方法需要加载MASS包。

# 利用span参数设置曲线的平滑程度，从0到1，
qplot(carat,price,data=dsmall,geom=c('point','smooth'),span=0.2)
qplot(carat,price,data=diamonds,geom=c('point','smooth'),span=1)

# 以上内容仅可在ggplot2 1.x中使用，在ggplot2 2.x中删除,
#--------------------------------------------------------------

# 2.5.2 箱线图和扰动点图

# 如果一个数据集中包含了一个分类变量，和一个或多个连续变量，可以使用箱线图和扰动点图查看连续变量与分类变量水平的关系
# geom='jitter'为扰动点，geom=‘boxplot’为箱线图

qplot(color,price/carat,data=diamonds,geom='jitter',alpha=I(1/5))
qplot(color,price/carat,data=diamonds,geom='jitter',alpha=I(1/50))
qplot(color,price/carat,data=diamonds,geom='jitter',alpha=I(1/200))

# 2.5.3直方图和密度曲线图
# 绘制单个变量的分布
# 对于密度曲线而言，adjust参数控制曲线的平滑程度，
# 对于直方图而言，binwidth参数通过设定组距来调节平滑度
qplot(carat,data=diamonds,geom='histogram')
qplot(carat,data=diamonds,geom='density')
qplot(carat,data=diamonds,geom='density',adjust=3)

qplot(carat,data=diamonds,geom='histogram',binwidth=1,xlim=c(0,3))
qplot(carat,data=diamonds,geom='histogram',binwidth=0.1,xlim=c(0,3))
qplot(carat,data=diamonds,geom='histogram',binwidth=0.01,xlim=c(0,3))

# 要在不同组之间对分布进行对比，需要加上一个图形映射，如下

qplot(carat,data=diamonds,geom='density',color=color)
qplot(carat,data=diamonds,geom='histogram',fill=color)

# 2.5.4 条形图
# 设置geom=‘bar’
qplot(color,data=diamonds,geom='bar')
qplot(color,data=diamonds,geom='bar',weight=carat)+scale_y_continuous('carat')

# 2.5.5














