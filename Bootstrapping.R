
#Variável Normal
distNormal <- rnorm(200)
distNormal
summary(distNormal)

#Amostragem 
sample(distNormal, 30, replace = TRUE)

#Bootstrapping com variável normal
semente <- addTaskCallback(function(...) {set.seed(123); TRUE})
BootsDistNormal20 <- replicate(20,sample(distNormal, 30, replace = TRUE))
BootsDistNormal20

#estatística com bootstrapping

mediaBootsDistNormal20 <- replicate(20, mean(sample(distNormal, 30, replace = TRUE)))
mediaBootsDistNormal100 <- replicate(100, mean(sample(distNormal, 30, replace = TRUE)))
mediaBootsDistNormal200 <- replicate(200, mean(sample(distNormal, 30, replace = TRUE)))

mean(mediaBootsDistNormal20)
mean(mediaBootsDistNormal100)
mean(mediaBootsDistNormal200)
mean(distNormal)
