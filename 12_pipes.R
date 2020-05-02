library("magrittr")
# Functions that use the current environment
assign("x", 10)
x
"x" %>% assign(100) # creates local variable in its environment
x

env <- environment()
"x" %>% assign(100, envir = env) # will work
x


# pipe does not work where function is lazy evaluation because pipe enforces to compute everything
tryCatch(stop("!"), error = function(e) "An error")
#> [1] "An error"

stop("!") %>% 
    tryCatch

# It returns left hand side value and also gives the side-effect
rnorm(100) %>%
    matrix(ncol = 2) %T>% # in this case matrix is passed to plot which is left of %T% and side-effect is enforced
    plot() %>%
    str()

# %$% explode every items into variable
mtcars %$%
    cor(disp, mpg)

# assignment to mtcars for the results of the given pipe
mtcars %<>% transform(cyl = cyl * 2)



