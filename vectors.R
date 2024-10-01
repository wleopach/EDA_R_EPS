library(tidyverse)

######Type of a vector
typeof(letters)

typeof(1:10)

x<-list("a", 2:5)

typeof(x)

length(x)

length(letters)

#######     LOGICAL 

1:10 %% 3==0

c(TRUE, TRUE, FALSE, NA)


#######       NUMERIC

typeof(1)

typeof(1L)


######        SPECIAL VALUES NA INT , DOUBLES HAVE FOUR

c(-1, 0, 1) / 0


######      Character

x <- "This is a reasonably long string."
pryr::object_size(x)
#> 152 B
x <- "This is a reasonably long string."
pryr::object_size(x)

y <- rep(x, 1000)
pryr::object_size(y)

####ROUNDING

tibble(
  x = c(1.8, 1.5, 1.2, 0.8, 0.5, 0.2, 
        -0.2, -0.5, -0.8, -1.2, -1.5, -1.8),
  `Round down` = floor(x),
  `Round up` = ceiling(x),
  `Round towards zero` = trunc(x),
  `Nearest, round half to even` = round(x)
) 


##### PARSING


parse_logical(c("TRUE", "FALSE", "1", "0", "true", "t", "NA"))


parse_integer(c("1235", "0134", "NA"))