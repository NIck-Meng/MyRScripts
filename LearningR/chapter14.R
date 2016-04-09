# 数据可视化

#
data(obama_vs_mccain,package='learningr')
obama <- obama_vs_mccain$Obama
# 计算均值，中位数，汇总，方差，标准差，平均绝对误差，最小值，最大值
# pmin和pmax计算相同长度的向量中同意位置的最小值和最大值
# range直接给出最大值和最小值
# cummin,cummax分别计算向量中的最小值和最大值
# cumsum,cumprod分别计算数据的累加和累乘
mean(obama)
median(obama)
table(cut(obama,seq.int(0,100,10)))
var(obama)
sd(obama)
mad(obama)
min(obama)
with(obama_vs_mccain,pmin(Obama,McCain))

range(obama)
cummin(obama)
cumsum(obama)

# quantile计算分位数，默认为四分位数
quantile(obama)
quantile(obama,type=5)
quantile(obama,c(0.9,0.95,0.99))

# IQR直接计算四分位差
IQR(obama)

# summary可以一次完成多项统计计算
summary(obama_vs_mccain)

# cor函数计算两个向量之间的相关系数,cov计算协方差
# cancor计算

with(obama_vs_mccain,cor(Obama,McCain))
with(obama_vs_mccain,cancor(Obama,McCain))
with(obama_vs_mccain,cov(Obama,McCain))


############################################# 绘图系统

# ggplot2绘图系统

install.packages('ggplot2')
require(ggplot2)

# ggplot函数的第一参数为一个数据框，
ggplot(obama_vs_mccain,aes(Income,Turnout))+geom_point()

# 修改点的颜色和形状
ggplot(obama_vs_mccain,aes(Income,Turnout))+geom_point(color='violet',shape=20)

# 修改坐标
ggplot(obama_vs_mccain,aes(Income,Turnout))+
  geom_point()+
  scale_x_log10(breaks=seq(2e4,4e4,1e4))+
  scale_y_log10(breaks=seq(50,75,5))


# 把绘图分割到不同的面板，x刻度旋转，右对齐
ggplot(obama_vs_mccain,aes(Income,Turnout))+
  geom_point()+
  scale_x_log10(breaks=seq(2e4,4e4,1e4))+
  scale_y_log10(breaks=seq(50,75,5))+
  facet_wrap(~Region,ncol=5)+
  theme(axis.text.x = element_text(angle = 30, hjust = 1))

(gg1 <- ggplot(obama_vs_mccain,aes(Income,Turnout))+geom_point())

(gg2 <- gg1+facet_wrap(~Region,ncol=5)+
   theme(axis.text.x = element_text(angle = 30, hjust = 1)))




data(crab_tag,package='learningr')
# 一条线
ggplot(crab_tag$daylog,aes(Date,-Min.Depth))+geom_line()
# 两条线:方法一
ggplot(crab_tag$daylog,aes(Date))+geom_line(aes(y=-Max.Depth))+geom_line(aes(y=-Min.Depth))

# 两条线:方法二
crab_long <- melt(
  crab_tag$daylog,
  id.vars='Date',
  measure.vars=c('Min.Depth','Max.Depth')
  )
ggplot(crab_long,aes(Date,-value,group=variable))+geom_line()

# 两条线:方法三
ggplot(crab_tag$daylog,aes(Date,ymin=-Min.Depth,ymax=-Max.Depth))+geom_ribbon(color='black',fill='white')

ggplot(obama_vs_mccain,aes(Obama))+geom_histogram(binwidth=5)
ggplot(obama_vs_mccain,aes(Obama,..density..))+geom_histogram(binwidth=5)

ggplot(obama_vs_mccain,aes(Region,Obama))+geom_boxplot()


ovm <- obama_vs_mccain
ovm <- ovm[!(ovm$State %in% c("Alaska", "Hawaii")), ]
head(ovm)

religions_long <- melt(
  ovm,
  id.vars='State',
  measure.vars=c('Catholic','Protestant','Non.religious','Other'))
ggplot(religions_long,aes(State,value,fill=variable))+geom_bar(stat='identity')+coord_flip()

ggplot(religions_long,aes(State,value,fill=variable))+geom_bar(stat='identity',position='dodge')+coord_flip()









# 其他绘图包



