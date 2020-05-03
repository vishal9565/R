?solve # for help




# create vector should contain element of the same data-type
x_vec <- c(1,2,3,4,4)

# create list having different data-type elements
x_list = list(1,"vishal",2)
x_list = list(fist_name = "vishal",experience=2,vec = x_vec,48)

# two ways of accessing list elements
x_list["vec"]
x_list$vec
attributes(x_list)$names # gives all the named element in the list

# use of table 
mynames <- c("Mary", "John", "Ann", "Sinead", "Joe", "Mary", "Jim", "John", "Simon")
tab <- table(mynames)

tab["Ann"]

# to search some function related to something
help.search("deviation") # ??deviation
RSiteSearch("normal")  # to search keyword on R site 

# create function
my_fun <- function(a,b){
  return(a+b)
}
my_fun(10,20)  


# todo: find out the difference between =,<-,<<-, ->, ->>
# <- and -> is assignment to the variables and hence assignment variable can be present on any side of the expression  
# = is an alternative to <-



# run a file
# source(file_name) 
# sink(file_name) # output directs to file
# sink() # output directs to console

#list all variables
ls()
objects
# remove the variable
rm("variables separated by commas")

# generate the sequence
1:20
seq(to=1,from = 0, length.out = 10 )
seq(along = x_vec)

# copy the object 
rep("object", times = 10)

# NA (Not available)
# NaN (Not a Number)

# indexing vectors
x <- 1:10
# logical true false selection in the form of arrays
  
  # x[TRUE,TRUE,FALSE] # won't  work
  x[c(TRUE,TRUE,FALSE)] # will  work
  y = x ==2
  x[y]
# vector of integer
  x[2:4] # positive number to select 
  x[4:1] # positive number indexing order is maintained
  x[-4:-2] # negative number to deselect

# vector of char string
  fruit <- c(5, 10, 1, 20)
  names(fruit) <- c("five","ten","one","twenty")
  fruit
  fruit[c("ten","five","four")]

# mode and length means same type in R also called intrinsic attributes
  mode(12)
  length(c(1,23))
  
  as.character(c(1,22))
  as.integer("123")

# initialisation
  i_vec <- numeric()
  c_vec <- character()  
  i_vec[2] =12 # initialised at particular index

# show all non- intrinsic attributes of object
  my_tab <- list(vishal=1,vishal2 = 2)
  attributes(my_tab)
  attr(my_tab,"vishal") # this can be used to change the attribute value

# class and unclass of object
  x <- data.frame(c(1,2,3))
  y <- unclass(x)

# get the unique elements in the list
  ?factor
  factor(c("B",1,2,3,4,1,2,3,4,4,3,2,1,"A"),ordered = TRUE)  

# Use of tapply
  state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",  "wa",  "wa",
             "qld", "vic", "nsw", "vic", "qld", "qld", "sa",  "tas",
             "sa",  "nt",  "wa",  "vic", "qld", "nsw", "nsw", "wa",
             "sa",  "act", "nsw", "vic", "vic", "act")
  stateof = factor(state)
  income =  c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
              61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
              59, 46, 58, 43)
  tapply(income, state, mean)
  ordered(state)

# array related concepts
  vec = 1:9
  # vectors are filled in column wise fashion whereas in python it is filled in rowwise fashion
  arr = array(vec,dim = c(3,3))
  arr[2,3] # 8
  arr[3,2] # 6
  arr[2,]  # 2, 5, 8
  dim(arr[2,])
  typeof(arr[2,])
  # if number of values in vec is less then it is recyled from the start
  arr2 <- array(vec,dim = c(4,4))
  
  # creating zeros and ones array of different shape
  arr3  <- array(0,dim = c(3,3))
  any_number = "A"
  arr3  <- array(any_number,dim = c(3,3))
  
  # element wise arithmetric operation
  arr* arr # will square each term

  1:3 * arr # vector is recyled
  1:4 * arr # vector should be smaller than the smallest unit of arr
  array(1:6,dim = c(2,3)) * arr # will fail because array is not recylable
  arr[-2]

