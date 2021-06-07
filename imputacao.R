library(data.table)

## imputação numérica

covidRJ <- read.csv2('bases_originais/covid19-b901bfa482214d9fbd86d5e8c85443f9.csv', sep = ',', encoding = 'UTF-8')

# tendência central
library(Hmisc)
covidRJ$city_ibge_code <- impute(covidRJ$city_ibge_code, fun = mean) 
covidRJ$city_ibge_code <- impute(covidRJ$city_ibge_code, fun = median) 

is.imputed(covidRJ$city_ibge_code) # teste se o valor foi imputado
table(is.imputed(covidRJ$city_ibge_code)) # tabela de imputação por sim / não

# predição

regcovidRJ <- lm(city_ibge_code ~ order_for_place, estimated_population, data = covidRJ) # criamos a regressão
covidRJNAIndex <- is.na(covidRJ$city_ibge_code) # localizamos os NA
covidRJ$city_ibge_code[covidRJNAIndex] <- predict(regcovidRJ, newdata = covidRJ[covidRJNAIndex, ]) # imputamos os valores preditos

## Hot deck
# imputação aleatória

(covidRJ$city_ibge_code <- impute(covidRJ$city_ibge_code, "random")) # fazemos a imputação aleatória

# imputação por instâncias
install.packages('VIM')
library(VIM)
covidRJ2 <- kNN(covidRJ)
covidRJ2
