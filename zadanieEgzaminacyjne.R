### Pytanie 1 

#Jaką funkcję należy użyc aby załadować plik csv do ramki danych? 

1. read.csv() <--
2. readCsv() 
3. read_csv() 
4. csv.read() 

#read.csv() 



### Pytanie 2

Wybierz bibliotekę służącą do przekształcania danych (data wrangling).

1. DBI
2. plotly
3. dplyr <--
4. xlsx

 #dplyr


### Pytanie 3 

Jaki będzie rezultat wywołania poniższej funkcji? 

SampleFunction <- function(a, b) {
 a <- 1
 c <- a + b
 
 return(c)

}

SampleFunction(a= 2, b = 3)


4


### Pytanie 4 

Która z poniższych bibliotek nie służy do wykonywania wykresów? 

1. ggplot2
2. plotly
3. dplyr   <--
4. Żadna z powyższych.

#dplyr


### Pytanie 5

Co będzie rezultatem wykonania poniższej lini kodu? 


x <- c("a", "b", "c", "d")
y <- c("w", "x", "y", "z")

paste(x, y, sep="%%")


1. "a;w","b;x","c;y","d;z"
2. "a%%w%%b%%x%%c%%y%%d%%z"
3. "a,w,b,x,c,y,d,z"
4. "a%%w" "b%%x" "c%%y" "d%%z"  <--

#"a%%w" "b%%x" "c%%y" "d%%z"


### Pytanie 6 

Jaki kod należy wpisać aby wybrać rekord z 2giego wiersza i 3ciej kolumny z poniższej ramki danych?


SampleDF <- data.frame(City = c("Gdansk", "Gdynia", "Sopot", "Gdansk", "Gdynia", "Sopot", "Sopot", "Gdansk"),
                  Sales = c(500, 400, 200, 400, 200, 250, 200, 100 ),
                  Employees = c(6, 4, 1, 6, 4, 1, 2, 3 ))

1. SampleDF[,2]
2. Df1[2,3]
3. SampleDF[2,3] <--
4. SampleDF[3,2]

#SampleDF[2,3]


### Pytanie 7 

Jaki rodzaj wykresu będzie rezultatem poniższego kodu? 

```{r message=FALSE, warning=FALSE, eval=FALSE}
library(ggplot2)
library(datasets)

stocks <- data.frame(EuStockMarkets)

plot1<- ggplot(data = stocks,
                        mapping = aes( x = FTSE,
                                       y = DAX))

plot2 <- plot1 + geom_point()

plot2

```
1. Scatter  <--
2. Line
3. Histogram
4. Map


#Scatter


### Pytanie 8 

Jaki typ(y) danych będzie / będą zapisane w poniższym wektorze? 

```{r}
SampleVec <- c(1, "bla", TRUE)

```
1. numeric, character, logical
2. character  <--
3. numeric, character
4. numeric

#character


### Pytanie 9

Do czego wykorzystywany jest znak '$' w ramkach danych? 

1. Odwoływalnie się do poszczególnych wierszy. 
2. Budowania funkcji.
3. Budowania relacji miedzy wierszami. 
4. Odwoływanie się do poszczególnych kolumn.  <--

#Odwoływanie się do poszczególnych kolumn.

### Pytanie 10 

Która z poniższych lini kodu wybierze rekord(y) gdzie sprzedaż jest większa od 200 i mniejsza od 400. 

```{r message=FALSE, warning=FALSE, eval=FALSE}

SampleDF <- data.frame(City = c("Gdansk", "Gdynia", "Sopot", "Gdansk", "Gdynia", "Sopot", "Sopot", "Gdansk"),
                  Sales = c(500, 400, 200, 400, 200, 250, 200, 100 ),
                  Employees = c(6, 4, 1, 6, 4, 1, 2, 3 ))

```


1. SampleDF %>% filter(Sales > 200 & Sales < 400)  <--
2. SampleDF %>% filter(Sales > 200 | Sales < 400)
3. SampleDF %>% filter(Sales >= 200 & Sales =< 400)
4. SampleDF %>% filter(Sales > 200 %and% Sales < 400)

#SampleDF %>% filter(Sales > 200 & Sales < 400)


### Pytanie 11 

Dla poniższego wektora podaj, który kod nie wywoła tylko i wyłącznie "MO" i "TU". 


t <- c("MO", "TU", "WE", "TH", "FR", "SA", "SO")

1. t[c(1,2)] 
2. t[c(-3,-4,-5,-6,-7)] 
3. t[t=="MO" | t=="TU"]
4. t[c(-7:-5)]  <--

#4. t[c(-7:-5)]


### Pytanie 12 

Jeżeli w ramce danych są dostępne następujące kolumny: 
"name", "year", "month", "day", "hour" 

Co wywoła poniższy kod?


data(storms)
storms %>% mutate(Date = paste(year, month, day, sep= "-")) 


1. Zostaną wybrane wiersze, które są w formacie "yyyy-mm-dd".
2. Zastąpi obecna kolumnę "Date", która będzie składać się roku, miesiąca oraz dnia.  
3. Utworzy nową kolumnę "Date", która będzie składać się roku, miesiąca oraz dnia.  <--
4. Żadne z powyższych. 

