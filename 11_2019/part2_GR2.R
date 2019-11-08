##########
# PART 2 #
##########




#---- load csv ----

metadane <- read.csv(file = "D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Metadane1.csv")


#---- load txt ----
obs <- read.csv(file = "D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\sample.txt",
                header = FALSE,
                sep = "\t")

colnames(obs) <- c("ID", "ObsDate", "Value", "RelDate")



#--- load xls(x) ----
library(XLConnect)

wb <- loadWorkbook(file = "D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Metadane1.xlsx")

Metadane1 <- readWorksheet(wb, sheet = "Metadane1")  #sheet to jest nazwa arkusza



#---- detect encoding ----

library(readr)
guess_encoding("D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Sample.txt", n_max = 1000)
#guess_encoding to funkcja ktora sprawdza jakie jest prawdopodobienstwo wystapienia danego kodowania

guess_encoding("D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Metadane1.csv", n_max = 1000)

Metadane2 <- read.csv("D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Metadane1.csv",
                      encoding = "ASCII")


#---- db connection -----

## SQLite
library(RSQLite)

# STEP 1: connect to db
db <- dbConnect(SQLite(), dbname="D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\SampleDB.db")

# STEP 2: Declare what to retrive from db. SQL query
Query_SQL <- paste("
                  SELECT * FROM Obs
                      ", sep="")

# STEP 3: Connect to db and retrive data
RawData_Obs <- dbGetQuery(db, Query_SQL)

# Write data to DB
# sample_df <- data.frame(EconomicIndicatorId = NA, ObsDate = NA, Value = NA)
# dbWriteTable(db, "Obs", sample_df, append = TRUE,  overwrite = FALSE)

# STEP 4: close connection
dbDisconnect(db)




## RODBC 
library(RODBC)

# STEP 1: define connection
db_con <- odbcDriverConnect(
  connection = "Driver={SQL Server Native Client 11.0};Server=SERVER_ADDRESS;Database=DB_NAME;Uid=***;Pwd=***;"
)


# STEP 2: Declare what to retrive from db. SQL query
Query_SQL <- paste( "Select * from SAMPLE_TABLE", sep= "")


# STEP 3: Connect to db and retrive data
test_df <- sqlQuery(db_con, Query_SQL )

# Clear data in table
sqlClear(db_con,
         'TABLE_NAME',
         errors=TRUE)

# Write data.frame in db
sqlSave(db_con,
        Results,
        tablename = 'TABLE_NAME', 
        append = TRUE,
        rownames =FALSE)


# STEP 4: close connection to db
odbcCloseAll()




## RJDBC
library(RJDBC)

drv <- JDBC(
  "com.microsoft.sqlserver.jdbc.SQLServerDriver",
  paste('C:\\JDBC\\sqljdbc_6.0\\enu\\jre8\\sqljdbc42.jar')) # remember to download the driver to particular path

# STEP 1: Connect to db
conn <- dbConnect(drv=drv, url = "jdbc:mysqlserver://SERVER_ADDRESS",
                  username="***",
                  password="***")

# STEP 2: Declare what to retrive from db. SQL query
Query_SQL <- paste( "Select * from SAMPLE_TABLE", sep= "")

# STEP 3: Connect to db and retrive data
test_df <- dbGetQuery(conn, query1)

# STEP 4: close connection to db
dbDisconnect(conn)



#---- load xml / html ----
library(XML)
library(methods)

myXml <- xmlToDataFrame("D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\sampleXML.xml")


#---- load json -----
library(jsonlite)

myJson <- fromJSON("D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\sampleJSON.json")
myJson

PETS <- rbind(myJson$dogs, myJson$cats)
PETS
