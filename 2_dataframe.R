# install.packages("htmlwidgets")
library("htmlwidgets")

# dataframe
    # is a list with data.frame class
    # converting matrix into data-frame
    y <- matrix(1:9,3,3)
    matrix_df <- data.frame(y)   
    
    data_df <- data.frame(names=c("vihsal","a","b"),age = c(22,2,4))
    data_df$names    

    # attach and detach and understand properly
    # It also addes it to search path so any variable name can be accessed directly
    y2 <- attach(matrix_df) # copy the dataframe and change will not cause change in the original dataframe
    
    y2$X1 <- c(10,20,30)
    X1
    detach("y2") # todo : why it is failing 
    
    
    attach(data_df,pos = 2,name="n") # todo : what is `name` argument ?
    detach("n")
    search()
    ls(2) # to get  contents of any position in search path
    
    
    
    

# String Operation --------------------------------------------------------

    # str_c , str_length,str_sort  and many more starts with str_
    str_sub("this is vishal",6,10)
    str_to_title("hell0, My name is khan",locale = "ja")    
        
    x <- c("apple", "banana", "pear")
    str_view(x, ".an.")
    str_view("a\\b", "\\\\" ) # bcz reugular expr is \\ and for escaping if writing in string format requires one \ for each \
    
    # match start and end of the string
    str_view(x, "^a")
    str_view(x, "a$")
    
    # TODO: what is \b
    str_view(x,"\bana\b")
    str_view(x,"\bapple\b")
    
    # patterns 14.3.4 at https://r4ds.had.co.nz/strings.html+
    # str_detect() whether word is present a location return  [T/F]
    str_subset # for select text which matchs the pattern
    
    str_extract # for extracting only that word
    
    
    str_replace("vishal","[i]",'.')
    str_split("vishal#kumar","#")


# environment variable search ---------------------------------------------

    apropos("search")    
    
    
    