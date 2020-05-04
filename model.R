library("tidyverse")
library("modelr")
library(nycflights13)
library(lubridate) # for date utilities
library(gapminder) # for study of life expectancy data

# modeling -------------------------------------------------------------------
    md <- lm((price) ~ (carat), data = diamonds)
    
    diamonds_df <- diamonds %>% add_residuals(model = md)
    diamonds_df <- mutate(diamonds_df,ind = rownames(diamonds_df))
    
    # suggest that as cut increase the price also increases
    ggplot(data=diamonds_df) +
        geom_boxplot(mapping = aes(y= resid,x= cut , alpha=1/10))
    
    # Generalised linear models, e.g. stats::glm(). Linear models assume that the response is continuous and the error has a normal distribution. Generalised linear models extend linear models to include non-continuous responses (e.g. binary data or counts). They work by defining a distance metric based on the statistical idea of likelihood.
    
    # Generalised additive models, e.g. mgcv::gam(), extend generalised linear models to incorporate arbitrary smooth functions. That means you can write a formula like y ~ s(x) which becomes an equation like y = f(x) and let gam() estimate what that function is (subject to some smoothness constraints to make the problem tractable).
    # 
    # Penalised linear models, e.g. glmnet::glmnet(), add a penalty term to the distance that penalises complex models (as defined by the distance between the parameter vector and the origin). This tends to make models that generalise better to new datasets from the same population.
    # 
    # Robust linear models, e.g. MASS::rlm(), tweak the distance to downweight points that are very far away. This makes them less sensitive to the presence of outliers, at the cost of being not quite as good when there are no outliers.
    # 
    # Trees, e.g. rpart::rpart(), attack the problem in a completely different way than linear models. They  fit a piece-wise constant model, splitting the data into progressively smaller and smaller pieces. Trees aren’t terribly effective by themselves, but they are very powerful when used in aggregate by models like random forests (e.g. randomForest::randomForest()) or gradient boosting machines (e.g. xgboost::xgboost.)
    # 



# revise one more time the 24 and 25 chapter
    
    ggplot(diamonds, aes(cut, price)) + geom_boxplot()
    ggplot(diamonds, aes(color, price)) + geom_boxplot()
    ggplot(diamonds, aes(clarity, price)) + geom_boxplot()
    
    
    
    flight2 <- flights %>% 
        mutate(date = make_date(day = day, month = month, year = year)) %>%
        group_by(date) %>%
        summarise(n = n())
    
    ggplot(data = flight2, aes(x=date,y = n)) +
        geom_point()
    
    week_wise <- flight2 %>%
        mutate(week = wday(date,label = TRUE)) %>%
        group_by(week) %>%
        summarise(count = sum(n))
    
    
    ggplot(data = week_wise,aes(x=week, y= count)) +
        geom_point()
    
    wk_lm <- lm(count~ week,data =week_wise) 


# list column data structure ----------------------------------------------
    # usage of broom package for converting 
    
    # creating a nested dataframe by first grouping it and passing to nest    
    by_country <- gapminder %>% 
        group_by(country, continent) %>% 
        nest()
    typeof(by_country$data)
    
    # fitting the linear model    
    country_model <- function(df) {
        print(names(df))
        lm(lifeExp ~ year, data = df)
    }
    by_country <- by_country %>% 
        mutate(model = map(data,country_model)) # data column is called 
    
    # adding residual column 
    by_country <- by_country %>% 
        mutate(
            resids = map2(data, model, add_residuals)
            )
    
    # unnesting the dataframe wich creates the correspoding columns and values repeating in other
    unnest(by_country,resids)
    
    
    # storing list into the columns of the dataframe by using I()
    data.frame(x = list(1:3, 3:5))
    
    data.frame(
        x = I(list(1:3, 3:5)), 
        y = c("1, 2", "3, 4, 5")
    )
    # storing list into column can be done by any one of the three ways
    # 1) By use of nest as shown above
    
    # 2) by any vectorised function that returns a list

        df <- tribble(
            ~x1,
            "a,b,c", 
            "d,e,f,g"
            ) 
        
        df %>% 
            mutate(x2 = stringr::str_split(x1, ","))%>% 
            unnest()
    # 3) from multi-value summarises 
        mtcars %>% 
            group_by(cyl) %>% 
            summarise(q = list(quantile(mpg)))
    
    # creating from named list
        x <- list(
            a = 1:5,
            b = 3:4, 
            c = 5:6
        ) 
        
        df <- enframe(x)

    # search from broom library to make tidy data out of models