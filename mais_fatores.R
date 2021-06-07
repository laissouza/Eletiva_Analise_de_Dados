install.packages('ade4')
library(ade4)
install.packages('arules')
library(arules)
library(forcats)

covidRJ <- read.csv2('bases_originais/covid19-b901bfa482214d9fbd86d5e8c85443f9.csv', sep = ',', encoding = 'UTF-8')


for(i in 8:16) {
covidRJ[,i] <- as.factor(covidRJ[,i]) } 

inteiroscovidRJ <- unlist(lapply(covidRJ, is.integer))  
covidRJInteiros <- covidRJ[, inteiroscovidRJ]
str(covidRJInteiros)

covidRJInteiros$order_for_place <- discretize(covidRJInteiros$order_for_place, method = "interval", breaks = 3, labels = c('outros', 'segundo mais frequente', 'mais frequente'))
