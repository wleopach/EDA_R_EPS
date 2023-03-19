library(tidyverse)
library(ggplot2)

#scater plots
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#with color per class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#with size per class
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
#> Warning: Using size for a discrete variable is not advised.

# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# Split the plot inti facets
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#facet the plot on the combination of two varibles
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

#adding some backgraound theme
p <- ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

p + theme(
  panel.background = element_rect(fill = "#BFD5E3", colour = "#6D9EC1",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white")
)

#stroke 1
ggplot(data = mpg) + 
  +     geom_point(mapping = aes(x = displ, y = hwy, stroke = 1, color= class))

# validate logic relation to chose the color
ggplot(data = mpg) + 
  +     geom_point(mapping = aes(x = displ, y = hwy, stroke = 1, color= displ<3))



#Smooth
ggplot(data = mpg) + 
  +     geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))