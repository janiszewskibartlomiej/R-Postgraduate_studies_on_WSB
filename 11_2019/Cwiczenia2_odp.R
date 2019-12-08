#######################
# exercises 2 answers #
#######################



#---- ex 1 -------
# load file Sample1.txt to data frame
# Zaladuj plik Sample1.txt do ramki danych

tst1 <- read.table("SampleFiles\\Zadania\\Sample2.txt", sep= "|", dec=".")



#---- ex 2 -------
# name columns in data frame loaded in ex 1
# nadaj nazwy kolumn ramce danych zaladowanej z zadania nr 1

colnames(tst1) <- c("ID", "Date1", "Value", "Date2")



#----- ex 3 ------
# load file Obs2.xlsx to data frame
# zaladuj plik Obs2.xlsx do ramki danych 

library(XLConnect)

wb <- loadWorkbook("D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Obs2.xlsx")

test_df <- readWorksheet (wb 
                          ,sheet="Observations2"
                          ,header = FALSE )


#---- ex 4 --------------------------
# name columns in data frame loaded in ex 3
# nadaj nazwy kolumn ramce danych zaladowanej z zadania nr 3

colnames(tst_df) <- c("ID", "Date", "Value")

#----- ex 5 ------
# connect to SampleDb2.db and list all available tables in the database
# podlacz sie do bazy SampleDb2.db oraz wylistuj wszystkie dostepne tablice w bazie

library(RSQLite)

db <- dbConnect(SQLite(), dbname="SampleFiles\\Zadania\\SampleDB2.db")
dbListTables(db)

dbDisconnect(db)
