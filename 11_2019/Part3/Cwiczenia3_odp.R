#######################
# exercises 3 answers #
#######################


#---- ex 1 -------
# load file Sample1.txt to data frame
# Zaladuj plik Sample2.txt do ramki danych

tst1 <- read.table("SampleFiles\\Zadania\\Sample2.txt", sep= "|", dec=".")



#---- ex 2 -------
# name columns in data frame loaded in ex 1
# nadaj nazwy kolumn ramce danych zaladowanej z zadania nr 1

colnames(tst1) <- c("ID", "Date1", "Value", "Date2")



#----- ex 3 ------
# load file Obs2.xlsx to data frame
# zaladuj plik Obs2.xlsx do ramki danych 

library(XLConnect)

wb <- loadWorkbook("SampleFiles\\Zadania\\Obs2.xlsx")

test_df <- readWorksheet (wb 
                          ,sheet="Observations2"
                          ,header = FALSE )


#---- ex 4 --------------------------
# name columns in data frame loaded in ex 3
# nadaj nazwy kolumn ramce danych zaladowanej z zadania nr 3

colnames(tst_df) <- c("ID", "Date", "Value")


#------ ex 5 -------
# from mtcars add column with car brand and choose merc
# z danych mtcars dodaj kolumne z marka auta i wybierz merc 

mtcars1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+')) %>%
  filter(Brand == 'Merc')

#------ ex 6 -------
# from storm data list top 5 newest and strongest (in category) storms. List names of listed storms.
# z danych storm wylistuj top 5 najnowszych, najsilniejszych (pod wzgledem katergorii) zjawisk burzowych. Podaj nazwy tych zjawisk.

storms2 <- storms %>%
  arrange(desc(year), desc(month), desc(day), desc(category)) %>%
  distinct(name) %>%
  top_n(5)


#------ ex 7 -------
# check average monthly level of stock indexes in particular years (stocks - EuStockMarkets)
# policz srednie miesieczne poziomy indeksow gieldowych w poszczegolnych latach (zbior stocks - EuStockMarkets)

stocks3 <- stocks %>%
  mutate(Date1 = paste(year(tms), month(tms), sep="-")) %>%
  group_by(Date1) %>%
  summarise(DAX = mean(DAX), SMI = mean(SMI), CAC=mean(CAC), FTSE=mean(FTSE))


#------ ex 8 -------
# join metadata and obseravations tables (from part 2)
# polacz tablice metadane i obserwacje (z cwiczen nr 2)  

Metadane <- read.csv(file = 'SampleFiles\\Metadane1.csv')
Obserwacje <- read.csv(file = 'SampleFiles\\Obs1.csv')

df4 <- Metadane %>%
  inner_join(Obserwacje, by=c("ID" = "EconomicIndicatorId"))


#------ ex 9 -------
# fill up NA value with hour average 
# zamien wartosci NA na srednia z poszczegolnych godzin. 

day = c(1, 1, 2, 2, 3, 3)
hour = c(8, 16, 8, 16, 8, 16)
profit = c(100, 200, 50, 60, NA, NA)
shop.data = data.frame(day, hour, profit)

shop.data1 <- shop.data %>%
  group_by(hour) %>%
  mutate(profit= ifelse(is.na(profit), mean(profit, na.rm=TRUE), profit))


#------ ex 10 -------
# [*] count income rates for stock idexes (stocks - EuStockMarkets)
# [*] policz miesieczne stopy zwrotu dla indeksow gieldowych (zbior stocks - EuStockMarkets)


df5 <- stocks %>%
  #mutate(d_DAX, d_SMI, d_CAC, d_FTSE = (FTSE - lag(FTSE) / FTSE ) * 100 )
  mutate_each(funs(( (. - lag(.)) / lag(.)) * 100), -tms)




#------ ex 11 -------
# below data frames represent 2 tables for demand and supply in particular shops. Check what is the balance between supply and demand in particular shops. 
# ponizsze ramki danych przedstawiaja popyt i podaz na produkty w sklepach. Policz bilans popytu i podazy w danych sklepach. 


df_1 <- data.frame(
  dates = c(as.Date("2018-07-01"), as.Date("2018-06-01"), as.Date("2018-06-01"), as.Date("2018-05-01"), as.Date("2018-07-01"), as.Date("2018-06-01"), as.Date("2018-06-01"), as.Date("2018-05-01")),
  demand = c(10, 11, 12, 13, 10, 11, 12, 13),
  shop = c("Tesco", "Brico", "Lidl", "Aldo", "Tesco", "Brico", "Lidl", "Aldo")
)

