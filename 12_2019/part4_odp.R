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


## scatter plot

# data
plot1 <- ggplot(data = stocks, 
                aes(DAX, FTSE ))

# plot definition
plot2 <- plot1 +
  geom_point()

# print plot
plot2



## line plot

# data
line_plot1 <- ggplot(data = stocks, 
                aes(tms, FTSE ))

# plot definition
line_plot2 <- line_plot1 +
  geom_line()

# print plot 
line_plot2


## bar blot 

# histogram
hist_plot1 <- ggplot(data = stocks, 
                   aes(DAX))

hist_plot2 <- hist_plot1 + geom_histogram()
hist_plot2

# frequency plot (regular bar plot)

bar_plot1 <- ggplot(data = mtcars,
                    aes(Cars, hp)) 

bar_plot2 <- bar_plot1 + geom_col() 
bar_plot2

# + color 

bar_plot1 <- ggplot(data = mtcars,
                    aes(x = Cars,
                        y = hp,
                        fill = Cars))

bar_plot2 <- bar_plot1 + 
  # identity parametr - represents frequency of occurance for particular group
  geom_bar(stat="identity") + 
  scale_x_discrete(labels = rep("", dim(mtcars)[1]))

bar_plot2


## box plot
library(stringr)

df1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+') )

box_plot1 <- ggplot(data = df1, 
                    aes(Brand, hp))

box_plot2 <- box_plot1 + geom_boxplot()
box_plot2


## maps
library(maps)
library(mapdata)
world <- map_data("world")

df <- data.frame(region=c('Poland', 'France','Brazil','Argentina', 'Australia'), 
                 value=c(40, 100, 110, 120, 60), 
                 stringsAsFactors=FALSE)


plotMap <- ggplot(data = world)

# make map 
plotMap1 <- plotMap + 
  geom_map(data=world, map=world,
           aes(x=long, y=lat, group=group, map_id=region),
           fill="white", colour="#7f7f7f", size=0.5)

# add data frame to map
plotMap2 <- plotMap1 + geom_map(data=df, map=world,
                  aes(fill=value, map_id=region),
                  colour="#7f7f7f", size=0.5)


# set scale colors
plotMap3 <- plotMap2 + scale_fill_continuous(low="thistle2", high="darkred", 
                               guide="colorbar")

# set labels
plotMap4 <- plotMap3 + labs(fill="legend", title="Sample Title", x="", y="")

# change theme
plotMap5 <- plotMap4 + theme_bw()
plotMap6 <- plotMap5 + theme(panel.border = element_blank())

# remove lines on y and x axis
plotMap7 <- plotMap6 + scale_y_continuous(breaks=c())
plotMap8 <- plotMap7 + scale_x_continuous(breaks=c())



## save plot to file 

ggsave("plot_name.png", plots_test1, width = 9, height = 4)





#---- plotly ----------
# https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf
# https://plot.ly/r/

## scatter plot
plot11 <- plot_ly(data = stocks, 
                  x = ~DAX,
                  y = ~FTSE)
plot11
## line plot

# one line
plot12 <- plot_ly(data = stocks, 
                  x = ~tms,
                  y = ~FTSE, 
                  type = 'scatter', 
                  mode = 'lines') 
plot12
# two lines - add line
plot12 <- plot_ly(data = stocks, 
                  x = ~tms,
                  y = ~FTSE, 
                  type = 'scatter', 
                  mode = 'lines') %>%
  add_trace(y = ~DAX, 
            name = 'DAX', 
            mode = 'lines+markers')



## bar plot 
# histogram 
hist_plot11 <- plot_ly(data = stocks, 
                       x = ~DAX,
                       type = 'histogram')

hist_plot11

# frequency plot (regular bar plot)
bar_plot11 <- plot_ly(data = mtcars,
                      x = ~Cars, 
                      y = ~hp,
                      name = 'Sample bar plot',
                      type = 'bar')



## box plot
library(stringr)

df1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+') )

box_plot11 <- plot_ly(data = df1,
                      y = ~hp,
                      color = ~Brand,
                      type = 'box')



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
          projection = list(type = "Mercator"))


# draw map
plotMap11 <- plot_geo(df_country) %>%
  add_trace(z = ~value, color = ~value, colors = "Blues",
            text = ~region, locations = ~code, marker = list(line = l)) %>%
  colorbar(title = "Legend") %>%
  layout(title = "Sample Map",
         geo = g)
plotMap11


## write plot to file
#library(htmlwidgets)

saveWidget(plot1, "plot1.html")


