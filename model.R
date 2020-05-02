library("tidyverse")
library("modelr")

md <- lm((price) ~ (carat), data = diamonds)

diamonds_df <- diamonds %>% add_residuals(model = md)
diamonds_df <- mutate(diamonds_df,ind = rownames(diamonds_df))

# suggest that as cut increase the price also increases
ggplot(data=diamonds_df) +
    geom_boxplot(mapping = aes(y= resid,x= cut , alpha=1/10))




