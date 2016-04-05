# 包
# 可以使用library函数加载计算机中已经安装的包
library(lattice)
dotplot(
  variety~yield|site,
  data=barley,
  groups=year
  )

# 加载多个包
# 
pkgs <- c('lattice','utils','rpart')
for(pkg in pkgs)
{
  library(pkg,character.only=TRUE)
}


# 包的搜索路径
# 使用search函数可以查看所有已加载的包
search()



# 库和已经安装的包
# installed.packages()返回一个数据框，包含了电脑中所有已安装包的信息

installed.packages()

# R自带的包安装在library子目录中，
R.home('library')








# 安装包


# 维护包
#可以使用update.package(ask=FALSE)来更新包
#使用remove.package('zoo')来删除包


# 更新到R的最新版本，同时更新R包到最新版本
# Through the 'installr' package you can automate the updating of R 
# (on Windows, using updateR()) and install new software. 
# Software installation is initiated through a GUI (just run installr()), or through functions such as: install.Rtools(), install.pandoc(), install.git(), and many more. 
# The updateR() command performs the following: finding the latest R version, downloading it, running the installer, deleting the installation file, copy and updating old packages to the new R installation.
install.packages("installr")
library(installr)
updateR()

pkgs<-installed.packages()








#