library(lubridate)
#conversão de data considerando somente a data
minhadata1 <- as.Date(c("1990-07-13 06:20", "2001-03-22 12:30"))

#conversão POSIXct considerando data e horário

minhadata1 <- as.POSIXct(c("1990-07-13 06:20", "2001-03-22 12:30"))

#conversão POSIXlt considerando data, horário e segundos

minhadata1 <- as.POSIXlt(c("1990-07-13 06:20", "2001-03-22 12:30"))

#extração de componentes

year (minhadata1)
month(minhadata1)
day(minhadata1)
wday(minhadata1)

#operações

minhadata1 + minutes(90)
