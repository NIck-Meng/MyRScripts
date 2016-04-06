# 获取数据

# 内置数据集

# R自带的数据集datasets，
# 使用data()查看所有加载了的包的数据集
data()
# 列出所有已安装的包的数据
data(package=.packages(TRUE))
# 查看某个包中的所有数据集
data(package='learningr')
# 访问某个包中的某个数据集
install.packages('survival')
library(survival)
data('kidney',package='survival')
head(kidney)

# data(..., list = character(), package = NULL, lib.loc = NULL,
#     verbose = getOption("verbose"), envir = .GlobalEnv)
# Loads specified data sets, or list the available data sets.

# 读取文本文件
# read.table()可以读取带有分隔符的文件，将结果存储在一个数据框中

# system.file()用于定位包中的文件
# Finds the full file names of files in packages etc
# system.file(..., package = "base", lib.loc = NULL,
#             mustWork = FALSE)
data(package='learningr')

deer_file <- system.file(
  'extdata',
  'RedDeerEndocranialVolume.dlm',
  package='learningr'
  )
deer_data <- read.table(deer_file,header=TRUE,fill=TRUE)
# header表示是否将第一行作为字段名，fill表示是否用NA表示缺失值
str(deer_data,vec.len=1)
head(deer_data)

# Sep指定分隔符，nrow指定读取的行数，skip指定从第几行开始读取，
# 其他的类似的函数：read.csv,read.csv2,read.delim,read.delim2,

crab_file <- system.file('extdata','crabtag.csv',package='learningr')
(crab_id_block <- read.csv(crab_file,header=FALSE,skip=3,nrow=2))
(crab_tag_notebook <- read.csv(crab_file,header=FALSE,skip=8,nrow=5))
(crab_lifetime_notebook <- read.csv(crab_file,header=FALSE,skip=15,nrow=3))





# 写入文本文件
# 
write.csv(crab_lifetime_notebook,'C:/Program Files/R/R-3.2.4revised/library/learningr/extdata/crab lifetime data.csv',row.names=FALSE,fileEncoding='utf8')


# write.table prints its required argument x (after converting it to a data frame if it is not one nor a matrix) to a file or connection.
# write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ",
#            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
#            col.names = TRUE, qmethod = c("escape", "double"),
#            fileEncoding = "")


# 非结构化文本文件





