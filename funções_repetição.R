#Para esta tarefa usaremos o banco de dados "women" do R
datasets::women
women

par (mfrow = c(2, 2))

#usamos a função da familia apply pra criar dois histogramas com a altura e o peso de mulheres
mapply(hist, women [ , 1:2], MoreArgs = list(main = 'Histograma', xlab = 'valores', ylab = 'Frequência'))

#Usamos a função de repetição para fazer o mesmo que acima porém com o nome das variáveis
for (i in 1:2) {
  x <- women[ , i]
  hist(x,
       main = names(women)[i],
       xlab = "valores da variável",
       ylab = "Frequência",
       xlim = c(min(women[ , i]), max(women[ , i])))
}
