#Extração de dados

#Base de dados com relação de pessoas vacinadas contra covid em PE

vacinadosPE <- read.csv2('http://dados.recife.pe.gov.br/dataset/f381d9ea-4839-44a6-b4fe-788239189900/resource/966e9c4c-df45-40d7-9c58-2f13c61a6d28/download/vacinados.csv', sep = ';', encoding = 'UTF-8')

#Base de dados arquivos json
install.packages('rjson')
library(rjson)
VacinacaoCovid-19 <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/72c94f87-1fcd-4145-9016-31dff794688a/resource/3b86294b-0050-484e-8c10-c0152a5ff8ac/download/metadados-covid19.json")

# bANCO DE DADOS arquivos xml
install.packages('XML')
library(XML)

SwissProt <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/SwissProt/SwissProt.xml")

