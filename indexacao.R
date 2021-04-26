#banco de dados
iris

#a largura das pétalas são maiores ou iguais a 1?
iris$Petal.Width <= 1

#qual o endereço (index) das pétalas maiores ou iguais a 5
which(iris$Petal.Width <= 1)

#onde a largura das pétalas corresponde a 1?
match(iris$Petal.Width, 1)
