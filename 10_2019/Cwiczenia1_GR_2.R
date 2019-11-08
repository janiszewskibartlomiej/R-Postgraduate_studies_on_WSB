###############
# exercises 1 #
###############

#---- ex 1 -------
# create a vector of sum, maximum, minimum value of 3, 6 ,9
# utworz wektor skladajacy sie z sumy, wartosci maksymalnej, minimalnej z liczb 3, 6, 9 

vector <- c(sum(3,6,9), max(3,6,9), min(3,6,9))
vector

v1 <- c(3,6,9)

new_v <- c(sum(v1), max(v1), min(v1))



#---- ex 2 -------
# for below data frame create an ID column
# dla ponizszej ramki danych utworz kolumne z indeksem dla poszczegolnych wierszy 

df1 <- data.frame( first_col = c(1112, 123143, 3554, 1245, 6346), 
                   Name = c("Kris", "Tom", "Ella", "Cloe", "John") )

df1$ID <- c(1:5)   #dożucmy kolumne o nazwie ID z wartościami
df1$ID <- 1:5



dim(df1)

seq1 <- 1: dim(df1)[1]
df1$ID <- seq1


#---- ex 3 -------
# for above data frame create an test column in which for even id row write "even", otherwise "odd"
# dla df1 z poprzedniego zadania dodaj kolumne, w ktorej bedzie informacja czy wiersz jest parzysty lub nieparzysty

df1$ID

ifelse(test = df1$ID %% 2 ==0, yes = "parzysty", no = "nie parzysty")



df1$Czy_parzyste <- ifelse(test = df1$ID %% 2 ==0, yes = "parzysty", no = "nie parzysty")



#---- ex 4 -------
# select last 2 rows of df1
# wybierz 2 ostatnie wiersze df1

od1 <- (dim(df1)[1]-1)

do1 <- (dim(df1)[1])

df1[ od1: do1, ]    # po preinku sa kolumney jak nie piszemy to bierzemy wszystkie



#---- ex 5 -------
# put text1 and text2 together and count number of characters in the text
# polacz text1 and text2 zamien duze litery na male oraz policz liczbe znakow w tekscie

text1 <- "Marketing CaMpaign cost 1 BLN dollars, which was higher than in 2017"

text2 <- "It is important to reduce the costs by 30%,,, next year"

nowy_text <- paste(text1, text2, sep = "")


male_litery <- tolower(nowy_text)

nchar(male_litery)

#---- ex 6 -------
# create a new data frame, which will look like example below
# utworz nowa ramke danych, która będzie wyglądać jak poniżej: 

##   Age   Name Gender
## 1  22  James      M
## 2  25 Mathew      M

ramka <- data.frame(
                      Age = c(22,25),
                      Name = c("James", "Mathew"),
                      Gender = c("M", "M"))

ramka

#--- ex 7 ------
# sum up 2 below vectors. What will be the result? 
# policz sume dwoch ponizszych wektorow. Jaki bedzie rezultat? 

x <- c(2, 4, 6, 8)
y <- c(TRUE, TRUE, FALSE, TRUE)
xxx <- sum(x)

z <- sum(x,y)

x + y

#---- ex 8 -----
# what will be the dimmension of below vector? 
# jaki bedzie wymiar / wielkosc wektora ponizej? 

x=c(0:11)
x
length(x)

#---- ex 9 -----
# check if below elements are numeric and print the type it represents on the screen. 
# sprawdz, czy ponizszy wektor jest typem numerycznym oraz wyswietl jaki rodzaj danych jest w wektorze.

x=c('blue',10,'green',20)

is.numeric(x)
is.character(x)

class(x)
typeof(x)



#---- ex 10 -----
# generate vector from 23 to 15.
# wygeneruj wektor od 23 do 15. 

x <- c(23:15)

#lub
z <- 23 : 15


x

seq(23,15)

#----- ex 11 ------
# create below vetors by using sequental and / or repetition functions 
# utworz ponizsze wektory za pomoca funkcji sekwencyjnych i / lub powtarzających

c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4)
c(1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4)

