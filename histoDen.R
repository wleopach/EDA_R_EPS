library(tidyverse)
library(ggplot2)
library(patchwork)


squirrel_subset <- read_csv('r_bridge/code/squirrels_subset.csv')


squirrel_scatter <-squirrel_subset %>%
  ggplot() +
  aes(x = long, y = lat) +
  geom_point()



squirrel_long_histogram <- squirrel_subset %>%
  ggplot() +
  aes(x = long, color= age) +
  geom_histogram()


squirrel_long_density <- squirrel_subset %>%
  ggplot() +
  aes(x = long, color= age) +
  geom_density()

squirrel_scatter / squirrel_long_histogram / squirrel_long_density

