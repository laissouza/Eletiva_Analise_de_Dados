library(dplyr)
iris

#sumário
count(iris, Species)

#sumário com agrupamento
iris %>% group_by(Species) %>% summarise(avg = mean(Petal.Length))

#ordenando casos
arrange(iris, Sepal.Length)

#selecionando colunas
iris %>% select(Sepal.Length, Petal.Length) %>% arrange(Petal.Length)