rep(seq(1,4), 3)

c(rep(1,3), rep(2,3), rep(3,3), rep(4,3))

#------ ex 12 --------
# filter out na values from below vector
# odfiltruj puste wartosci z ponizszego wektora 

X = c(NA,3,14,NA,33,17,NA,41)
X
X[!is.na(X)]

#-------- ex 13 -------
# filter out na rows from df below.
# odfiltruj wiersze, w ktorych sa puste wartosci. 

df <- data.frame (Name = c(NA, "Kris", "JOhn", NA, "Alex"), 
                  Sales = c(15, 18, 21, 56, 60), 
                  Price = c(34, 52, 21, 44, 20),
                  stringsAsFactors = FALSE) 

df[is.na(df),]

subset(df, !is.na(df$Name))

df[!is.na(df[1,]), ]

df[which(!is.na(df[,1])),]


#-------- ex 14 -------
# filter out na columns from df below.
# odfiltruj kolumny, w ktorych sa puste wartosci. 

df <- data.frame (Name = c(NA, "Kris", "JOhn", NA, "Alex"), 
                  Sales = c(15, 18, 21, 56, 60), 
                  Price = c(34, 52, 21, 44, 20),
                  stringsAsFactors = FALSE) 

any(is.na(df[,1]))
any(is.na(df[,2]))
any(is.na(df[,3]))

chec1 <- apply(df, 2, function(x) sum(is.na(x)))
#przejdz po df po komunach [1 po wierszach]
myCol <- names(chec1[chec1==TRUE])
df[ , myCol]


check2 <- sapply(df, function(x) any(is.na(x)))



df[,!is.na(df[1,])]

#niby to jest be ale wynik jest ok > subset(df,!is.na(df$Name))


#--------- ex 15 -------
# how many signs are in below vector
# ile znakow jest w ponizszym wketorze

zz <- c("seaside's", "Best ")

sum(nchar(zz))


#--------- ex 16 -------
# write code to print "007 James, Bond" based on below vectors
# stworz napis: "007 James, Bond" na podstawie ponizszych wektorow

apple <- "James"
big_number <- "Bond"
some_txt <- 007

paste("00", some_txt, " ", apple, ",", " ", big_number, sep = "")



#--------- ex 17 -------
# write sum function for 2 arguments, which will check if both are numeric at first. 
# napisz funkcje zwracajaca sume 2 wartosci, ktora bedzie sprawdzac czy 2 argumenty sa cyframi. 

suma_char <- function(a, b) {
  if(is.numeric(a) & is.numeric(b))
    {a + b}
  else NA
  
}


suma_char(5,6)
suma_char(3,"s")  

#--------- ex 18 -------
# add below wektors to data frame form ex. 2.
# dodaj ponizsze wektory do ramki danych z cwiczenia 2.


x <- c( 346, "Don") 
y <- c( 369, "Katy")


df1$Name <- as.character(df1$Name)
rbind(df1, x, y)

#--------- ex 19 -------
# create a lapply function which will count number of even numbers in each column and row.
# utworz funkcje typu apply, ktora bedzie liczyc ilosc cyfr parzystych w wierszach i kolumnach

df2 <- data.frame(col1 = c(1, 2, 3),
                  col2 = c(4, 5, 6),
                  col3 = c(7, 8, 9),
                  col4 = c(10, 1, 1))

even_count <- function(x) {
  
  count_mod <- sum(ifelse(x%%2 == 0, 1, 0))
  return(count_mod)
}


apply(df2, 2, FUN = function(x) even_count(x) )

#--------- ex 20 -------
# use lapply function to count sum of each matrix in list and calculate sum of the previous result.
# Plicz sume kazdej macierzy z listy oraz policz sume dla wszystkich sum z poszczegolnych list. 


A<-matrix(1:9, 3,3)
B<-matrix(4:15, 4,3)
C<-matrix(8:10, 3,2)
MyList<-list(A,B,C) 


MyList_sum <- lapply(MyList, sum)
MyList_sum_total <- sum(unlist(MyList_sum))
