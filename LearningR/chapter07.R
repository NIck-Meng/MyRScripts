# 字符串和因子

# 字符串向量由c函数创建

c('you should use double quotes most of the time',
  'single quotes are better for including " inside the string')

# paste函数可以讲不同的字符串组合起来，

paste(c('red','yellow'),'lorry')
paste(c('red','yellow'),'lorry',sep='-')
paste(c('red','yellow'),'lorry',collapse=',')
paste0(c('red','yellow'),'lorry')

# toString可以将一个向量组合成一个字符串
x <- (1:15)^2
toString(x)
toString(x,width=40)
cat(c('red','yellow'),'lorry')

# noquote函数可以讲字符的引号去掉
x <- c('i','saw','two','birds','last','night')
y=noquote(x)

# 格式化数字
pow <- 1:3
(powers_of_e <- exp(pow))
formatC(powers_of_e)
formatC(powers_of_e,digits=3)
formatC(powers_of_e,digits=3,width=10)
formatC(powers_of_e,digits=3,format='e')
formatC(powers_of_e,digits=3,flag='+')

sprintf('%s %d =%f',"euler's constant to the power",pow,powers_of_e)
sprintf('to three decimal places,e^%d=%.3f',pow,powers_of_e)
sprintf('in scientific notation ,e^%d = %e',pow,powers_of_e)

# 特殊字符

cat('foo\tbar',fill=TRUE)
cat('foo\nbar',fill=TRUE)
cat('foo\\bar',fill=TRUE)
cat('foo\"bar',fill=TRUE)
cat('foo\'bar',fill=TRUE)

cat("foo'bar",fill=TRUE)

# toupper,tolower函数可以把字符串的字符转换成大写字母，小写字母

toupper("Hello,I'm crying")
tolower("Hello,I'm crying")

# 可以使用substring,substr从字符串中截取子串，
# substr(x, start, stop)
# substring(text, first, last = 1000000L)


woodchuck <- c(
  "how much wood would a woodchuck chuck",
  "if a woodchuck could chuck wood?",
  "he would chuck,he would,as much as he could",
  "and chuck as much wood as a woodchuck would",
  'if a woodchuck could chuck wood.'
  )
substring(woodchuck,1:6,10)
substr(woodchuck,1:6,10)

# strsplit函数可以分割字符串,返回一个列表，fixed参数表示分隔符是固定长度字符串而非正则表达式
strsplit(woodchuck,' ',fixed=TRUE)
strsplit(woodchuck,',? ')

# 文件路径
# getwd函数返回默认文件读写路径，setwd函数可以修改默认文件读写路径
getwd()
# 路径的目录由正斜杠分隔，也可以用两个反斜杠分隔，
# 可以使用file.path函数创建文件路径
# R.path()是R的安装目录

# 路径可以是从驱动器名称出发的绝对路径，也可以是相对于当前目录的相对路径，.表示当前目录，..表示父目录，~表示当前主目录，
path.expand('.')
path.expand('..')
path.expand('~')

# basename函数返回文件名，dirname返回文件的目录
file_name <- 'c:/programe/R/R-devel/bin'
basename(file_name)
dirname(file_name)







