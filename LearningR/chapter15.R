#  分布与建模

# 随机数


sample(7)
sample(7,5)
sample(7,5,replace=TRUE)
sample(colors(),5)
sample(.leap.seconds,4)
weights <- c(1,1,2,3,5,8,13,21,8,3,1,1)
sample(month.abb,1,prob=weights)

# 从分布中抽样
# ?Distribution帮助页面记录了R基本包中的函数
# 大部分生成随机数的函数名称都是r<distn>,第一个参数是随机数的生成数量
# 这些生成的随机数都是伪随机数，
#

# 随机数需要一个初始值来生成，这个初始值即种子seed，通过把种子设为特定值，那么可以保证每次生成相同的随机数

set.seed(3)
runif(5)

# 公式
# 左边为响应变量，右边为指定变量，两者用波浪线隔开，
# 对于回归模型，默认具有截距项，公式中添加0就可以取消截距项
# 当变量有幂运算时，需要使用I()函数

# 线性回归模型

data(gonorrhoea,package='learningr')
head(gonorrhoea,10)
model1 <- lm(Rate ~ Year+Age.Group+Ethnicity+Gender,gonorrhoea)
summary(model1)

lapply(Filter(is.factor,gonorrhoea),levels)

# 比较和更新
# 在原模型基础上删除Year变量
model2 <- update(model1,~.-Year)
summary(model2)

# 方差分析:检验两个模型是否有显著区别
anova(model1,model2)

# AIC函数和BIC函数可以查看模型拟合优度,数字越小，模型越好

AIC(model1,model2)
BIC(model1,model2)

silly_model <- update(model1,~.-Age.Group)
anova(model1,silly_model)
AIC(model1,silly_model)
BIC(model1,silly_model)

model3 <- update(model2,~.-Gender)
summary(model3)

# 将数据改变
g2 <- within(
  gonorrhoea,
{
  Age.Group <- relevel(Age.Group,'30 to 34')
  Ethnicity <- relevel(Ethnicity,'Non-Hispanic Whites')
}
  )
model4 <- update(model3,data=g2)
summary(model4)

# 绘图和模型检查

plot_numbers <- 1:6
layout(matrix(plot_numbers,ncol=2,byrow=TRUE))
plot(model4,plot_numbers)

gonorrhoea[c(40,41,160),]

# lm()返回的模型变量非常复杂
str(model4)
unclass(model4)
formula(model4)
nobs(model4)
head(residuals(model4))
head(fitted(model4))
head(coefficients(model4))


head(cooks.distance(model4))
summary(model4)$r.squared


diagnostics <- data.frame(
  residuals=residuals(model4),
  fitted=fitted(model4)
  )
ggplot(diagnostics,aes(fitted,residuals))+geom_point()+geom_smooth(method='loess')

new_data <- data.frame(
  Age.Group='30 to 34',
  Ethnicity='Non-Hispanic White'
  )


predict(model4,new_data)


# 广义线性模型
# glm函数，可以为因变量的误差项和变换指定不同的分布














