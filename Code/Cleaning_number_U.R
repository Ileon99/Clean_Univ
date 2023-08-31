## We are going to clean public university data of Ecuador 

library(readr)

######## GETTING THE NUMBER OF PUBLIC UNIVERSITIES PER PROVINCE IN 2010 RIGTH ####

#Load the dataset of the number of universities in 2015

universidades <- read_csv2("Data/universidades_SIN_TILDES.csv")


## We keep only the public universities

universidades <- universidades[universidades$`TIPO FINANCIAMIENTO` == "PUBLICA",]

## We keep only the universities that are the main host organization

universidades <- universidades[universidades$`ESTRUCTURA INSTITUCIONAL` == "SEDE MATRIZ",]

##We add the years of foundation of the universities by looking on the internet one by one 

fundacion <- as.data.frame(universidades$`NOMBRE IES`)

write.csv2(fundacion, "fundacion.csv")

fundacion <- read_csv2("Data/fundacion.csv")

#We merge the two data set 

universidades <- merge(universidades, fundacion, by = "NOMBRE IES")

#We keep only the universties that existed before 2010 

universidades <- universidades[universidades$FUNDACION < 2010,]


