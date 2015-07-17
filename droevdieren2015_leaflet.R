require(leaflet)
d1$name[is.na(d1$name)] <- "nameless"
leaflet(d1) %>%addProviderTiles("Stamen.Toner") %>% 
  addCircleMarkers(lng = ~jitterlong, lat=~jitterlat, 
             fillColor = ~mscolor, color=~mscolor,
             radius=10, weight=1, fillOpacity=0.6,
             popup = paste0(d1$name, " ", d1$species, ", " ,d1$extra)) %>%
  addLegend(pal = colorFactor(palette = cols, levels = 1:10),
            values = ~mainspecies, opacity = 1, title="Species")

