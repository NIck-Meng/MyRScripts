# 第四章：用图层构建图像

# qplot的局限在于只能使用一个数据集和一组图形属性映射，解决这个问题的办法是使用图层
# 每个图层都可以有自己的数据集和图像属性映射,附加的数据元素可通过图层添加到图形中。

# 一个图层有五部分组成：
# 1，数据，必须是一个数据框
# 2，一组图形属性映射，
# 3，几何对象
# 4，统计变换，统计变换会返回一个包含新变量的数据框
# 5，位置调整，通过调整元素位置来避免图形重合
#


# 4.2 创建绘图对象

# 当使用qplot时，他其实为我们做了很多幕后的工作
# 包括创建了一个图形对象，使用默认的绘图参数，添加图层并展示结果，

# 使用ggplot函数手动创建绘图对象，该函数有两个主要参数
# 数据和图形属性映射，这两个参数被设为绘图的默认参数，
# 只有在新添加的图层里设定了新参数时，默认值才会被修改
# 数据必须是数据框，映射必须将图形属性和变量名放在aes函数中，
# 图形对象在加上图层之前无法显示
p=ggplot(diamonds,aes(carat,price,color=cut))

# 4.3 图层

layer(geom,geom_params,stat,stat_params,data,mapping,position)

p <- p+layer(geom='point')

p <- ggplot(diamonds,aes(x=carat))
p <- p+layer(
             geom='bar',
             geom_params=list(fill='steelblue'),
             stat='bin',
             stat_params=list(binwidth=2)
)

# 使用快捷函数，所有快捷函数都具有相同的形式，以geom_,stat_开头
# mapping,通过aes函数来设定
# data，一个数据集，
# geom或stat，可以修改默认的值
# geom或stat参数，
# position，选择一种调整对象重合的方式。

# 注意：

geom_histogram(binwidth=2,fill='steelblue')


ggplot(msleep,aes(sleep_rem/sleep_total,awake))+geom_point()
# 等价于
qplot(sleep_rem/sleep_total,awake,data=msleep)

qplot(sleep_rem/sleep_total,awake,data=msleep)+geom_smooth()
# 等价于
qplot(sleep_rem/sleep_total,awake,data=msleep,geom=c('point','smooth'))
# 等价于
ggplot(msleep,aes(sleep_rem/sleep_total,awake))+geom_smooth()+geom_smooth()


# 图层也是R对象，可以保存到变量中，
library(scales)
bestfit <- geom_smooth(method='lm',se=F,color=alpha('steelblue',0.5),size=2)

qplot(sleep_rem,sleep_total,data=msleep)+bestfit
qplot(awake,brainwt,data=msleep,log='y')+bestfit
qplot(bodywt,brainwt,data=msleep,log='xy')+bestfit

# 4.4 数据
# ggplot2中的数据集必须是一个数据框，
# ggplot2会从给定的数据框中提取绘图所用的变量，生成一个新的数据集，而不是直接在元数据上进行数据变换
#
# 用%+%来添加新的数据集来代替原来的数据集
p <- ggplot(mtcars,aes(mpg,wt,color=cyl))+geom_point()

mtcars <- transform(mtcars,mpg=mpg^2)
p %+% mtcars

# 数据以副本而不是引用的形式存储到图形对象中，

# 4.5 图形属性映射
# aes函数将数据变量映射到图形中，从而使变量成为可以被感知的图形属性
# 

# 默认的图形属性映射可以在图形对象初始化时设定，也可以之后用+修改

p <- ggplot(mtcars)
summary(p)
p <- p+aes(wt,hp)
summary(p)

p <- ggplot(mtcars,aes(x=mpg,y=wt))
p+geom_point()

p+geom_point(aes(color=factor(cyl)))
p+geom_point(aes(y=disp))


# 设定和映射

p <- ggplot(mtcars,aes(mpg,wt))
p+geom_point(color='darkblue')
# 与以下不同，将颜色设定为深蓝和将颜色映射到深蓝
p+geom_point(aes(color='darkblue'))

# 分组
# ggplot2中，几何对象可以大致分为个体几何对象和群组几何对象两大类，
# 个体几何对象将数据框中的每个观测绘制一个区别于其他观测的图形对象
# 群组几何对象用来表示多条观测，





data(Oxboys ,package='nlme')
str(Oxboys)
p <- ggplot(Oxboys,aes(age,height,group=Subject))+geom_line()
p <- ggplot(Oxboys,aes(age,height))+geom_line()


# 不同图层上的不同分组
有事我们想蜂聚不同的
# 

p+geom_smooth(aes(group=Subject),method='lm',se=F)
p+geom_smooth(aes(group=Subject),method='lm',size=2,se=F)

# 修改默认分组

boysbox <- ggplot(Oxboys,aes(Occasion,height))+geom_boxplot()

boysbox+geom_line(aes(group=Subject),color='#3366FF')

# 匹配图形属性和图形对象




# 4.6 几何对象geom
#



# 4.7 统计变换stat
# 统计变换即对数据进行统计变换，通常以某种方式对数据信息进行汇总

# 生成变量的名字必须用..围起来，
ggplot(diamonds,aes(carat))+geom_histogram(aes(y=..density..),binwidth=0.1)


# 4.8 位置调整

# 4.9 整合

d <- ggplot(diamonds,aes(carat))+xlim(0,3)
d+stat_bin(aes(ymax=..count..),binwidth=0.1,geom='area')
d+stat_bin(
  aes(size=..density..),
  binwidth=0.1,
  geom='point',position='identity'
  
  )

d+stat_bin(
  aes(y=1,fill=..count..),binwidth=0.1,
  geom='tile',position='identity'
  )

# 改变图形属性和数据集
# ggplot可以将不同数据画在不同图层上

require(nlme,quiet=TRUE,warn.conflicts=FALSE)

model <- lme(height~age,data=Oxboys,random=~1+age|Subject)

oplot <- ggplot(Oxboys,aes(age,height,group=Subject))+geom_line()

age_grid <- seq(-1,1,length=10)
subjects <- unique(Oxboys$Subject)

preds <- expand.grid(age=age_grid,Subject=subjects)
preds$height <- predict(model,preds)

oplot +geom_line(data=preds,color='#3366FF',size=0.4)

Oxboys$fitted <- predict(model)
Oxboys$resid <- with(Oxboys,fitted-height)

oplot %+% Oxboys +aes(y=resid)+geom_smooth(aes(group=1))

model2 <- update(model,height~age +I(age^2))
Oxboys$fitted2 <- predict(model2)
Oxboys$resid2 <- with(Oxboys,fitted-height)
oplot %+% Oxboys+aes(y=resid2)+geom_smooth(aes(group=1))







