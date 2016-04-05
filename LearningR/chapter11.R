# 日期和时间

# R自带的日期时间类：POSIXct,POSIXlt,Date

# POSIXct类记录了以UTC时区为准的以某一时间起计时的秒数计数，用于存储和计算时间
# POSIXlt类将时间存储为一个列表，用于提取日期中的某个部分

# 日期被打印出来时已经被格式化，使用unclass可以查看其底层存储
(now_ct <- Sys.time())
class(now_ct)
unclass(now_ct)

(now_lt <- as.POSIXlt(now_ct))
class(now_lt)
unclass(now_lt)

now_lt$sec
now_lt[['min']]

# Date类存储了从某一时期开始计算的天数。

(now_date <- as.Date(now_ct))
class(now_date)
unclass(now_date)

# 日期和字符串的相互转换


# 在许多文本文件中，每个值都是一个字符串，必须将其中的日期字符串转换成日期类型的变量

moon_landing_str <- c(
  '20:17:40 20/07/1969',
  '06:23:12 19/11/1969',
  '09:18:11 05/02/1971'
  )

(moon_landing_lt <- strptime(moon_landing_str,'%H:%M:%S %d/%m/%Y',tz='UTC'))
strptime(moon_landing_str,'%H:%M:%S %d-%m-%Y',tz='UTC')

strftime(now_ct,'it is %I:%M%P on %A %d %B,%Y.')


# 算术运算
# R支持三种日期时间类的算术运算，将数字与POSIX日期相加，会以秒为单位增加时间，与Date日期相加，会以天数为单位增加时间
now_ct+86400
now_date+1

the_start_of_time <- as.Date('1970-01-01')
the_end_of_time <- as.Date('2012-12-21')
all_time=the_end_of_time -the_start_of_time 
class(all_time)
unclass(all_time)

# 可以使用difftime函数计算两个日期的差值
difftime(the_end_of_time,the_start_of_time,units='secs')
difftime(the_end_of_time,the_start_of_time,units='weeks')

seq(the_start_of_time,the_end_of_time,by='1 year')
seq(the_start_of_time,the_end_of_time,by='500 days')


# 使用时间包lubridate(R3.2.4)
install.packages('lubridate')
library(lubridate)


# lubridate的所有函数都返回POSIXct日期，默认UTC时区
john_harrison_birth_date <- c(
  '1693-03 24',
  '1693/03\\24',
  'Tuesday+1693.03*24'
  )
ymd(john_harrison_birth_date)

# stamp函数可以格式化日期
date_format_function <- stamp('a moon landing occurred on Monday 01 January 1900 at 18:00:00')

date_format_function(moon_landing_lt)


# lubridate有三种变量处理时间范围
# Duration指时间跨度为妙的倍数，
# period指根据时钟上的时间来指定时间跨度
# interval指某段具有开始和结束的时间

(duration_one_to_ten_years <- dyears(1:10))
today()+duration_one_to_ten_years

(period_one_to_ten_years <- years(1:10))
today()+period_one_to_ten_years

a_year <- dyears(1)
as.period(a_year)


start_date <- ymd('2016-02-28')
(interval_over_leap_year <- new_interval(
  start_date,
  start_date+a_year
  ))
as.period(interval_over_leap_year)

# 日期的计算

floor_date(today(),'year')
ceiling_date(today(),'year')

