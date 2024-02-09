# Mapping Visceral Leishmaniasis Cases in Europe/Globally

library(ggplot2)
library(maps)

#Reading in geographic data
world_coordinates <- map_data("world") 
VL_data <- read.csv("Data/VL_final_dataset.csv")

ggplot() + 
  
  geom_map( data = world_coordinates, map = world_coordinates, aes(long, lat, map_id = region,), 
            color = "black", fill = "darkseagreen4", linewidth = 0.3 )+
            xlim(-11, 45)+ ylim(28, 65)+
  
  geom_map( data = VL_data, map = world_coordinates, aes(`X`, `Y`, map_id = COUNTRY,), 
            color = "black", fill = "salmon", linewidth = 0.3 )+
  
  geom_point(data = VL_data, aes(`X`, `Y`, group=YEAR, fill = YEAR), shape = 21, size=2, stroke = 0.3)+
  
  scale_fill_gradient2(low = "blue", mid = "white", high = "red",midpoint = 1990, 
                       space = "Lab", na.value = "grey50", guide = "colourbar", aesthetics = "fill")+
  
  theme(axis.title.x=element_blank(), axis.text.x=element_blank(),axis.ticks.x=element_blank(),
        axis.title.y=element_blank(), axis.text.y=element_blank(),axis.ticks.y=element_blank(),
        panel.background = element_rect(fill = "cornflowerblue"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())+
  
  # Titles
  annotate(geom = "label", x=4, y=64, label="Recorded Cases of Visceral Leishmaniasis",color="black", fill = "white", size = 6)+
  annotate(geom = "label", x=1.9, y=62, label="Source: Global database of leishmaniasis occurrence locations, 1960–2012",color="black", fill = "white", size = 3)

