#### Box Plot ####

#### Install GG PLOT2 ##### 
install.packages("ggplot2")
library(ggplot2)
at = ggplot2::mpg
at

d1=at$hwy
d1
boxplot(d1, main = "Box Plot", ylab = "Values", col = "lightgreen", border = "black")


####### Remove Outliers #####


#### Showing Outliers what are they ####
boxplot.stats(at$hwy)$out
out=c(44,44,41)
#### Finding Row Number ####
out_1 = which(at$hwy %in% c(out))
out_1

### print that rows data ####
at[out_1,]

## Remove outliers row  from original data and plot graph ###
at_1=at[-c(213, 222 ,223), ]
at_1
boxplot(at_1$hwy)







