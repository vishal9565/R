# check the enviroment variables present 
x <- 100
f1 <- function(x) {
    y = 100
    name = "vishal"
    function() {
        x + 10
    }
}
env_1 = environment(f1(x=100))

sapply(ls(env_1), function(x) get(x, envir = env_1))
