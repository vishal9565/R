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
    
    
    
    
    
    
    
    
    
    
    