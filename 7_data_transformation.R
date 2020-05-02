library(nycflights13)
library(tidyverse)

1/49*49 ==1 | sqrt(2)^2 == 2 # because of approximation of 1/40 and sqrt(2)
near(1/49*49,1) & near(sqrt(2)^2,2)

# %>% act as a pipe
iris %>% head %>%  class

# dplyr basic usage
# ====================

# filter(), select() , mutate(), arrange(), summarise()  are the basic function
# group_by can be used with all of the above 

# filter(dataframe , conditon on column)
filter(flights, month == 2) 

is.na(NA)

NA*0


# arrange(dataframe , desc(col_name))
arrange(flights,desc(day))

# selecting a subset of columns from the tribble
select(flights,day)

# starts_with, ends_with, contains, matches, num_range can be used for getting columns which matches with something
select(flights, tailnum , ends_with("N"))

names(flights) # getting a list of column of tibbles
select(flights,-(1:3))

# everything() act as all other column name which are not identified in the select statement

rename(flights,tail_min = tailnum)

# mutate usage
select(mutate(flights,speed = distance / air_time * 60),speed)
# to get the new columns in the dataframe 
transmute(flights,speed = distance / air_time * 60)

"
mutate can be passed function which are vectorised and some are
arithematic operators, %/% ,%% for interger and mod division, 
log2, log10, log transformation
lag and lead 
logical comparsions:  < , > , <= , >= , == , !=

rank, min_rank, max_rank
rank gives the  index of the ordered array and if duplicates are found then median index
similarly if ties or duplicates are found the min, max index is used to break the tie

TODO: row_number, dense_rank, percent_rank, cume_dist, ntile
"
grp <- group_by(flights, year,month,add=TRUE)
grp %>%summarise(avg_dist = mean(distance))

group_map( grp,mean(distance))

df <- data.frame(Customer = c(1,1,1,1,2,2,2), Buy_date = c("2018", "2018", "2018", "2018", "2018", "2018", "2018"))
summarise(group_by(df, Buy_date),avg_cust = mean(Customer))


# in aggregation function, removing the nan values  is required so passing na.rm for removing
non_cancelled_flights <- filter(flights,!is.na(dep_delay), !is.na(arr_delay))
by_dest <- group_by(non_cancelled_flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)

# filter, mutate, ungroup 

# between usage in filters
diamonds2 <- diamonds %>% 
    filter(between(y, 3, 20))

# usage of ifelse in mutate
diamonds2 <- diamonds %>% 
    mutate(y = ifelse(y < 3 | y > 20, NA, y))

# for ordering the pairwise covariance plot for two categorical variable, use 
# d3heatmap or heatmaply packages


# joins -------------------------------------------------------------------
# joining if tables has different col_names 
flights %>% 
    left_join(airports, by= c("dest" = "faa"))


# Filtering joins : https://r4ds.had.co.nz/relational-data.html
semi_join(x, y)
anti_join(x, y) 

# comparing whole row by each variable
intersect(x, y)
union(x, y)
setdiff(x,y)
