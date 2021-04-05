# sumário base de dados iris
summary(iris)

# plots base de dado iris
plot(iris)

# estrutura base de dados iris
str(iris)

# criação de objeto simples por vetor
objeto <- c(24, 3, 7, 59, 92)
# estrutura do objeto simples
str(objeto)

# criação de objeto complexo com base de dados iris
# sintaxe: função(variável_dependente ~ todas_as_variáveis, base_de_dados)
flores <- lm(Sepal.Length ~ ., iris)
# estrutura do objeto complexo
str(flores)
