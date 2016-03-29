# 第四章：向量，矩阵，数组

# 向量
8.5:4.5
c(1,1:3,c(5,8),13)

# vector函数可以创建一个指定类型和长度的向量，
vector('numeric',5)
vector('complex',5)
vector('logical',5)
vector('character',5)
vector('list',5)
# 也可以用每个类型的函数来创建向量
numeric(5)
complex(5)
logical(5)
character(5)

# 序列
# seq函数用来产生序列,
# seq.int 可以产生一个指定范围和步长的序列，
# seq_len可以创建一个从1到输入值的序列，
# seq_along可以创建一个从1开始，长度为输入值的序列，
seq.int(3,12)
seq.int(3,12,2)
seq.int(0.1,0.01,-0.01)

n <- 0
1:n
seq_len(n)

pp <- c('peter','piper','picked','a','peck','of','pickled','peppers')
for (i in seq_along(pp)) print(pp[i])

# 长度
length(1:5)
length(c(TRUE,FALSE,NA))
sn <- c('sheena','leads','sheila','needs')
length(sn)
nchar(sn)

poincare <- c(1,0,0,0,2,0,2,0)
length(poincare) <- 3
poincare

length(poincare) <- 8

# 命名:R可以给每个元素命名
c(apple=1,banana=2,'kiwi fruit'=3,4)
x <- 1:4
names(x) <- c('apple','banana','kiwi fruit','')
names(x)

# 索引向量：R索引的第一个位置是1
x <- (1:5)^2
x[c(1,3,5)]
x[c(-2,-4)]
x[c(TRUE,FALSE,TRUE,FALSE,TRUE)]
names(x) <- c('one','four','nine','sixteen','twenty five')
x[c('one','nine','twenty five')]

x[6]

x[]
# which函数返回逻辑向量中为TRUE的位置,which.min,which.max分别是which(min(x))和which(max(x))的缩写


which(x>10)
which.min(x)
which.max(x)


# 向量循环和重复
# 两个向量相加时，R会循环较短向量中的元素来配合较长向量，如果长向量的长度不是断向量的倍数，R会警告

1:5+1

1:5+1:15
#
1:5+1:7

# rep函数可以重复使用元素来创建向量

rep(1:5,3)
rep(1:5,each=3)
rep(1:5,times=1:5)
rep(1:5,length.out=7)

rep.int(1:5,3)
rep_len(1:5,13)

# 矩阵和数组

# 矩阵是二维数组，只有两个维度，
# 数据可以是多个维度，数组的创建必须指定维数，
(three_d_array <- array(1:24,dim=c(4,3,2),dimnames=list(
  c('one','two','three','four'),
  c('ein','zwei','drei'),
  c('un','deux')
  )))
class(three_d_array)

(a_matrix <- matrix(1:12,nrow=4,dimnames=list(
  c('one','two','three','four'),
  c('ein','zwei','drei')
  )
  ))

(two_d_array <- array(1:24,dim=c(4,3),dimnames=list(
  c('one','two','three','four'),
  c('ein','zwei','drei')
)))
class(two_d_array)

# 创建数组时，数值按列填充数组，可以指定参数byrow=TRUE来按行填充，


(a_matrix <- matrix(1:12,nrow=4,byrow=TRUE,dimnames=list(
  c('one','two','three','four'),
  c('ein','zwei','drei')
)
))

# 行，列，和维度

dim(three_d_array)
dim(a_matrix)

# 对于矩阵，nrow,ncol分别返回矩阵的行数和列数
nrow(a_matrix)
ncol(a_matrix)

dim(a_matrix) <- c(6,2)
a_matrix

recaman <- c(0,1,3,6,2,7,13,20)
nrow(recaman)
NROW(recaman)
dim(recaman)

# 行名，列名，维度名
rownames(a_matrix)
colnames(a_matrix)

dimnames(a_matrix)

rownames(three_d_array)
colnames(three_d_array)
dimnames(three_d_array)

# 索引数组

a_matrix[1,c('zwei','drei')]
a_matrix[1,]
a_matrix[,c('zwei','drei')]

# 合并数组
# c函数会将矩阵转换成向量然后拼接起来，
# 可以使用cbind,rbind函数将矩阵按照列和行拼接起来

(another_matrix <- matrix(seq.int(2,24,2),nrow=4,
                          dimnames=list(c('five','six','seven','eight'),
                                        c('vier','funf','sechs'))
                 
                          ))

c(a_matrix,another_matrix)

cbind(a_matrix,another_matrix)
rbind(a_matrix,another_matrix)

# 数组运算
# 矩阵和数组的运算中，其形式必须符合线性代数中的规定，否则会抛出错误
a_matrix+another_matrix
a_matrix*another_matrix
t(a_matrix)
a_matrix %*% t(a_matrix)
1:3 %o% 4:6
outer(1:3,4:6)

(m <- matrix(c(1,0,1,5,-3,1,2,4,7),nrow=3))
m^-1
# 矩阵求逆使用solve函数
(inverse_of_m <- solve(m))
m %*% inverse_of_m













