library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(RColorBrewer)
require(dplyr)

#data
d1 <- tbl_df(read.csv("dierenlijst2015.csv", fileEncoding = "UTF-8",
                      stringsAsFactors = F, na.strings="", row.names = NULL, sep=";", ))
#View(d1[d1$species =="cat",])

d1 <- mutate(d1, gender=ifelse(is.na(gender),"unknown",gender))
d1$gender <-  factor(d1$gender, labels= c("Bibili", "Girls", "Boys", "unknown"))

d1$species <- tolower(d1$species)
d1$species <- factor(d1$species)

d1$mainspecies <- d1$species
d1$House <- as.factor(d1$house)
levels(d1$mainspecies)[table(d1$species) < 3] <- "other"
d1$mainspecies_n <- as.numeric(d1$mainspecies)

# by house
d1 %>% group_by(house, mainspecies, mainspecies_n) %>% 
  summarise(Count=n()) %>% 
  mjs_plot(x=house, y=mainspecies, width=500, height=400) %>%
  mjs_point(color_accessor = mainspecies,
            size_accessor =  Count,
            size_rance(1, 11),
            color_type="category",
            color_range=brewer.pal(10, name = "Set3"))# %>%
  mjs_axis_x(xax_format = 'plain')