# matrix
  x <- matrix(0,5,4)
  y <- matrix(0,5,6)
  ?aperm
  aperm(arr, 2:1) # by reversing the dimension vector
  t(arr)
  
  # MATRIX PRODUCT  
  x <- matrix(1:20,5,4)
  y <- matrix(21:40,5,4)
  x*y
  x%*%y # will fail because it can't multiply 5*4,5*4 
  x%*%t(y) # is possible 
  crossprod(y,x) # is same as t(y) %*% x and is slower than crossprod
  diag(x)
  
  # solving linear equation (eigen values and eigen vectors)
  A <- matrix(c(1,2,1,2),2,2)
  solve(A) # does not calculate pseudo-inverse of matrix
  A <- matrix(1:4,2,2) 
  solve(A) # same as inverse of A
  
  solve(A,c(1,2)) # solves the equation Ax = b
  
  x = c(1,2)
  x %*%  A^{-1} %*% x
  
  # eigen values and eigen vector calculation
  A <- matrix(1:9,3,3)
  eig = eigen(A)    
  eig$values  
  eig$vectors  
  lx = eig$values[1]*eig$vectors[,1]  
  crossprod(t(A),eig$vectors[,1])  

# rbind and cbind
  col_concat <- cbind(1:3, 4:6, 6:8)
  row_concat <- rbind(1:3, 4:6, 6:8)
  
 # list and dataframes
  # list
  lst <- list(name="Fred", wife="Mary", no.children=3,
              child.ages=c(4,7,9))
  
  lst[1]$name # normal subscripting and get all the attributes from parent related to this element
  lst[[1]] # atomic scripting so lst[[1]]$name will not work
  lst$na # can use unique substring to specify the given attribute
  
  

# vectors -----------------------------------------------------------------
  # every vector has two properties: typeof and length
  # 1) atomic vectors are homgenous
  # 2) list are heterogenous
  
  # numeric type
  c(typeof(1), typeof(1L))
  
  # Integer has only one special character
  c(NA)  # for integer
  # but double has 3 extra special character
  c(-1, 0, 1, NA) / 0
  
  # use hepler functio  to compare
  is.finite(1)
  is.infinite(Inf)
  is.na(NA)
  is.nan(NaN)

  
  x <- (sample(20, 100, replace = TRUE)  )
  y <- x > 10
  sum(y) # logical converted to integer
  if( length(y)) "vishal" # integer is converted to logical 
  

# helper function to check vectors ----------------------------------------

  # is_logical 
  # is_integer
  # is_double
  # is_numeric
  # is_character
  # is_atomic
  # is_list
  # is_vector

# 

# naming a vector ---------------------------------------------------------

  c(x = 1, y = 2, z = 4)
  purrr::set_names(1:3,c("a","b","c"))

#

# vector subsetting --------------------------------------------------------------

  x <- c(one= "one", "two", "three", "four", "five")
  x[c(3, 2,2, 5,)]  
  x[c(-1,-2)]
  x[] # whole vector
  x[c(0,0,0,1,1)==1] # logical subsetting

# list --------------------------------------------------------------------
  x12 <- list(a= 1, 2, 3,TRUE,1L,list("vishal"))
  
  # print structure  
  str(x12)
  

# list subsetting ---------------------------------------------------------

  a <- list(a = 1:3, b = "a string", c = pi, d = list(-1, -5))
  str(a[1:2])
  str(a[4])  
  # subsetting with logical same as vector subsetting
  a[["a"]]
  a$a  
  
# attributes
  attr(a,"name") <-"a list"
  attributes(a)
  
  # generic function
  methods("as.Date")
  getS3method("as.Date", "default") # will give the implementation  
  getS3method("as.Date", "numeric") # on the basis of what is passed as argument
  