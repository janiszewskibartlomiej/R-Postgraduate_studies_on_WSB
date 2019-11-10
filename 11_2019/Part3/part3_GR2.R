##########
# PART 3 #
##########

library(dplyr)
library(lubridate)
library(stringr)
library(tidyr)
library(sqldf)

# link
# https://dplyr.tidyverse.org/reference/index.html
# https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf
# https://dplyr.tidyverse.org/


#---- load data ----
library(datasets)

data(mtcars)
data(EuStockMarkets)


#---- prepare data EuStockMarkets (stocks)
stocks <- as.data.frame(EuStockMarkets)

time(EuStockMarkets)

## date format
time_extr <- as.numeric(time(EuStockMarkets))  # zmieniamty na cyfry
tms <- date_decimal(time_extr)  #stworzenie daty na podstawie liczb
## join vector with data frame 
stocks <- cbind(tms, stocks)  #dodanie do ramki stocks



#---- prepare data - mtcars ------
# rowname as column 

mtcars$Car <- rownames(mtcars)


# rowname as index 

seq(1:10)

seq(1:dim(mtcars)[1])

rownames(mtcars) <- seq(1:dim(mtcars)[1])

#---- introduction to dplyr -----

# column(s) selection

df1 <- mtcars %>%
  select(Car, hp, mpg)



df2 <- mtcars %>%
  select(-cyl)

#rows(s) filter

dff <- mtcars%>%
  filter(mpg > 20)

dff1 <- mtcars%>%
  filter((mpg > 20) & (hp > 100))

dff2 <- mtcars%>%
  filter((mpg > 20) & (hp > 100)) %>%
  select(Car)


dff3 <- mtcars%>%
  filter((mpg > 20) & (hp > 100)) %>%
  select(Car) %>%
  filter(Car %in% c('Lotus Europa', 'Volvo 142E'))

# data transform 


df3 <- mtcars %>%
  mutate(tst = hp * 10)  #mutate nowa kolumna


df4 <- mtcars %>%
  mutate(hp = hp * 10)  #nadpisze to co jest obecnie


storms1 <- data("storms")

storms2 <- storms %>% 
  mutate(Date = paste(year, month, day, sep="-")) %>% 
  mutate(Date1 = as.Date(Date, format = "%Y-%m-%d")) %>% #zmina na format date
  arrange(desc(Date1)  #sortowanei malejoąco domyślnei jest roznąco


# data aggregation 
storms_stats <- storms2 %>% 
  group_by(name) %>% 
  summarise(mean_wind = mean(wind, na.rm = TRUE), #na.rm usuwa puste miejsca
            number_of = length(name)) %>% 
  mutate(cheac = ifelse(mean_wind > 30, "Strong", "Weak"))



#----- introduction to tidyr -----
# https://rpubs.com/bradleyboehmke/data_wrangling


# transform columns to rows 

mtcars1 <- mtcars %>% 
  gather(key = "Category", value = "Value", -Car)  #musimy wymyslec key -car to jaka kolumna nie bedzie zmieniana



# one column to multiple columns
mtcars2 <- mtcars1 %>% 
  spread(Category, Value)


#----- date formating with lubridate -----
# https://rawgit.com/rstudio/cheatsheets/master/lubridate.pdf


Sys.Date()
Sys.time()

year(Sys.Date())
month(Sys.Date())
day(Sys.Date())
hour(Sys.time())
minute(Sys.time())

today()

ymd(Sys.Date())
ymd('20180829')

ymd_hms(Sys.time())

# operacje na datach

difftime(Sys.time(), as.Date("2018-10-10"), units = "d")

%m+%  #dodaj date do danej
  
as.Date("2018-10-10") %m+% months(1)
as.Date("2018-10-10") %m-% months(1)

# year, month, day, hour extraction 

year(stocks$tms)

stocks_stats <- stocks %>% 
  mutate(Year1 = year(tms),
         Month1 = month(tms),
         Hour1 = hour(tms))

#------ regular expresions (regex) -----
# https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf
# https://regex101.com/
# http://rubular.com/


sample_df <- read.csv(file="D:\\GITHUB\\R-Postgraduate_studies_on_WSB\\11_2019\\SampleFiles\\Metadane1.csv")

# locate text - test records
df1 <- sample_df %>% 
  mutate(check = str_match(Description, "Test")) %>% 
  #w miejscu Test wppisujemy wyrazenie regularne
  filter(!is.na(check))

# locate text and replace - test records
df1 <- sample_df %>% 
  mutate(check = str_replace(Description, "Test", "MAGIC"))


#------- join tables ---------

View(band_members)
View(band_instruments)

# dplyr 
df6 <- band_members %>% 
  inner_join(band_instruments, by="name")

df6 <- band_members %>% 
  left_join(band_instruments, by="name")

df6 <- band_members %>% 
  right_join(band_instruments , by="name")

df6 <- band_members %>%
  full_join(band_instruments, by="name")

df6 <- band_members %>% 
  full_join(band_instruments2, by = c("name" = "artist"))

#sqldf

df6 <- sqldf("SELECT * 
             FROM band_members as m
             JOIN band_instruments as i
              on m.name = i.name")



#----- fill up NA values ------
day = c(1, 1, 2, 2, 3, 3)
hour = c(8, 16, 8, 16, 8, 16)
profit = c(100, 200, 50, 60, NA, NA)
shop.data = data.frame(day, hour, profit)



