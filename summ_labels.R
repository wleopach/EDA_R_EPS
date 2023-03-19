library(tidyverse)
library(ggplot2)
library(patchwork)
library(ggthemes)
theme_set(theme_dark())


squirrel_subset <- readr::read_csv('r_bridge/code/squirrels_subset.csv')
squirrel_subset <- filter(squirrel_subset, !is.na(primary_fur_color))

squirrel_subset <- squirrel_subset %>%
  mutate(date_f = as.Date.character(date, format = '%m%d%Y'))

squirrel_subset_by_color <- squirrel_subset %>%
  group_by(date_f, primary_fur_color) %>%
  summarise(count_of_squirrels = n())
  
#coord cartesian

ss_plot_coord_cartesian <- squirrel_subset_by_color %>%
  ggplot() +
  aes(x = date_f, y = count_of_squirrels, color = primary_fur_color ) +
  #geom_line() +
  stat_smooth(span = 0.8, se = FALSE) +
  labs(
    title = 'Decreasing Count of squirrels Through Time',
    subtitle = 'Moving average smoother estimate',
    x = 'Date of Observation',
    y = 'Count of Squirrels',
    color = 'Primary Fur Color'
  ) +
  coord_cartesian(
    xlim = c(as.Date.character('2018-10-08'),
             as.Date.character('2018-10-15')),
    ylim = c(-10, 110)
  )

#lims
ss_plot_lims <- squirrel_subset_by_color %>%
  ggplot() +
  aes(x = date_f, y = count_of_squirrels, color = primary_fur_color ) +
  #geom_line() +
  stat_smooth(span = 0.8, se = FALSE) +
  labs(
    title = 'Decreasing Count of squirrels Through Time',
    subtitle = 'Moving average smoother estimate',
    x = 'Date of Observation',
    y = 'Count of Squirrels',
    color = 'Primary Fur Color'
  ) +
  lims(
    x = c(as.Date.character('2018-10-08'),
             as.Date.character('2018-10-15')),
    y = c(-10, 110),
  )

#ORIGINAL PLOT
ss_original <-squirrel_subset_by_color %>%
  ggplot() +
  aes(x = date_f, y = count_of_squirrels, color = primary_fur_color ) +
  #geom_line() +
  stat_smooth(span = 0.8, se = FALSE) +
  labs(
    title = 'Decreasing Count of squirrels Through Time',
    subtitle = 'Moving average smoother estimate',
    x = 'Date of Observation',
    y = 'Count of Squirrels',
    color = 'Primary Fur Color'
  ) 

#(ss_plot_coord_cartesian|ss_plot_lims) /ss_original

ss_original 