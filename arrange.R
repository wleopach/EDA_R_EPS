library(tidyverse)

agencies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/agencies.csv')
launches <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/launches.csv')

#ORDER BY A COLUMN IN ASCENDING ORDER
agencies %>% 
  arrange(state_code) %>%
  View()

#ORDER BY A COLUMN IN DESSCENDING ORDER
agencies %>% 
  arrange(desc(state_code)) %>%
  View()

