###############
# exercises 4 #
###############
library(ggplot2)



#----- ex 1 ------
# change the theme to black-white
# zmien styl wykresu na czarno-bialy

plot1 <- ggplot(data = stocks, 
                aes(DAX, FTSE )) +
  geom_point() +
  theme_bw()

plot1



#----- ex 2 ------
# add additional line with DAX index to below plot
# dodaj dodatkowa linie z indeksem DAX to wykresu ponizej


line_plot1 <- ggplot(data = stocks, 
                     aes(tms, FTSE )) +
  geom_line() +
  geom_line(data = stocks, 
            aes(tms, DAX),
            color='red')

line_plot1




#----- ex 3 ------
#  change name of axis x to "date" and y to "index"
#  zmien oznaczenie osi x na "date" i y na "index"

line_plot2 <- line_plot1 + labs(x = 'date', y = 'index')
line_plot2

#----- ex 4 ------
# change sample ggplot to plotly
# zamien ggplot na plotly

library(plotly)

ex4 <- ggplotly(line_plot2)
ex4



#ex 1_a
#zmian styl wykresu n czarno bialy


ex1_a <-  
ex5


