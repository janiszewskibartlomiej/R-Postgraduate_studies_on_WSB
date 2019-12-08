##########
# PART 4 #
##########

library(dplyr)
library(ggplot2)
library(plotly)
library(lubridate)
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



#---- ggplot2 -----
# https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf
# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization


## scatter plot  punktowy



# data

plot1 <- ggplot(data = stocks, 
                aes(DAX, FTSE))
plot1

# plot definition

plot2 <- plot1 + geom_point()

# print plot

plot2


## line plot  liniowy

# data


plot11 <- ggplot(data = stocks, 
                aes(tms, FTSE))
plot11

# plot definition

plot12 <- plot11 + geom_line()



# print plot 

plot12

## bar blot slupkowy

# histogram

plot21 <- ggplot(data = stocks,
                 aes(FTSE)) 

plot22 <- plot21 + geom_histogram()
plot22

# frequency plot (regular bar plot)   wykres slubkowy

plot31 <- ggplot(data = mtcars,
                 aes(x = Cars,
                     y = hp,
                     fill = Cars)) +

# + color 

  
  geom_bar(stat = 'identity') +
  scale_x_discrete(labels = rep("", dim(mtcars)[1]))

plot31


## box plot
library(stringr)

df1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+') )  #str_extract to jest zastosowanei regex


plot41 <- ggplot(data= df1, aes(Brand, hp))  
  
plot42 <- plot41 + geom_boxplot()
plot42

## maps
library(maps)
library(mapdata)
world <- map_data("world")

df <- data.frame(region=c('Poland', 'France','Brazil','Argentina', 'Australia'), 
                 value=c(40, 100, 110, 120, 60), 
                 stringsAsFactors=FALSE)


plotMap <- ggplot(data = world)

plotMap

# make map 
plotMap1 <- plotMap + 
  geom_map(data=world, map=world,
           aes(x=long, y=lat, group=group, map_id=region),
           fill="white", colour="#7f7f7f", size=0.5)
plotMap1


# add data frame to map
plotMap2 <- plotMap1 + geom_map(data=df, map=world,
                  aes(fill=value, map_id=region),
                  colour="#7f7f7f", size=0.5)

plotMap2

# set scale colors
plotMap3 <- plotMap2 + scale_fill_continuous(low="thistle2", high="darkred", 
                               guide="colorbar")
plotMap3


# set labels
plotMap4 <- plotMap3 + labs(fill="legend", title="Sample Title", x="", y="")
plotMap4


# change theme
plotMap5 <- plotMap4 + theme_bw()
plotMap6 <- plotMap5 + theme(panel.border = element_blank())

plotMap6


# remove lines on y and x axis
plotMap7 <- plotMap6 + scale_y_continuous(breaks=c())  # pozbywamy sie lini c() oznacza ze puste
plotMap8 <- plotMap7 + scale_x_continuous(breaks=c())

plotMap8


## save plot to file 

ggsave("plot_name.png", plots_test1, width = 9, height = 4)





#---- plotly ----------
# https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf
# https://plot.ly/r/      ta biblioteka robi strone html z wykresem   sa niestety ciezkie

## scatter plot

plot1_s <- plot_ly(data=stocks,
                  x = ~DAX,     #  tu trzeb pamiatac aby przy deklaracji dodac tylda ~
                  y = ~FTSE)
plot1_s


## line plot

# one line

plot2_l <- plot_ly(data = stocks,
                   x = ~tms,     #  tu trzeb pamiatac aby przy deklaracji dodac tylda ~
                   y = ~FTSE,
                   type = 'scatter',
                   mode='lines',
                   name= 'FTSE')
plot2_l

# two lines - add line

plot3_l <- plot2_l %>%
  add_trace(
    y=~DAX,
    name= 'DAX',
    mode='lines_markers'
  )

plot3_l

## bar plot 
# histogram 

plot4_h <- plot_ly(data=stocks,
                   x = ~FTSE,
                   typ = 'histogram')

plot4_h



# frequency plot (regular bar plot)



plot5_b <- plot_ly(data=mtcars,
                   x = ~hp,
                   y = ~Cars,
                   typ = 'bar'
                   ) %>%
  layout(title='Sample bar plot')

plot5_b




## box plot
library(stringr)

df1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+') )


plot5_box1 <- plot_ly(data=df1,
                   x = ~hp,
                   y = ~Brand,
                   type = 'box') %>%
  layout(title='Sample bar plot')

plot5_box1
  

## maps
library(countrycode)

df <- data.frame(region=c('Poland', 'France','Brazil','Argentina', 'Australia'), 
                 value=c(40, 100, 110, 120, 60), 
                 stringsAsFactors=FALSE)

df_country <- df %>%
  mutate(code=countrycode(region,"country.name","iso3c"))




# light grey boundaries              
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection options
g <- list(showframe = FALSE,
          showcoastlines = TRUE,
          showland = TRUE,
          landcolor = "white",
          coastlinewidth = 0.5,
          coastlinecolor = toRGB("grey"),
          projection = list(type = "Mercator"))  #mercator to rodzaj mapy


# draw map
plotMap11 <- plot_geo(df_country) %>%
  add_trace(z = ~value, color = ~value, colors = "Blues",   # add_trace nanosi dane na mape
            text = ~region, locations = ~code, marker = list(line = l)) %>%
  colorbar(title = "Legend") %>%
  layout(title = "Sample Map",
         geo = g)
plotMap11





## write plot to file
library(htmlwidgets)

saveWidget(plotMap11, "plot1.html")


