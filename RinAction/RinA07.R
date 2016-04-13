# 第七章：基本统计分析

vars <- c("mpg", "hp", "wt")
head(mtcars[vars])

# Listing 7.1 - descriptive stats via summary

summary(mtcars[vars])

# Listing 7.2 - descriptive stats via sapply()

mystats <- function(x, na.omit = FALSE) {
  if (na.omit) 
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x - m)^3/s^3)/n
  kurt <- sum((x - m)^4/s^4)/n - 3
  return(c(n = n, mean = m, stdev = s, skew = skew, kurtosis = kurt))
}

sapply(mtcars[vars], mystats)
# Listing 7.3 - Descriptive statistics (Hmisc package)
sapply(list('Hmisc','pastecs','psych'),install.packages)

library(Hmisc)
describe(mtcars[vars])

# Listing 7.4 - Descriptive statistics (pastecs package)

library(pastecs)
stat.desc(mtcars[vars])


# Listing 7.5 - Descriptive statistics (psych package)

library(psych)
describe(mtcars[vars])

# Listing 7.6 - Descriptive statistics by group with aggregate()

aggregate(mtcars[vars], by = list(am = mtcars$am), mean)
aggregate(mtcars[vars], by = list(am = mtcars$am), sd)

# Listing 7.7 - Descriptive statistics by group via by()

dstats <- function(x)(c(mean=mean(x), sd=sd(x)))
by(mtcars[vars], mtcars$am, dstats)

# Listing 7.8 Summary statists by group (doBy package)

library(doBy)
summaryBy(mpg + hp + wt ~ am, data = mtcars, FUN = mystats)



# 独立性检验
# chisq.test()可以对二维表的行变量和列变量进行卡方独立性检验

library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
chisq.test(mytable)
mytable <- xtabs(~Improved+Sex, data=Arthritis)
chisq.test(mytable)

# Fisher's exact test

mytable <- xtabs(~Treatment+Improved, data=Arthritis)
fisher.test(mytable)

# Chochran-Mantel-Haenszel test

mytable <- xtabs(~Treatment+Improved+Sex, data=Arthritis)
mantelhaen.test(mytable)










