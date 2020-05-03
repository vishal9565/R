library(tidyverse)

library(lubridate)
library(nycflights13)

today()
now()

# ways to create date
ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")

ymd_hms("2017-01-31 20:11:59")
mdy_hm("01/31/2017 08:01",tz = "UTC")

flights %>% 
    select(year, month, day, hour, minute) %>% 
    mutate(departure = make_datetime(year, month, day, hour, minute))

# yday(datetime), wday(datetime), mday()

Sys.timezone()


# Durations ---------------------------------------------------------------
    # represents in seconds
    dseconds(15)
    # > [1] "15s"
    dminutes(10)
    #> [1] "600s (~10 minutes)"
    dhours(c(12, 24))
    #> [1] "43200s (~12 hours)" "86400s (~1 days)"
    ddays(0:5)

    

# periods
    seconds(15)
    #> [1] "15S"
    minutes(10)
    #> [1] "10M 0S"
    hours(c(12, 24))
    #> [1] "12H 0M 0S" "24H 0M 0S"
    days(7)
    #> [1] "7d 0H 0M 0S"
    months(1:6)
    
    
# Intervals
    next_year <- today() + years(1)
    (today() %--% next_year) / ddays(1)
