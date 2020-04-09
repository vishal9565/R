vec = c(1:10,1:100,1:10,1:10,50:100 +.5)

# fivenum 
hist(vec,probability = TRUE)
lines(density(vec,bw=.5))
rug(vec) # shows the data point
plot(ecdf(vec))

