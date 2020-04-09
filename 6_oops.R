# OOPS
    # There are three system to work with classes   i.e. S3, S4, S6
    # using S3 to create classes
      my_list <- c(name="vishal",score = 0)
      class(my_list) <- "my_l"
      
      # constructor usage
      my_list_class <- function(name,score){
        val <- c(name= name,score =score)
        attr(val,"class") <- "my_list_class"
        val
      }
      my_list_class("vishal",100)
    
    # using S4 setClass uses `@` to access object  variables
      Agent <- setClass(
        # Set the name for the class
        "Agent",
        
        # Define the slots
        slots = c(
          location = "numeric",
          velocity   = "numeric",
          active   = "logical"
        ),
        
        # Set the default values for the slots. (optional)
        prototype=list(
          location = c(0.0,0.0),
          active   = TRUE,
          velocity = c(0.0,0.0)
        ),
        
        # Make a function that can test to see if the data is consistent.
        # This is not called if you have an initialize function defined!
        validity=function(object)
        {
          if(sum(object@velocity^2)>100.0) {
            return("The velocity level is out of bounds.")
          }
          return(TRUE)
        }
      )
      # create a method to assign the value of the location
      setGeneric(name="setLocation",
                 def=function(theObject,position)
                 {
                   standardGeneric("setLocation")
                 }
      )
      
      setMethod(f="setLocation",
                signature="Agent",
                definition=function(theObject,position)
                {
                  theObject@location <- position
                  validObject(theObject)
                  return(theObject)
                }
      )
      agent_obj <- Agent()
      agent_obj@velocity
      setLocation(agent_obj,c(1,2)) # calling the method of the class
      
      # creating dummy class
      dummy_class <- setClass("dummy",
                              slots=c(name="character"))
      
      # inheritance
      bob <- setClass("bob",
                      slots = c(name2= "character"),
                      contains = c("dummy","Agent"))
      
      bob(name2="sdf")  
      
    # using S4 (referenced based) uses `$` to access object variable
      mr_class <- setRefClass("my_ref_class",
                              fields = c(name="character",age="numeric"),
                              methods = c(
                                get_age = function() name
                              ))
      a <- mr_class(name = "sdf", age = 21)  # requires name of args also
      b <- a # it is not the copy but pointing to same reference
      b1 <- a$copy() # copying the object
      
      b1$age = 210
      b1$get_age()
      isS4(a)
      
      show(b1)
      
      
      # ------------------------------------------ not complete ----------------------
      # class can be created by adding class attribute to any object
    # there are 4 object .Generic, .Class, .Method and .Group used to dispatch correct function
    # `useMethod` and `NextMethod` 
