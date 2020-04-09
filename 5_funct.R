# function and control loops
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
    