# 第三章：语法突破
# 3.3绘制散点图

qplot(displ,hwy,data=mpg,color=factor(cyl))

# 散点图：每个观测都用一个点来表示，点的位置有两个变量的值决定，
# 点还有大小，颜色，形状等，这些属性称为图形属性aesthetics,每个图形属性都可以映射为一个变量或者设定为一个常数
# 在上图中，displ,hwy控制点的位置，cyl控制点的颜色，点的大小和形状都没有映射变量，使用默认值

# 3.4 更复杂的图形实例

qplot(displ,hwy,data=mpg,facets=.~year)+geom_smooth()


# 3.5图层语法的组件


# 标度控制着数据到图形属性的映射，图形上的每一个图形属性都对应着一个标度，每个标度都作用于图形中的所有数据

# 坐标系coord，可将对象的位置映射到图形平面上

# 3.6 数据结构

# 一个图形对象就是一个包含数据，映射，图层，标度，坐标和分面的列表。

# 绘图有两种方式，一种是一步到位式，即qplot，另一种是逐层叠加式，即利用ggplot和图层函数逐步作图

# 当得到一个图形对象时，可以使用如下方法处理：
# 1，使用print函数将其打印到屏幕上，
# 2，使用ggsave函数将其保存到磁盘
# 3，用summary函数查看其结构
# 4，用save函数将其缓存副本保存到磁盘，可以用load函数重现

p <- qplot(displ,hwy,data=mpg,color=factor(cyl))
summary(p)

save(p,file='plot.rdata')
load('plot.rdata')
ggsave('plot.png',width=5,height=5)






















