irisCopia <- iris
irisCopia

#Controle condicional
mean(irisCopia$Petal.Width)
# criando variável categórica a partir da variável Pedal.width
irisCopia$Petal.Width.cat <- ifelse(irisCopia$Petal.Width < 1, 'narrow', 'wide')
irisCopia

#Cotrole de repetição
x <- runif(1, 0, 5)
x

if (x < 4) {
  y <- 30
} else {
  y <- 60
}
y
