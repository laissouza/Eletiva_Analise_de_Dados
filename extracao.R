#Função nazero
naZero <- function() {
  replace(x = dataset, list = is.na(dataset), values = 0)
}

ls() # lista todos os objetos no R

# vamos ver quanto cada objeto está ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

ls() # lista todos os objetos no R
gc()

rm(list = c('sinistrosRecife2019Raw', 'sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 'itm'))
ls()
