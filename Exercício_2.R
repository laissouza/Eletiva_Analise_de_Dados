library(ff)
install.packages('ffbase')
library(ffbase)

#extraindo bases de dados
situacaofinalalunos2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/9dc84eed-acdd-4132-9f1a-a64f7a71b016/download/situacaofinalalunos2020.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/3b03a473-8b20-4df4-8628-bec55541789e/download/situacaofinalalunos2019.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2018Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/8f3196b8-c21a-4c0d-968f-e2b265be4def/download/situacaofinalalunos2018.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2017Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/70c4e6fc-91d2-4a73-b27a-0ad6bda1c84d/download/situacaofinalalunos2017.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2016Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/f42a3c64-b2d7-4e2f-91e5-684dcd0040b9/download/situacaofinalalunos2016.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2015Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/264f0a37-ad1c-4308-9998-4f0bd3c6561f/download/situacaofinalalunos2015.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2014Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/0a2aec2f-9634-4408-bbb4-37e1f9c74aa1/download/situacaofinalalunos2014.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2013Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/95eb9ea8-cd75-4efa-a1ba-ba869f4e92b9/download/situacaofinalalunos2013.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2012Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/f6633c26-be36-4c27-81cb-e77d90316cff/download/situacaofinalalunos2012.csv', sep = ';', encoding = 'UTF-8')

situacaofinalalunos2011Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/ce5168d4-d925-48f5-a193-03d4e0f587c7/resource/9a694ab5-99ab-4ff1-ac6b-c97917c6a762/download/situacaofinalalunos2011.csv', sep = ';', encoding = 'UTF-8')

#salvando bases no disco
write.table(situacaofinalalunos2020Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2020Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2019Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2019Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2018Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2018Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2017Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2017Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2016Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2016Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2015Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2015Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2014Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2014Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2013Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2013Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2012Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2012Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

write.table(situacaofinalalunos2011Raw,"C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2011Raw.csv",sep=",",row.names=FALSE,quote=FALSE)

#Extração via f

system.time(extracao20 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2020Raw.csv'))

class(extracao20)

length(extracao20$nescolnome)

system.time(extracao19 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2019Raw.csv'))

class(extracao19)

length(extracao19$nescolnome)

system.time(extracao18 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2018Raw.csv'))

class(extracao18)

length(extracao18$nescolnome)

system.time(extracao17 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2017Raw.csv'))

class(extracao17)

length(extracao17$nescolnome)

system.time(extracao16 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2016Raw.csv'))

class(extracao16)

length(extracao16$nescolnome)

system.time(extracao15 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2015Raw.csv'))

class(extracao15)

length(extracao15$nescolnome)

system.time(extracao14 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2014Raw.csv'))

class(extracao14)

length(extracao14$nescolnome)

system.time(extracao13 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2013Raw.csv'))

class(extracao13)

length(extracao13$nescolnome)

system.time(extracao12 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2012Raw.csv'))

class(extracao12)

length(extracao12$nescolnome)

system.time(extracao11 <- read.csv.ffdf(file='C:/Users/Laís Oliveira/Documents/Mestrado UFPE/eletiva_analise_de_dados/Eletiva_Analise_de_Dados/bases_originais/situacaofinalalunos2011Raw.csv'))

class(extracao11)

length(extracao11$nescolnome)

#objeto ff único

situacaofinalalunos <- ffdfrbind.fill(extracao20, extracao19, extracao18, extracao17, extracao16, extracao15, extracao14, extracao13, extracao12, extracao11)          

length(situacaofinalalunos$nescolnome)       
object.size(extracao20)
object.size(situacaofinalalunos)

saveRDS(situacaofinalalunos, "bases_tratadas/situacaofinalalunos.rds")