df_2 <- data.frame(
  dates = c(as.Date("2018-07-01"), as.Date("2018-06-01"), as.Date("2018-05-01"), as.Date("2018-04-01"), as.Date("2018-07-01"), as.Date("2018-06-01"), as.Date("2018-05-01"), as.Date("2018-04-01")),
  supply = c(20, 21, 22, 23, 20, 21, 22, 23),
  shop = c("P&P", "Alma", "Kaufland", "Auchan", "Tesco", "Brico", "Lidl", "Aldo")
)


ex_11 <- df_1 %>% 
  inner_join(df_2, by = c('dates'='dates', 'shop'='shop')) %>% 
  mutate(balance = supply - demand)



#------ ex 12 -------
# Use storms data to check if in particular month the wind catergory distribution differs. 
# w danych Storms sprawdz czy dla poszczegolnych miesiecy rozklad kategorii wiaiatrow rozni sie od siebie. 

ex_12 <- storms %>% 
  group_by(month, category) %>%
  summarise(count = length(wind), mean_wind = mean(wind, na.rm = TRUE), median_wind = median(wind, na.rm = TRUE)) %>% 
  arrange(month, category)
  

#------ ex 13 -------

# in below data frame select only rows where sales occured in working days (MO - FR)
# dla ponizszej ramki danych wybierz wiersze gdzie sprzedaz wystapila w ciagu tygodnia pracy (PN - PT)
df <- data.frame(sales_date = c("1/01/2019", "02/02/2019", "11/12/2019", "30/5/2019"),
                 price = c(1000, 2000, 900, 700) 
)

df1 <- df %>% 
  mutate(sales_date = dmy(sales_date)) %>% 
  # mutate(sales_date = as.Date(sales_date, format = "%d/%m/%Y")) 
  mutate(weekday = wday(sales_date)) %>%
  filter(weekday %in% c(1,2,3,4,5)) 



#------ ex 14 -------

# check what was the intervals between sales in data frame from ex 13
# sprawdz co ile dni wystepowala sprzedaz w przykladzie z cwiczenia 13


df2 <- df1 %>% 
  arrange(sales_date) %>%
  mutate(datediff = difftime(sales_date, lag(sales_date), units = "days"))



#------ ex 15 -------

# join data from folder flights (flights, weather, planes, airports, airlines). 
# polacz dane z folderu flights.
# https://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf

load("C:\\Users\\U0173627\\Documents\\Workspace\\R_learning\\training_PSk\\Scripts\\sampleFiles\\flights\\flights.rda")
load("C:\\Users\\U0173627\\Documents\\Workspace\\R_learning\\training_PSk\\Scripts\\sampleFiles\\flights\\weather.rda")
load("C:\\Users\\U0173627\\Documents\\Workspace\\R_learning\\training_PSk\\Scripts\\sampleFiles\\flights\\planes.rda")
load("C:\\Users\\U0173627\\Documents\\Workspace\\R_learning\\training_PSk\\Scripts\\sampleFiles\\flights\\airports.rda")
load("C:\\Users\\U0173627\\Documents\\Workspace\\R_learning\\training_PSk\\Scripts\\sampleFiles\\flights\\airlines.rda")


all_flights <- flights %>%
  left_join(weather, by = "time_hour") %>%
  left_join(planes, by = "tailnum") %>%
  left_join(airlines, by = "carrier") %>%
  left_join(airports, by = c("origin.x" = "faa"))

#------ ex 16 -------

# Extract particular information into seperate columns (street, name & surname, postal_code, city). 
# Przeksztalc ponizsza ramke danych tak aby uzyskac ulice, imie i nazwisko, kod pocztowy oraz miasto w osobnych kolumnach, 

df1 <- data.frame( Address = c( " 12358 ul. Armii Krajowej 47, 00-252 Warszawa; Jan Kowalski", 
                                " 98786 AL. Jana Pawla II 456, 80-987 Gdansk; Anna Nowak" ,
                                "13258 Plac wyzwolenia 950, 12-547 Wroclaw; Jan Maria Tomaszewski"))

