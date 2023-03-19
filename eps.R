library(ggplot2)
library(tidyverse)
library(patchwork)
#install.packages("lvplot")
library(lvplot)
theme_set(theme_dark())
nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(cancelled, sched_dep_time)) +
  geom_lv() +
  coord_flip()
  

diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))
###Reading data from csv
eps <- read_csv('r_bridge/plots/eps.csv')

###Histogram of variable Cantidad
ggplot(eps) +
  geom_histogram(mapping = aes(x = Cantidad), binwidth = 2)+
  coord_cartesian(
    xlim = c(0,1000),
    ylim = c(0,1500)
  )

######FREQPOLY CANDITDAD VS DEPARTAMENTO
p1<-ggplot(data = eps, mapping = aes(x = Cantidad, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour = Departamento), binwidth = 100) +
  coord_cartesian(
    xlim = c(0,1000),
    ylim = c(0,0.01)
  )

######FREQPOLY CANDITDAD VS NOMBRE
p2<-ggplot(data = eps, mapping = aes(x = Cantidad, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour = Nombre), binwidth = 100) +
  coord_cartesian(
    xlim = c(0,1000),
    ylim = c(0,0.01)
  )

p1/p2

#####HEATMAP NOMBRE VS DEPARTAMENTO
p3 <- eps %>% 
  count(Nombre, Departamento) %>%  
  ggplot(mapping = aes(x = Nombre, y = Departamento)) +
  geom_tile(mapping = aes(fill = n))

p3+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))