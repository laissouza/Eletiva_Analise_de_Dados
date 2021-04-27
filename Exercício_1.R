#1. Crie um data frame com pelo menos 500 casos e a seguinte composição: duas variáveis normais de desvio padrão diferente, uma variável de contagem (poisson), uma variável de contagem com dispersão (binomial negativa), uma variável binomial (0,1), uma variável qualitativa que apresenta um valor quando a variável binomial é 0 e outro quando é 1, e uma variável de index. 


#⭕ As variáveis (normais, contagem e binomial) devem ser simuladas!!!
  
#  2. Centralize as variáveis normais. 
#3. Troque os zeros (0) por um (1) nas variáveis de contagem. 
#4. Crie um novo data.frame com amostra (100 casos) da base de dados original. 

semente <- addTaskCallback(function(...) {set.seed(123); TRUE})

variavelnorm1 <- rnorm(500, mean = 2, sd = 1)
sd(variavelnorm1)
variavelnorm2 <- rnorm(500, mean = 9, sd = 3)
sd(variavelnorm2)
variavelpois <- rpois (500, 3)
variavelbinomneg <- rnbinom(500, 1, 0.7)
variavelbinom <- rbinom (500, 1, 0.7)
variavelquali <- ifelse(variavelbinom == 0, "Mulher", "Homem")
variavelindex <-seq (1, length(variavelnorm1))

base_de_dados <- data.frame(variavelbinom, variavelnorm2, variavelbinomneg, variavelnorm1, variavelquali, variavelindex, variavelpois)

centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
}

variavelnorm1 <- centralizacao(variavelnorm1)
variavelnorm2 <- centralizacao(variavelnorm2)

variavelpois <- ifelse(variavelpois == 0, 1, 0)

banco_amostra <- data.frame(sample(length(base_de_dados), 100, replace = TRUE))

