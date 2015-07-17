require(leaflet)
require(dplyr)
d1 <- read.csv("dierentellingspa.csv", stringsAsFactors = F)

cols <- brewer.pal(10, name = 'Set3')

d1$name[is.na(d1$name)] <- "nameless"
d1$extra[is.na(d1$extra)] <- ""
d1$mainspecies <- as.factor(d1$mainspecies)

leaflet(d1, 900, 640) %>%addProviderTiles("Stamen.Toner") %>% 
  addCircleMarkers(lng = ~jitterlong, lat=~jitterlat, 
             fillColor = ~mscolor, color=~mscolor,
             radius=10, weight=1, fillOpacity=0.6,
             popup = paste0(d1$name, "<br>", d1$species, "<br>" ,d1$extra)) %>%
  addLegend(pal = colorFactor(palette = cols, levels = 1:10),
            values = ~mainspecies, opacity = 1, title="Species")

