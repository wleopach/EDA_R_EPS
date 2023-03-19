library(tidyverse)
library(ggplot2)
theme_set(theme_minimal())
knitr::opts_chunk$set(dpi = 200)
squirrel_subset <- read.csv('r_bridge/code/squirrels_subset.csv')

squirrel_subset <- squirrel_subset %>%
   mutate(date_f = as.Date.character(date, format = '%m%d%Y'))

#Groupby 

squirrel_subset %>%
  group_by(date_f) %>%
  summarise(count_of_squirrels = n() ) %>%
  ggplot()+
  aes(x = date_f, y = count_of_squirrels)+
  geom_line()+
  theme(panel.grid.major = element_line(color = "blue",
                                        size = 0.1,
                                        linetype = 2))

squirrel_subset %>%
  group_by(date_f, primary_fur_color) %>%
  summarise(count_of_squirrels = n() ) %>%
  ggplot()+
  aes(x = date_f, y = count_of_squirrels, color = primary_fur_color)+
  geom_line()+
  theme(panel.grid.major = element_line(color = "blue",
                                        size = 0.1,
                                        linetype = 2))

  



ggplot(squirrel_subset)+
  aes(x = long, y = lat, color = primary_fur_color)+
  coord_quickmap()+
  geom_point()
