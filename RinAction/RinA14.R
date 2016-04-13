# 主成分和因子分析

# 主成分分析PCA是一种数据降维技术，将大量相关数据转化成一组很少的不相关变量，这些无关变量就是主成分
# 因子分析EFA是一种用来发现一组变量潜在结构的方法，通过寻找一组更小的，潜在的隐藏的结构来解释已经观测到的显示的变量之间的关系

library(psych)
data <- USJudgeRatings[,-1]
fa.parallel(data,fa='pc',n.iter=100,show.legend=FALSE,main='scree plot with parallel analysis')

# KH准则建议保留特征值大于1的主成分，
# Cattell碎石检验绘制了特征值和主成分数的图形，可见选择一个主成分即可

# 提取主成分'

library(psych)
pc=principal(data, nfactors=1)
pc

# Listing 14.5 - Obtaining principal component scroing coefficients

library(psych)
fa.parallel(Harman23.cor$cov, n.obs = 302, fa = "pc", 
            n.iter = 100, show.legend = FALSE, 
            main = "Scree plot with parallel analysis")
pc <- principal(Harman23.cor$cov, nfactors = 2, rotate = "none")
pc

# 主成分旋转：使得选择的成分不相关(正交旋转)或相关(斜交旋转)，最流行的正交旋转方法是方差极大旋转


方差最大旋转
rc <- principal(Harman23.cor$cov, nfactors = 2, rotate = "varimax")
rc

# 获取主成分得分
library(psych)
pc=principal(data, nfactors=1,score=TRUE)
head(pc$scores)



################################## 因子分析

options(digits = 2)
library(psych)
covariances <- ability.cov$cov
# convert covariances to correlations
correlations <- cov2cor(covariances)
correlations

# determine number of factors to extract
fa.parallel(correlations, n.obs = 112, fa = "both", 
            n.iter = 100, main = "Scree plots with parallel analysis")

# fa = "both" 表示展示了主成分和因子分析的结果
# KH准则建议保留特征值大于0的因子，

# Listing 14.6 - Principal axis factoring without rotation

fa <- fa(correlations, nfactors = 2, rotate = "none", fm = "pa")
fa


# 因子旋转

fa.varimax <- fa(correlations,nfactors=2,rotate='varimax',fm='pa')

fa.promax <- fa(correlations,nfactors=2,rotate='promax',fm='pa')


factor.plot(fa.promax, labels = rownames(fa.promax$loadings))
fa.diagram(fa.promax, simple = FALSE)
