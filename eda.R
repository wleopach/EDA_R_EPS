###EDA

##VARIANCE
theme_set(theme_dark())
####BAR PLOTS FOR NOMINAL DATA
ggplot(diamonds) +
  aes(cut) +
  geom_bar()

###HISTOGRMAS FOR CONTINUOUS DATA
plot_x <-ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = x), binwidth = 0.5) +
  coord_cartesian(xlim = c(3, 10))

plot_y <-ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(xlim = c(3, 10))

plot_z <-ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = z), binwidth = 0.5) +
  coord_cartesian(xlim = c(2, 10))

  

plot_price1 <- ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price)) +
  coord_cartesian(xlim = c(1, 5000),
                  ylim = c(0,8000) )

plot_price2 <- ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price)) +
  xlim(1, 5000)+
  ylim(0,8000)

plot_price1|plot_price2

diamonds %>% 
  filter(carat == 0.99) %>%
  count()

#MISSING VALUES 
diamonds2 <- diamonds %>% 
  filter(between(y, 3, 20))

diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) + 
  geom_point(na.rm = TRUE)
# USE NA VALUES
nycflights13::flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>% 
  ggplot(mapping = aes(sched_dep_time)) + 
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)


#SUM MEAN
sum(nycflights13::flights$air_time, na.rm = TRUE) 

##COVARIANCE

#CONTINUOUS VARIABLE BROKEN DOWN BY CATEGORICAL VARIABLE
ggplot(data = diamonds, mapping = aes(x = price)) + 
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)

#density is the count standarized
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) + 
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)
  

#box plots

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

#order the trend
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))

#flip

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

library(ggstance)
ggplot(data = mpg, aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  geom_boxploth() 

library(lvplot)
p <- ggplot(diamonds, aes(cut, price))
p + geom_lv(aes(fill = after_stat(LV))) + scale_fill_brewer()


p1 <-ggplot(data = diamonds2)  +
  geom_violin(mapping = aes(x = cut , y = carat))+
  coord_flip()



p2 <-ggplot(data = diamonds2)  +
  aes(x = carat) +
  geom_histogram() +
  coord_flip()+
  facet_wrap(vars(cut), nrow = 4)

p3 <- ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) + 
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)

(p1/p2)/p3

ggplot(diamonds, aes(cut, price))+
  geom_jitter()

############## two categorical variables##################################

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

diamonds %>% 
  count(color, cut)

diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))


############### two continuous variables ###############################

#1D
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)


smaller <- diamonds %>% 
  filter(carat < 3)
#2D
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

install.packages("hexbin")
ggplot(data = smaller) +
  geom_hex(mapping = aes(x = carat, y = price))

#Bin the categorical variable, cut_width(x, width), as used above, divides 
#x into bins of width width
ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)), varwidth = TRUE)

ggplot(data = smaller, mapping = aes(x = price, y = carat)) + 
  geom_boxplot(mapping = aes(group = cut_width(price, 500)), varwidth = TRUE)

ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))


ggplot(data = smaller, mapping = aes(x = price, y = carat)) + 
  geom_boxplot(mapping = aes(group = cut_number(price, 20)))


## freqplot bining using cut width
ggplot(data = smaller, mapping = aes(x = price)) + 
  geom_freqpoly(mapping = aes(color = cut_width(carat, 0.1)))

## freqplot bining using cut number
ggplot(data = smaller, mapping = aes(x = price)) + 
  geom_freqpoly(mapping = aes(color = cut_number(carat, 20)))

ggplot(data = smaller, mapping = aes(x = carat)) + 
  geom_freqpoly(mapping = aes(color = cut_number(price, 20)))+
  facet_wrap(vars(cut))



ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)), varwidth = TRUE) +
  facet_wrap(vars(cut))



###PATERNS AND MODELS#########################################################

ggplot(data = faithful) + 
  geom_point(mapping = aes(x = eruptions, y = waiting))


library(modelr)

mod <- lm(log(price) ~ log(carat), data = diamonds)


diamonds2 <- diamonds %>% 
  add_residuals(mod) %>% 
  mutate(resid = exp(resid))


ggplot(data = diamonds2) + 
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = diamonds2) + 
  geom_boxplot(mapping = aes(x = cut, y = resid))
