library(dplyr)
library(data.table)
library(plotly)

# carregando dados covid19 RJ
covidRJ <- read.csv2('bases_originais/covid19-b901bfa482214d9fbd86d5e8c85443f9.csv', sep = ',', encoding = 'UTF-8')

covidRJMun <- covidRJ %>% count(city, sort = T, name = 'casos') %>% mutate(casos2 = sqrt(casos), casosLog = log10(casos))

## outliers 

plot_ly(y = covidRJMun$casosLog, type = "box", text = covidRJMun$city, boxpoints = "all", jitter = 0.3)
boxplot.stats(covidRJMun$casosLog)$out
boxplot.stats(covidRJMun$casosLog, coef = 2)$out

covidRJOut <- boxplot.stats(covidRJMun$casosLog)$out
covidRJOutIndex <- which(covidRJMun$casosLog %in% c(covidRJOut))
covidRJOutIndex

# filtro de Hamper
lower_bound <- median(covidRJMun$casosLog) - 3 * mad(covidRJMun$casosLog, constant = 1)
upper_bound <- median(covidRJMun$casosLog) + 3 * mad(covidRJMun$casosLog, constant = 1)
(outlier_ind <- which(covidRJMun$casosLog < lower_bound | covidRJMun$casosLog > upper_bound))

# teste de Rosner
install.packages('EnvStats')
library(EnvStats)
covidRJRosner <- rosnerTest(covidRJMun$casosLog, k = 10)
covidRJRosner
covidRJRosner$all.stats
