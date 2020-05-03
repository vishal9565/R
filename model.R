library("tidyverse")
library("modelr")

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

