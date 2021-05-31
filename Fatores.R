genero <- c(0,2,1,2,1,2,0,1,0,2,1)
recode <- c(feminino = 0, masculino = 1, feminino_masculino = 2)
(genero <- factor(genero, levels = recode, labels = names(recode)))


