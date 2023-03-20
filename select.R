library(tidyverse)

agencies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/agencies.csv')
launches <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/launches.csv')


launches %>%
  select(launch_year, agency, agency_type) %>%
  filter(launch_year > 1968 & launch_year < 1972) %>%
  arrange(desc(launch_year)) %>%
  view()

## any column that contains 
launches %>%
  select(contains('agency'), contains('launch')) %>%
  view()

