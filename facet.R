library(tidyverse)
library(ggplot2)
library(patchwork)


squirrel_subset <- read.csv('r_bridge/code/squirrels_subset.csv')

squirrel_subset <- squirrel_subset %>%
  mutate(date_f = as.Date.character(date, format = '%m%d%Y'))

#Horizontal
squirrel_subset %>%
  ggplot()+
  aes(x = long)+
  geom_histogram()+
  facet_wrap(vars(primary_fur_color))

# Vertical

squirrel_subset %>%
  ggplot()+
  aes(x = long)+
  geom_histogram()+
  facet_wrap(vars(primary_fur_color), ncol = 1)


squirrel_subset %>%
  ggplot()+
  aes(x = long, fill = primary_fur_color)+
  geom_histogram(position = 'dodge')

