                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
# 帮助信息
# 查询函数或者数据集信息，可以输入?,后面紧跟其名称，
# 查找某个函数，可以输入??,后面紧跟名称,对于特殊字符、关键字或者多个字词的搜索要加上单引号或者双引号
#
?mean
?'+'
?'if'
??'plotting'
??'regression model'

# 函数help()和help.search()分别相当于?和??,但是参数必须在引号中
help('mean')
help('+')
help('if')
help.search('plotting')
help.search('regression model')

# apropos()函数能够找到匹配其参数的变量,其匹配模式为正则表达式
a_vector<- c(1,3,4,4)
apropos('vector')
apropos('z$')
apropos('[4-9]')

# example()函数可以查找相关的范例,一些较长的范例，可以使用demo()函数查看
example(plot)
demo()
demo(Japanese)

# browseVignettes()函数可以浏览包文件的文档
browseVignettes('Sweave',package='utils')

# RSiteSearch()函数可以搜索R官方网站的所有包,多个单词组成的短语必须用大括号括上
RSiteSearch('{Bayesian regression}')

