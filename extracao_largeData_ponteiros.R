install.packages('ff')
library(ff)

enderecoBase <- 'C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/basededados.csv'

# criando o arquivo ff
system.time(extracao1 <- read.csv.ffdf(file=enderecoBase))

class(extracao1)

object.size(extracao1) # a vantagem está no tamanho!

#media da coluna 1
mean(extracao1[,1])

#mediana da coluna 3
median(extracao1[,3])

#soma da coluna 5
sum(extracao1[,5]) 

#amostragem
extracao1Amostra <- extracao1[sample(nrow(extracao1), 200000) , ]

#regressão linear da amostra
lm(c ~ ., extracao1Amostra)
