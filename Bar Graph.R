###### Bar Graph #########

library(readxl)
d=read_excel("D:/Sai/SaleData.xlsx")
d
###### Pivot table #######
library(dplyr)
d1=d%>%group_by(Region)%>%summarise(sum_values=sum(Units))
d1
region=c("Central" ,"East", "West"  )
d1
obd=barplot(names.arg=region,d1$sum_values,col=terrain.colors(3),ylim=c(0,1200),main = "BAR GRAPH",xlab = "REGION",ylab ="SUM_UNITS")
obd

# Add text labels for each bar
text(x = obd, y = d1$sum_values+50, labels = d1$sum_values,col = "Red")


## Code Explination ##

# barplot --> Draw a bar graph use this function first

# d1$sum_values --> Calculated values (x)

# names.arg=region --> What we want to check (Y)

# col=terrain.colors(3) --> Its Taking random colours

# ylim=c(0,1300) ---> Length limit of Y-Axis

# main = "BAR GRAPH" --> Main Heading name

# xlab = "REGION" ---> X axis Heading name

# ylab ="SUM_UNITS" ---> Y axis Heading name

# text --> To use text labels to each bar graph

# x = obd --> Graph Variable name

# y = d1$sum_values+50  --> What u want see on a value in each bar (50)---> Distance 

# col = "Red" ---> What colour u want






















