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
time_extr <- as.numeric(time(EuStockMarkets))
tms <- date_decimal(time_extr)

## join vector with data frame 
stocks <- cbind(tms, stocks)



#---- prepare data - mtcars ------
# rowname as column 

mtcars <- cbind(rownames(mtcars), mtcars)
colnames(mtcars)[1] <- "Cars"

# rowname as index 
rownames(mtcars) <- seq(from = 1 , to = dim(mtcars)[1] )



#---- introduction to dplyr -----

# column(s) selection

tst1 <- mtcars %>%
  select(Cars, mpg, cyl)

tst1 <- mtcars %>% 
  select(-carb)

# filter rows

tst1 <- mtcars %>% 
  filter(mpg >= 20)

tst1 <- mtcars %>%
  filter(cyl == 6 & disp >= 160)

# data transform 
storms2 <- storms

tst2 <- storms %>%
  mutate(Date = paste(year, month, day, sep= "-")) %>%
  mutate(Date1 = as.Date(Date, format = "%Y-%m-%d")) %>%
  mutate(Cat1 = ifelse(wind > 20, "Strong Wind", "Weak Wind"))

tst2 <- storms %>% 
  arrange(wind)

tst2 <- storms %>%
  arrange(desc(wind), pressure)


# data aggregation 
tst2 <- storms %>%
  mutate(Date = paste(year, month, day, sep= "-")) %>%
  mutate(Date1 = as.Date(Date, format = "%Y-%m-%d")) %>%
  group_by(Date1) %>%
  summarise( mean_wind = mean(wind), 
             no_obs = n() )
  


#----- introduction to tidyr -----
# https://rpubs.com/bradleyboehmke/data_wrangling


# transform columns to rows 
tst3 <- mtcars %>%
  gather(key = Category, value = Value, -Cars )


# one column to multiple columns
tst4 <- tst3%>%
  spread( Category, Value)


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
difftime(Sys.Date(), as.Date('2018-07-29'), units = 'd')

Sys.Date() %m+% months(1)
Sys.Date() %m-% months(1)


# year, month, day, hour extraction 
tst5 <- stocks %>%
  mutate(
    Year = year(tms),
    Month = month(tms),
    Day = day(tms),
    Hour = hour(tms)
  )


#------ regular expresions (regex) -----
# https://www.rstudio.com/wp-content/uploads/2016/09/RegExCheatsheet.pdf
# https://regex101.com/
# http://rubular.com/


sample_df <- read.csv(file="SampleFiles\\Metadane1.csv")

# locate text - test records

str_extract(sample_df$Description, 'Test')
str_match(sample_df$Description, 'Test')

sample_df <- sample_df %>%
  mutate(Test_match = str_extract(Description, 'Test')) %>%
  filter(!is.na(Test_match))

# locate text and replace - test records
str_replace(sample_df$Description, 'Test', 'Test1')



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


shop.data1 <- shop.data %>% 
  mutate(profit= ifelse(is.na(profit), mean(profit, na.rm=TRUE), profit))

