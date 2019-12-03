###############
# exercises 4 #
###############
library(ggplot2)



#----- ex 1 ------
# change the theme to black-white
# zmien styl wykresu na czarno-bialy

plot1 <- ggplot(data = stocks, 
                aes(DAX, FTSE )) +
  geom_point() 

plot1



#----- ex 2 ------
# add additional line with DAX index to below plot
# dodaj dodatkowa linie z indeksem DAX to wykresu ponizej


line_plot1 <- ggplot(data = stocks, 
                     aes(tms, FTSE )) +
  geom_line() 

line_plot1




#----- ex 3 ------
#  change name of axis x to "date" and y to "index"
#  zmien oznaczenie osi x na "date" i y na "index"



#----- ex 4 ------
# change sample ggplot to plotly
# zamien ggplot na plotly





