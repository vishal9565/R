library(tidyverse)
library(nycflights13)
library(hms) # for custom string parsing for date time 
# vignette : use to render the package documentation
vignette("tibble")

# converting dataframe to tibble
as_tibble(diamonds)

# we can directly use the variable defined
tb <-tibble(
    x = 1:500, 
    y = 1, 
    z = x ^ 2 + y
)
# transpose tibble
tribble( 
    ~x, ~y, ~z,
    #--|--|----
    "a", 2, 3.6,
    "b", 1, 8.5
)

print(tb,n = 15, width = Inf)

read_csv("df.csv")
read_delim("df.csv",delim = ',')

read_csv("first 2 line I want to skip
    hi vishal
    # A comment I want to skip
    x,y,z,NA
    1,na,3,", comment = "#",skip =2, col_names =FALSE,na=c("", "NA","na"))

read_csv(readr_example("challenge.csv",
      col_types = cols(
    x = col_double(),
    y = col_date()
))) # for challenging files


parse_logical(c("TRUE","FALSE","NA","."),na=c('.',"NA"))
in_arr <- parse_integer(c("1","2","1.2"))
in_arr[3]
problems(in_arr)

parse_date(c("2010-01-01", "1979-10-14")) # parse_date(), and parse_time()

parse_number(c("$100","10%","It cost $123.45"))

# for parsing different encodings
parse_character("\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd", locale = locale(encoding = "Shift-JIS"))

# parsing from a predefined list and error if unexpected happened
fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)

pivot_longer(table4a , c(`1999`, `2000`), names_to = "year", values_to = "cases")
# pivot_wider_spec()

# separates the column into 2 or more and converting its datatype if possible
separate(table3,rate, into = c("cases", "population"), sep = "/",convert = TRUE)
separate(table3,year, into = c("century", "year"), sep = 1) # 2 means first 2 str and -2 means last 2
separate(table3,year, into = c("century", "year"), sep = -2) # 2 means first 2 str and -2 means last 2

unite(table5, new, century, year,sep = "*")
