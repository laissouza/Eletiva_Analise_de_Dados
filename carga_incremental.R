#Carga incremental

#Base de dados original com relação de pessoas vacinadas contra covid em PE

vacinadosPE <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv', sep = ';', encoding = 'UTF-8')

vacinadosPEnew <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv', sep = ';', encoding = 'UTF-8')

# chave primária
vacinadosPEincremento <- (!vacinadosPEnew$cpf %in% vacinadosPE$cpf)

#chave substituta
vacinadosPE$chavesubstituta = apply(vacinadosPE[, c(2,6)], MARGIN = 1, FUN = function(i) paste(i, collapse = ""))

#comparação linha a linha 
library(dplyr)

setdiff(vacinadosPEnew, vacinadosPE)

vacinadosPE[vacinadosPEincremento,]

vacinadosPE <- rbind(vacinadosPE, vacinadosPE[vacinadosPEincremento,])
