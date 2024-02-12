library(dplyr)
library(ggplot2)
library(tidyr)


VL_data <- read.csv("Data/VL_final_dataset.csv")
country_list <- read.csv("Data/country_list.csv")

VL_by_country <- VL_data %>% mutate(tally = 1)  %>% group_by(YEAR, COUNTRY) %>% summarise(TOTAL = sum(tally))


VL_by_continent <- merge(x=VL_data,y=country_list, by="COUNTRY", all.x=TRUE)%>%
                   mutate(tally = 1)%>% 
                   group_by(YEAR, CONTINENT) %>% 
                   summarise(TOTAL = sum(tally))



VL_annual_table <- pivot_wider(test_2, names_from = CONTINENT, values_from = TOTAL, values_fill = 0)


ggplot()+
  geom_line(data = VL_by_continent, aes(x = YEAR, y = TOTAL, group = CONTINENT, color = CONTINENT), size = 1.1)+
  ylab("Number of occurences")+
  xlab("Year")+
  theme_classic()+
  theme(axis.text.x = element_text(size = 12, angle = 45, hjust= 1), 
        axis.title.x = element_text(size = 12, hjust = 0.5, vjust = -3),
        axis.text.y = element_text(size = 12), 
        axis.title.y = element_text(size = 12, hjust = 0.5, vjust = 5),
        legend.title = element_blank())+
  theme(plot.margin = unit(c(0.5, 0.5, 0.5, 0.5),"inches")) +
  scale_x_continuous(limits = c(1960,2012), breaks = seq(1960,2012,3))+
  scale_y_continuous(limits = c(0,150), breaks = seq(0,150,20))
