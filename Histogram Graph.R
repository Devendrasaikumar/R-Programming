### Histogram ###
library(readxl)
d=read_excel("D:/Sai/SaleData.xlsx")
d

f=d$Unit_price
f

hist(f,col=terrain.colors(4),xlab = "values")


#### Code Explination ####

# Check How many are there in your data set ( Frequency )

#hist --> USe function when ur plotting Histogram

#f ---> What you want to plot and what you want check

### Four Graphs in single Sheet ####


par(mfrow = c(2, 2), mar = c(4, 4, 2, 1)) 
# mar = c(bottom, left, top, right)
# par = Set Graphical Parameter
# mfrow = c(2, 2) --> Telling 4 graphs if kepp c(3,3)--> 6 graphs
hist(Data$ENGINE.SIZE,main = "ENGINE SIZE",col=terrain.colors(11))
hist(Data$CYLINDERS,main = "CYLINDERS",col=terrain.colors(11))
hist(Data$FUEL.CONSUMPTION,main = "FUEL CONSUMPTION",col=terrain.colors(11))
hist(Data$COEMISSIONS,main = "COEMISSIONS",col=terrain.colors(11))
