
##########
# PART 1 #
##########

#---- hello world ----

print("Hello WSB")


#---- calculator ----

1 + 1
2 - 1
2 / 2
5 %% 2


#---- math / stat functions ----
sum(1, 2, 3)
mean(c(1,2,3))    # srednia
median(c(1,2,3))    #mediana
min(c(1,2,3))


#----- variables  ----

 a <- 3   # przypisanie wartości do a
a <- 4

#---- data types-----

## logical 

TRUE
FALSE

a <- TRUE
b <- FALSE

class(a)


## numeric

c <- 12
c <- 12.5

class(c)
class(d)


## text

e <- "my smaple text"
class(e)

## vectors 

aa <- c(1,2,3)

class(aa)

vec

# choose 1st element from vector

aa[1]

# choose first two elemenets from vector

aa[1:2]
# what happened?
tst <- c(1, "bla", TRUE)

#wektor musi byc zawsze w tym samym typie  powyzszy przyklad - wszytsko jest tekstem poniewaz jeden element jest tekstem

## lists 

my_list <- list(c(1,2,3), c(4,5,6,7))
#bardziej zaawansowane obiety sa pokazywanen w data a nie values




# choose first object from list

my_list[[1]]



# choose 2nd and 3rd element from 1st object

my_list[[1]][2:3]


## matrix

my_matrix <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
my_matrix1 <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE) 

my_matrix
my_matrix1

my_matrix[1,]  # wszytskie elemnety z wiersza


my_matrix1[1,]
my_matrix1[,2]



## arrays - tu jest budowanie w przestrzeni



my_array <- array(data = c("green", "blue"), dim = c(2,3,4))   #dim - 2 wiersze 3 kolumny i powtorz 4 razy

my_array

## factors - typ wynikowy pokazuje ile jest unkalnych wynkow

vec1 <- c("dom", "kot", "pies", "kot", "kot", "pies")

factor(vec1)

my_factor <- factor(vec1)


## data frames - ramka danych

#df jest sklejeniem kolumnowym  - jest sortowanie i lupa to jest super


df <- data.frame(ID = c(1,2,3,4),
                 Miasto = c("Gdańsk", "Gdynia", "Sopot", "Gdańsk"),
                 Cena = c(10,20,20,40))


# unique values


vec2 <- c(1,2,3,4,4)

unique((vec2))



#---- operators ----

# math
v1 <- c(5.5 , 6)
v2 <- c(3, 4)

v1 + v2 
v1 - v2 
v1 * v2   #1 element z 1 elem v2 drugi z drugim
v1 / v2
v1 %% v2
v1 ^ v2


# relation

v1 > v2 
v1 < v2 
v1 == v2
v1 <= v2
v1 >= v2
v1 != v2

# logical 

t1 <- ( 1 + 2 > 4)
t2 <- ( 3 + 4 == 7)

t1
t2

t1 & t2  #wspolna wartosc dla obu

t1 | t2
t1 || t2



# other operators 

2:4

v1 <- 8
v2 <- 12
t <- 1:10

t


v1 %in% t
v2 %in% t

#--- if clause ----

if (1 > 2) {
  
  print("jest super na wsb")

  } else if (1 ==2){
  
  print("ujdzie")

  } else {
  
  print("nie az tak super")

  }

#---- loops ----

# for 

for (i in 1:10) {
  print(i)
}


# while 

i = 1

while (i < 7) {
  print(i)
  i = i + 1
}





#---- functions -----


mySum <- function(a,b=10) {
  result <- a+b
  return(result)
}

mySum(5, b = 4)

mySum(a = 5)

#----- text operations -----

# correct

a <- 'Start and end with single quote'
print(a)

b <- "Start and end with double quotes"
print(b)

c <- "single quote ' in between double quotes"
print(c)

d <- 'Double quotes " in between single quote'
print(d)


#  wrong
# e <- 'Mixed quotes" 
# print(e)
# 
# f <- 'Single quote ' inside single quote'
# print(f)
# 
# g <- "Double quotes " inside double quotes"
# print(g)



# concatenate (text)

text1 <- "First part of the sentence"
text2 <- "Second part of the sentence"


text1
test2

paste(text1, text2, sep = ". ")


x <- c("a", "b", "c", "d")
y <- c("w", "x", "y", "z")


paste(x, y, sep = "")

paste(x, y, sep = ";", collapse = "%")   # collapse skleja caly tekst w jeden bardzo prydaten do zapytan np sql

# basic text operations

x <- "Sales in August 2018: 46500"

nchar(x)

tolower(x)
toupper(x)


#---- vector operations -----

# sequence

v <- 5:10 
v1 <- 6.6 : 12.6

v
v1

seq(from = 5, to = 10, by = 0.1)


# choose elements 

t <- c("MO", "TU", "WE", "TH", "FR", "SA", "SO")


t

t[t == "MO" | t == "TU"]



t[-c(t =="MO")]  # usuwanie danych

t[-1]

#---- lists -----

myList2 <- list(c(1,2,3),
                FALSE,
                sin)
myList2






# name a list


names(myList2) <- c("Numbers", "Logic", "Funtion")
myList2

# call list

myList2$Numbers


# concat list

temList <- list(1,2,3)

newList <- c(myList2, temList)

newList


# list to vector

tst1 <- unlist(newList)



#---- matrix ----

# create new matrix by row

m <- matrix(1:6, nrow = 2, byrow = TRUE)


# create new matrix by column

m1 <- matrix(1:6, nrow = 2, byrow = FALSE)
m1


# create row and column names

col1 <- c("col1", "col2", "col3")
row1 <- c("row1", "row2")


# assign row and column names to matrix

m1 <- matrix(1:6, nrow = 2, byrow = FALSE, dimnames = list(row1, col1))
m1

# call matrix elements

m1[1,1]


# row 2 

m1[2,]

# column 1 

m1[,1]

# factor variables

v3 = c("Gdansk", "Gdynia", "Sopot", "Sopot")

v4 = factor(v3)

is.factor(v4)
is.factor(v3)


#as.character(v4)

levels(v4)

#------ data frames -----

df1 <- data.frame(City = c("Gdansk", "Gdynia", "Sopot", "Gdansk", "Gdynia", "Sopot", "Sopot", "Gdansk"),
                  Sales = c(500, 400, 200, 400, 200, 250, 200, 100 ),
                  Employees = c(6, 4, 1, 6, 4, 1, 2, 3 ))



# create new data frame



# choose rows / columns




# add new column do data frame


# add new row do data frame




# rbind, cbind


# is na


vec1 <- c(23, 45, NA, 45, 12, 34, 56, 21)







