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


# plot definition

# print plot




## line plot

# data


# plot definition

# print plot 



## bar blot 

# histogram



# frequency plot (regular bar plot)


# + color 





## box plot
library(stringr)

df1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+') )


  
  

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



## line plot

# one line



# two lines - add line



## bar plot 
# histogram 





# frequency plot (regular bar plot)



## box plot
library(stringr)

df1 <- mtcars %>%
  mutate(Brand = str_extract(as.character(Cars), '^[A-Za-z]+') )


  

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


