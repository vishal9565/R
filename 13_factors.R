
library("forcats") # for categorical variables

# problems with the given array : 1) typos and 2) sort is not proper 

x1 <- c("Dec", "Apr", "Jam", "Mar") 

month_level = c(  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
x2 = factor(x1, levels = month_level)
x2 = parse_factor(x1,levels = month_level) # for getting warning
sort(x2)

# maintaining the order in the data
f1 <- factor(x1, levels = unique(x1))
f2 = fct_inorder(x1)
identical(f1,f2)

fct_reorder(x1, c(3,4,2,1))
fct_reorder(x1, c(3.2,4.2,2.2,1.2)) # put the ele of x according to weight in increasing order

# fct_recode(), fct_relevel, fct_collapse, fct_lump

