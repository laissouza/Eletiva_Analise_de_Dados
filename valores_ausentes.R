library(data.table)
library(funModeling) 
library(tidyverse)

#BASE DE DADOS SITUAÇÃO COVID NO RJ
covidRJ <- read.csv2('bases_originais/covid19-b901bfa482214d9fbd86d5e8c85443f9.csv', sep = ',', encoding = 'UTF-8')

status(covidRJ)

# criando a matriz sombra da base de covid
covidRJ <- as.data.frame(abs(is.na(covidRJ))) 

covidRJ <- covidRJ[which(sapply(covidRJ, sd) > 0)] 

# calculando correlações para avaliar aleaoriedade
round(cor(covidRJ), 2) 
