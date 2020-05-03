library(tidyverse)
# assigning the vector of size 0 ----------------------------------------------------
  y <- vector("double", 0)
  # seq_along is safer way to iterate
  seq_along(y)
  # than
  1:length(y)

  unlist(c(c(1),c(2)))
  x <- cbind(c(4,3),c(2,1))
  apply(x,1,sort) # Margin arg is not clear
  apply(x,2,sort)
  x[1,]  
  
  # purrr function is slightly faster because they are implemented in c
  
  map(c(1,23),function(x)x*10)
  # map_int, map_dbl, map_lgl, map_chr are type of result vector map function 
  
  
  models <- mtcars %>% 
    split(.$cyl) %>% 
    map(function(df) lm(mpg ~ wt, data = df))
  
  # shortcut way of writing map function and . is just the placeholder for the argument passed
  models <- mtcars %>% 
    split(.$cyl) %>% 
    map(~lm(mpg ~ wt, data = .)) # writing only right side of the function
  
  split(mtcars, mtcars$cyl)
  # lapply is same as map
  
  # safely function takes a function and gives its modified form having error, results
  safe_map <- safely(map)
  safe_map(c(1,2,3),~.*10)
  
  # for extra arguments for 2 extra args similarly map3 for 3 extra args
  map2(c(1,2,3), c(10,100,1000),function(x,y,n) x*y*n, n = 5) %>% str()
  
  purrr::pmap(list(c(1,2,3)),~.*10) # one for args list and other for function
  # invoke_map is calling different function with different arguments
  
  # walk and pwalk are same as map but they show side-effects 
  
  # reduce is same as that of python
  # accumulate function acumulate the result of reduce function
  
  # predicate function are function which returns either TRUE or FALSE e.g. is.factor
  # some is any and every is all in respect to python
  # detect and detect_index find the arg or index where predicate function is true
  
# function and control loops --------------------------------------------------------
# repeat statement
    count = 1
    repeat{
        if( count == 10){
            break
        }
        print(count)
        count = count + 1
    }
# for statement
    for ( i in 1:10){
        print(i)
    }
# while loop statement
    count = 1
    while(count < 10){
        print(count)
        count = count + 1
    }

    
# custom function
    inc <- function(i) i+1 # single line function
    inc(2)
    
    # return something after evaluating multileine statements
    inc2 <- function(i) {
        print(i)
        # write anything here or evaluate anything here
        i + 1 # this is return
    }
    inc2(2)    
    
    # return nothing
    inc3 <- function(i) {
        # print(i)
        # write anything here or evaluate anything here
        i = i + 1 # this is return
    }
    inc3(43)
    # moreover it follows the same naming convention as that of python in function args
    # like giving default args or giving named args etc
    
    # writing a recursive function and checking whether it is possible
    fact <- function(n){
        if (n > 1){
            fact(n-1) *n
        }else{
            1
        }
    }
    
    fact(3) # so recursive function is possible
    
    # extra argument to be passed as the 
    extra_arg_f <- function(i,...){
        print(n)
        fact(...)
    }
    extra_arg_f(1,n = 4)
    
    # todo: what and why is dimnames used?
    
    # lexcial scope and static scope
    cube <- function(n){ 
        sq = function() {n *n} 
        sq()*n
    }
    n=10
    cube(3)    
    
    # to illustrate that it is lexical language 
    x <- 100
    f1 <- function(x) {
        function() {
            x + 10
        }
    }
    f1(1)()
    
# Advanced functions
    # There are three parts of the function except the function which calls c code under the hood
    # 1) body
    # 2) formals i.e. arguments
    # 3) environement
    
    # todo : how to find whether a object is a function?
    
    # lexical scope and dynamic scope difference
    # if  a function has free variable then it binds to the corresponding environment so
    # free variable binding occurs at the place where function is defined (lexical scope/ R scope)
    # if the free variable of function is defined by the scope where it has been call (applied recursively)
    # is called dyanmic scope
    a=1
    b=2
    f<-function(x)
    {
      a*x + b # a and b corresponds to global scope a and b because function is defined at global scope
    }
    g<-function(x)
    {
      a=2
      b=1
      f(x)
    }
    g(2)
    
    # function and variable are different so a variable and function having same name is possible
    c <- 10 # variable
    c(c=c) 
    
    
    add <- function(x){
      function(y) x+y
    }
    adders <- lapply(c(1,100),add)
    adders[[1]](10)
    adders[[2]](10)s
    
# use profiling to optimize the code
    
  
# any(), all() , || , && , not vectorise operation 
# identical(), | , & ,== are common function and are vectorised operations
    
    # exception statements
    wt_mean <- function(x, w) {
      if (length(x) != length(w)) {
        stop("`x` and `w` must be the same length", call. = FALSE)
      }
      sum(w * x) / sum(w)
    }
    
# explicit returns------------------------------------------------------------
    complicated_function <- function(x, y, z) {
      if (length(x) == 0 || length(y) == 0) {
        return(0)
      }
    }


    # Writing pipeable functions by return invisibly the argument of the function so that 
    # it can be used in the pipe
    
    show_missings <- function(df) {
      n <- sum(is.na(df))
      cat("Missing values: ", n, "\n", sep = "")
      
      invisible(df)
    }
    # TODO: what is this?
    table(replicate(1000, 1 + 2))
    