df1_t <- df1 %>% 
  mutate(street1 = str_remove(Address, "^[ 0-9]+")) %>%
  mutate(street2 = str_remove(street1, ",\\s[0-9]{2}-[0-9]{3}.+$")) %>%
  mutate(name = str_match(Address, "[A-Za-z ]*$")) %>%
  mutate(postal_code = str_match(street1, "[0-9]{2}-[0-9]{3}")) %>%
  mutate(city1 = str_match(street1, "[0-9]{2}-[0-9]{3}\\s[A-Za-z]+")) %>%
  mutate(city2 = str_remove(city1, "[0-9]{2}-[0-9]{3}\\s"))


#------ ex 17 -------

# extract title and author to data frame
# napisz takie wyrazenie aby zapisac w ramce danych tytul oraz autora 

some_txt <- "
<bookstore>
  <book category='cooking'>
    <title>Everyday Italian</title>
    <author>Giada De Laurentiis</author>
    <year>2005</year>
    <price>30.00</price>
  </book>
  <book>
    <title>Harry Potter</title>
    <author>J K. Rowling</author>
    <year>2005</year>
    <price>29.99</price>
  </book>
  <book>
    <title>Learning XML</title>
    <author>Erik T. Ray</author>
    <year>2003</year>
    <price>39.95</price>
  </book>
</bookstore>"

some_txt

title <- unlist(str_match_all(some_txt, "title[>].*[<][/]title"))
author <-  unlist(str_match_all(some_txt, "author[>].*[<][/]author"))

cbind(title, author)

#------ ex 18 -------

# write a function based on some_txt from above to remove tags with any text and leave only needed information
# napisz funkcje, ktora usunie z wyznaczonego tekstu tagi xml oraz pozostawi jedynie niezbedne informacje. 


erase_func <- function(input){
  output <- str_remove_all(input, "(^[A-Za-z]+[>])|([<][/][A-Za-z]+$)")
  return(output)
}

erase_func(title)

erase_func(author)

#------ ex 19 -------
# From metadane file extract Country from Description column and check if it is the same as Country column.
# Z pliku metadane sprawdz czy kraj w kolumnie Description jest taki sam jak w kolumnie Country. 

Metadane <- read.csv(file = 'SampleFiles\\Metadane1.csv')

MetaTest <- Metadane %>% 
  mutate(Country1 = as.character(str_match(Description, "^[A-Za-z0-9]+[,]"))) %>%
  mutate(Country1 = str_remove(Country1, ",$")) %>%
  mutate(Check_country = ifelse(Country1 == Country, 1, 0)) %>% 
  filter(Check_country == 0)

#------ ex 20 -------
# Transform LifeCycleSavings into 3 columns (country, key, value)
# Przeksztalc zbior LifeCycleSavings do 3 kolumn tak aby uzyskac nastepujace kolumny (kraj, klucz, wartosc)

LCS <- LifeCycleSavings

LCS$Country <- rownames(LCS)

LCS1 <- LCS %>%
  gather(key = measure, value = Value, -Country )


#------ ex 21 -------
# Import WorldPhones and measure what is average and median usage in each decade.
# Zaladuj dane WorldPhones i policz jaki bylo srednie uzycie telefonow w poszczegolnych dekadach. 

WP <- as.data.frame(WorldPhones)

WP$DateYear <- rownames(WP)

WP1 <- WP %>% 
  gather(key = Region, value = Usage, -DateYear ) %>%
  mutate(Decade = paste(str_match(str_match(DateYear, "[0-9]{2}$"), "^[0-9]{1}"), "0",sep = "")  ) %>%
  group_by(Decade) %>% 
  summarise(average_usage = mean(Usage, na.rm = TRUE), median_usage = median(Usage , na.rm = TRUE))



#------ ex 22 --------
# from file Obs and Metadane1 find: "Poland, Production, Passenger cars" and create data frame in which years will be in rows na months in columns. 
# dla pliku Obs and Metadane znajdz: "Poland, Production, Passenger cars" oraz dokonaj transformacji danych tak aby w wierszach byly lata a w kolumnach miesiace. 

Metadane <- read.csv(file = 'SampleFiles\\Metadane1.csv')
Obserwacje <- read.csv(file = 'SampleFiles\\Obs1.csv')

df4 <- Metadane %>%
  inner_join(Obserwacje, by=c("ID" = "EconomicIndicatorId")) %>%
  filter(Description == 'Poland, Production, Passenger cars') %>%
  mutate(ObsDate = as.Date(ObsDate, format = '%m/%d/%Y')) %>%
  mutate(ObsDate_month = month(ObsDate), 
         ObsDate_year = year(ObsDate)) %>%
  select(ObsDate_year, ObsDate_month, Value) %>%
  spread( ObsDate_month, Value)
