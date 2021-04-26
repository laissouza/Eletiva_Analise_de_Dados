#Tarefa semente
semente <- addTaskCallback(function(...) {set.seed(123); TRUE})

#Variável Normal
distNormal <- rnorm(200)
distNormal
summary(distNormal)

#Variável binomial
distBinomial <- rbinom(200,1,0.7)
distBinomial
summary(distBinomial)

#Variável index
index <- seq(1,length(distNormal))
index
summary(index)