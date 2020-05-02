library("tidyverse")
library("hexbin")
# The plot are being decided by geometrics objects (geom) being used. For example the below uses the point geoms

# adding aesthetic by attaching shape, size, color or alpha aesthetic to a partuclar columns
ggplot(data = mpg) +
    # geom_point(mapping = aes(x= displ,y=hwy,color = cty)) +
    geom_point(mapping = aes(x= displ,y=hwy,stroke = displ))  # it sets the size by the value of variable 
#    facet_wrap(~cty) + # make plots for each values of cty even if it is continuous
    # facet_grid(fl~class) + # grid based plot for each combination of values
    # facet_grid(.~class) # only columns are present and only one rows

# inserting some random noise to data so that we might get some insight of data
# adding aesthetic by attaching shape, size, color or alpha aesthetic to a partuclar columns
ggplot(data = mpg , mapping = aes(x= displ, y = hwy)) +
    geom_jitter()
    


# This uses line geoms object
# mapping given here is global. When local mapping given corresponding to geoms then local is being used
# This is true for all arguments for ggplot e.g. data
ggplot(data = mpg, mapping = aes(x= displ,y=hwy, color= drv)) + # mapping given here will be global
    # geom_point(mapping = aes(x= displ,y=hwy, color= drv) ) +
    geom_smooth(mapping = aes(x=displ, y = hwy, linetype = drv),show.legend = FALSE ) 


# plotting histogram, boxplot, linechart
ggplot(data = mpg, mapping = aes(x= displ,y=hwy, color= drv)) +
    # geom_boxplot()
    geom_bar(mapping = aes())

# ------------------------------------------------------------------------
diamonds # data available from tidyverse package
# selecting subcolumns of tibble
select(diamonds, cut , depth)

ggplot(data= diamonds) +
    geom_bar(mapping = aes(x = cut))

ggplot() +
    stat_count(mapping = aes(diamonds$cut))
# The above two graphs have the same ouput because for each geom there is default stat and vice-versa

cut_stat_count <- tribble(
    
    ~cut,         ~freq,
    "Fair",       1610,
    "Good",       4906,
    "Very Good",  12082,
    "Premium",    13791,
    "Ideal",      21551
)
# overriding the default stat
ggplot(cut_stat_count) + 
    geom_bar(mapping = aes(x = cut , y = freq), stat = "identity")
# overriding transformed variable to aesthetic
ggplot(data= diamonds) + 
    geom_bar(mapping = aes(x=cut,y = stat(prop), group = 1)) # todo: what is stat(prop)

# statistical transformation
ggplot(data = diamonds) + 
    stat_summary(
        mapping = aes(x = cut, y = depth),
        fun.min = min,
        fun.max = max,
        fun = median
    )
# above and below plots are similar
ggplot(data = diamonds) + 
    geom_pointrange(
        mapping = aes(x = cut, y = depth),
        stat = "summary",
        fun.min = min,
        fun.max = max,
        fun = median
    )

ggplot(data = diamonds) + 
    geom_col(
        mapping = aes(x = cut, y = depth)
    )
# get the comparison between geom_col and geom_bar
ggplot(data = diamonds) + 
    geom_bar(
        mapping = aes(x = depth)
    )

# todo: what is fomula represent and what is methods
ggplot(mpg) + 
    stat_smooth(mapping = aes(x=displ, y = hwy), formula = y ~ x, method = lm) # method = loess for polynomial fit


ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = stat(prop), group =1))
ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill =stat(prop), y = stat(prop), group =1))

# filling the colors corresponding to the count of each type of clarity
ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity))

# -----------------------------------------------------------------
# position can be any of the three identity, fill or dodge

# identity position makes it fall to place without stacking, so a lot of overlap is seen
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
    geom_bar(fill = NA, position = "identity")

# comparing proportion across each group
ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

# compare indivisual values
ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
# ---------------------------------------------------------------------
# exercise
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter(width = .4, height = .4) # adds a small noise to each datapoint


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_count()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy,fill = trans)) + 
    geom_boxplot() +
    coord_cartesian(ylim = c(0, 50))
# =================================================================================
"
Grammer of graphics for plotting  with ggplot
----------------------
ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(
     mapping = aes(<MAPPINGS>),
     stat = <STAT>, 
     position = <POSITION>
  ) +
  <COORDINATE_FUNCTION> +
  <FACET_FUNCTION>
"

# usage of count, tile plot
diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))


ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price),alpha=1/5)


# the above can be trickey for large dataset so we will add 2d bining
ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price))

install.packages("hexbin")
ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))


ggplot(data = diamonds, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 1))) # group = cut_number(carat, 20)





