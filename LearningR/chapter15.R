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

################################################ 线性回归模型

# 在R中，拟合线性模型的最基本函数就是lm()函数，

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


#OLS回归

# 简单线性回归
fit <- lm(weight ~ height, data = women)
summary(fit)
women$weight
fitted(fit)
residuals(fit)
# scatter plot of height by weight

plot(women$height, women$weight, main = "Women Age 30-39", 
     xlab = "Height (in inches)", ylab = "Weight (in pounds)")
# add the line of best fit
abline(fit)

# 多项式回归
# Listing 8.2 - Polynomial regression

fit2 <- lm(weight ~ height + I(height^2), data = women)
summary(fit2)

plot(women$height, women$weight, main = "Women Age 30-39", 
     xlab = "Height (in inches)", ylab = "Weight (in lbs)")
lines(women$height, fitted(fit2))

# scatterplot for women data

library(car)
scatterplot(weight ~ height, data = women, spread = FALSE, 
            lty.smooth = 2, pch = 19, main = "Women Age 30-39", xlab = "Height (inches)", 
            ylab = "Weight (lbs.)")


# 多元线性回归
# Listing 8.3 - Examining bivariate relationship

states <- as.data.frame(state.x77[, c("Murder", "Population", 
                                      "Illiteracy", "Income", "Frost")])

cor(states)

library(car)
scatterplotMatrix(states, spread = FALSE, lty.smooth = 2, 
                  main = "Scatterplot Matrix")


# Listing 8.4 - Multiple linear regression

fit <- lm(Murder ~ Population + Illiteracy + Income + 
            Frost, data = states)
summary(fit)


# 有交互项的多元线性回归

# Listing 8.5 Multiple linear regression with a significant
# interaction term

fit <- lm(mpg ~ hp + wt + hp:wt, data = mtcars)
summary(fit)

install.packages('effects')
library(effects)
plot(effect("hp:wt", fit, list(wt = c(2.2, 3.2, 4.2))), 
     multiline = TRUE)



# 广义线性模型
# 在一般线性模型中，假设因变量服从正态分布，但是很多情况下，这个假设并不合理
# 1，因变量可能是类别型的，比如probit和Logit模型，2，因变量可能是计数型的，这类变量是非负值的
# 广义线性模型扩展了一般线性模型，包含了非正态分布因变量的分析
# 在R中，glm函数可以拟合广义线性模型

sapply(c('AER','robust','qcc'),install.packages)

# --Logistic Regression--

# get summary statistics
data(package='AER')
data(Affairs, package = "AER")
summary(Affairs)
table(Affairs$affairs)

# create binary outcome variable
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0

Affairs$ynaffair <- factor(Affairs$ynaffair, levels = c(0, 1), labels = c("No", "Yes"))
table(Affairs$ynaffair)

# fit full model
fit.full <- glm(ynaffair ~ gender + age + yearsmarried + 
                  children + religiousness + education + occupation + rating, 
                data = Affairs, family = binomial())
summary(fit.full)

# fit reduced model
fit.reduced <- glm(ynaffair ~ age + yearsmarried + 
                     religiousness + rating, data = Affairs, family = binomial())
summary(fit.reduced)

# compare models
anova(fit.reduced, fit.full, test = "Chisq")

# interpret coefficients
coef(fit.reduced)
exp(coef(fit.reduced))

# calculate probability of extramariatal affair by marital ratings
testdata <- data.frame(rating = c(1, 2, 3, 4, 5), 
                       age = mean(Affairs$age), yearsmarried = mean(Affairs$yearsmarried), 
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit.reduced, newdata = testdata, 
                         type = "response")
testdata


# calculate probabilites of extramariatal affair by age
testdata <- data.frame(rating = mean(Affairs$rating), 
                       age = seq(17, 57, 10), yearsmarried = mean(Affairs$yearsmarried), 
                       religiousness = mean(Affairs$religiousness))
testdata$prob <- predict(fit.reduced, newdata = testdata, 
                         type = "response")
testdata



# evaluate overdispersion
fit <- glm(ynaffair ~ age + yearsmarried + religiousness + 
             rating, family = binomial(), data = Affairs)
fit.od <- glm(ynaffair ~ age + yearsmarried + religiousness + 
                rating, family = quasibinomial(), data = Affairs)
pchisq(summary(fit.od)$dispersion * fit$df.residual, 
       fit$df.residual, lower = F)

# --Poisson Regression--

# look at dataset
data(breslow.dat, package = "robust")
names(breslow.dat)
summary(breslow.dat[c(6, 7, 8, 10)])

# fit regression
fit <- glm(sumY ~ Base + Age + Trt, data = breslow.dat, 
           family = poisson())
summary(fit)

# interpret model parameters
coef(fit)
exp(coef(fit))

# 过度离势 overdispersion


# 泊松分布的方差和期望相等，当因变量观测值得方差比比依据泊松分布预测的方差大时，泊松回归可能发生过度离势
# 由于计数型变量经常发生过度离势，且过度离势会对结果的解释发生负面影响，
# Residual deviance:  559.44  on 55  degrees of freedom
# 残差偏差/自由度=10.17>>1 故存在过度离势
# qcc包可以检验过度离势
# 
library(qcc)
qcc.overdispersion.test(breslow.dat$sumY, type = "poisson")
# P值远远小于0.05，可见存在过度离势

# fit model with quasipoisson
fit.od <- glm(sumY ~ Base + Age + Trt, data = breslow.dat, 
              family = quasipoisson())
summary(fit.od)






















