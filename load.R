install.packages("microbenchmark")
library(microbenchmark)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.table) - padrão para interoperabilidade
write.table(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

# carrega base de dados em formato nativo R
sinistrosRecife <- readRDS('bases_tratadas/sinistrosRecife.rds')

# carrega base de dados em formato tabular (.table) - padrão para interoperabilidade
sinistrosRecife <- read.table('bases_tratadas/sinistrosRecife.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds"), b <- write.table(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv"), times = 10L)

microbenchmark(a <- readRDS('bases_tratadas/sinistrosRecife.rds'), b <- read.table('bases_tratadas/sinistrosRecife.csv', sep = ';'), times = 10L)