#Utworzy nową kolumnę "Date", która będzie składać się roku, miesiąca oraz dnia.h

### Pytanie 13 

Jeżeli dzisiaj jest 13 grudnia 2018, to co będzie wynikiem wywałania poniższej lini kodu? 

```{r message=FALSE, warning=FALSE, eval=FALSE}


#difftime(Sys.Date(), as.Date('2018-12-10'), units = 'd')
difftime(as.Date('2018-12-13'), as.Date('2018-12-10'), units = 'd')
```


1. -3
2. 3 <--
3. -72
4. 72

#3


### Pytanie 14 

Co bedzię rezultatem wywołania poniższych lini kodu?

```{r}
library(dplyr)

day = c(1, 1, 2, 2, 3, 3)
hour = c(8, 16, 8, 16, 8, 16)
profit = c(100, 200, 50, 60, NA, NA)
shop.data = data.frame(day, hour, profit)


shop.data %>% mutate(profit= ifelse(is.na(profit), median(profit, na.rm=TRUE), profit))


```

1. Wszystkie rekordy w kolumnie profit zostaną zamienione na NA.   
2. Rekordy NA będą zastąpione średnią arytmetyczną wartości całej kolumny profit.
3. Rekordy NA będą zastąpione madianą wartości całej kolumny profit.   <--
4. Rekordy, które nie są NA będą zastąpione medianą wartości całej kolumny profit.

#Rekordy NA będą zastąpione madianą wartości całej kolumny profit.


### Pytanie 15 

Co wywołają poniższe linie kodu? 

```{r message=FALSE, warning=FALSE, eval=FALSE}
library(ggplot2)
library(datasets)

stocks <- data.frame(EuStockMarkets)

plot1 <- ggplot(data = stocks, 
                aes(DAX, FTSE ))

plot1

```


1. W zakładce plot pojawi się kompletny wykres (tło ze skalą, wykres liniowy oraz podpisane osie).
2. W zakładce plots pojawi się zarys wykresu (tło ze skalą oraz podpisane osie).  <--
3. W zakładce plot pojawi się kompletny wykres (tło ze skalą, wykres punktowy oraz podpisane osie). 
4. Nic nie zostanie wyświetlone. 

 #W zakładce plots pojawi się zarys wykresu (tło ze skalą oraz podpisane osie).

### Pytanie 16

Co pojawi się na ekranie (w konsoli) po wywyłaniu poniższej lini kodu: 

```{r message=FALSE, warning=FALSE, eval=FALSE}

for ( i in  10 : 1) {
  print(i)
}



```


1. Wektor wypełniony wartościami od 1 do 10.
2. Wektor wypełniony wartościami od 10 do 1.
3. 10 pojedynczych elementów (wektorów jednoelementowych) z wartościami od 1 do 10.
4. 10 pojedynczych elementów (wektorów jednoelementowych) z wartościami od 10 do 1.  <--

#10 pojedynczych elementów (wektorów jednoelementowych) z wartościami od 10 do 1.


### Pytanie 17 

Która z poniższych bibliotek nie służy do ładowania plików xlsx do ramki danych? 

1. XLConnect 
2. readxl
3. RSQLite  <--
4. xlsx

# RSQLite


### Pytanie 18

Jaką funkcje należy wstawić w "__" aby uzyskać w kolumnie "Cat1" kategorie wiatru "strong wind" gdy szybkość przekroczy 20 (km/h).

```{r message=FALSE, warning=FALSE, eval=FALSE}


tst2 <- storms %>%
  mutate(Cat1 = __(wind > 20, "Strong Wind", "Weak Wind"))



```

1. if
2. ifelse  <--
3. countif
4. elseif  

#ifelse

### Pytanie 19 

Jakich funkcji / kroków użyjesz aby zbudować podsumowanie (agregacje) dla poszczególnych miast z poniższej ramki danych?


```{r}
library(dplyr)
SampleDF <- data.frame(City = c("Gdansk", "Gdynia", "Sopot", "Gdansk", "Gdynia", "Sopot", "Sopot", "Gdansk"),
                  Sales = c(500, 400, 200, 400, 200, 250, 200, 100 ),
                  Employees = c(6, 4, 1, 6, 4, 1, 2, 3 ))

```

1. SampleDF %>% group_by(City) %>% summarise(Sum = sum(Sales), Average = mean(Sales))  <--
2. SampleDF %>% summarise(Sum = sum(Sales), Average = mean(Sales)) %>% group_by(City)
3. TestDF %>% group_by(City) %>% summarise(Sum = sum(Sales), Average = mean(Sales))
4. TestDF %>% summarise(Sum = sum(Sales), Average = mean(Sales))

#SampleDF %>% group_by(City) %>% summarise(Sum = sum(Sales), Average = mean(Sales))


### Pytanie 20 

Który z poniższy kodów zwróci błąd (error)? 


1. mtcars %>% filter(cyl == 6 && disp >= 160)
2. mtcars %>% filter(cyl == 6 || disp >= 160)
3. mtcars %>% filter(cyl = 6 | disp >= 160)  <--
4. mtcars %>% filter(cyl == 6 | disp >= 160)

#mtcars %>% filter(cyl = 6 | disp >= 160)
