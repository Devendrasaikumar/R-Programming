#### Scatter Plot ####
library(readxl)
d=read_excel("D:/Sai/SaleData.xlsx")
d
x= d$Units
x
y= d$Unit_price
y
plot(x=x, y=y, main = "Scatter Plot", xlab = "X-axis label", ylab = "Y-axis label",pch=16, col = "Blue")
abline(model, col = "red")
#### Code Explination ####

#plot ---> use plot function define as a Scatter plot

#x=x ---> You Have to mention what is X

#y=y ---> You Have to mention what is y

#pch = 1 will use a solid circle.
#pch = 2 will use an open circle.
#pch = "+" will use plus signs.
#pch = "A" will use uppercase letter A.
#pch = "*" will use asterisks and so on.
#abline = Mention best fit line 