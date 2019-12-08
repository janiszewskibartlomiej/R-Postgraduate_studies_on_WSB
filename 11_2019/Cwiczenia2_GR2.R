###############
# exercises 2 #
###############

#---- ex 1 -------
# load file Sample2.txt to data frame
# Zaladuj plik Sample2.txt do ramki danych

obs2 <- read.csv(file = "D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\sample2.txt",
                header = FALSE,
                sep = "|")

#---- ex 2 -------
# name columns in data frame loaded in ex 1
# nadaj nazwy kolumn ramce danych zaladowanej z zadania nr 1

colnames(obs2) <- c("ID", "StarData", "Value" ,"EndData")


#----- ex 3 ------
# load file Obs2.xlsx to data frame
# zaladuj plik Obs2.xlsx do ramki danych 

library(XLConnect)

obs2xls <- loadWorkbook(file="D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Obs2.xlsx")
danexls <- readWorksheet(obs2xls, 
                         sheet = "Observations2",
                         header = FALSE )

# NIE DZILA PRZY OBS1 JAK JEST PIERWSZY WIERSZ TO NIE WYCIN NAGLOWKOW!!!!

#---- ex 4 --------------------------
# name columns in data frame loaded in ex 3
# nadaj nazwy kolumn ramce danych zaladowanej z zadania nr 3


colnames(danexls) <- c("dane", "data", "wartość")

#----- ex 5 ------
# connect to SampleDb2.db and list all available tables in the database
# podlacz sie do bazy SampleDb2.db oraz wylistuj wszystkie dostepne tablice w bazie

