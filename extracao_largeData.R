library(data.table)

#criando base de dados large
casos= 3e6

basededados = data.table(a= rbinom(casos, 7, 0.7),
                         b= rnbinom(casos, 2, 0.7),
                         c= rpois(casos, 5),
                         d= rnorm(casos),
                         e= rnorm(casos),
                         f= rpois(casos, 9),
                         g= sample(c("tato", "olfato", "visão", "paladar", "audição"), casos, replace = TRUE),
                         h= rbinom(casos, 2, 0.7)
                         )
object.size(basededados)

head(basededados)

# salvando em disco
write.table(basededados,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/basededados.csv",sep=",",row.names=FALSE,quote=FALSE) 

#Extração

enderecoBase <- 'C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/basededados.csv'

# extração direta via read.csv
system.time(extracao <- read.csv2(enderecoBase))

# extração via amostragem com função fread
system.time(extracaoamostra <- fread(enderecoBase))

