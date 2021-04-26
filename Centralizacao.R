# Centralização de base de dados

# criando base de dados com simulação binomial negativa e poison

binomialneg <- rnbinom (200, mu = 3, size = 5)
binomialneg
summary(binomialneg)

poison <- rpois(200, 3)
poison

#Gráfico de histograma da base de dados
BasedeDados <- binomialneg*poison
mean(BasedeDados)
hist(BasedeDados)

#Centralizando base de dados
BaseCentral <- BasedeDados - mean(BasedeDados)
hist(BaseCentral)
