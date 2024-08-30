### PIE CHART ###

library("readxl")
d=read_excel("D:/Sai/SaleData.xlsx")
d
library(dplyr)
D1=d%>%group_by(Manager)%>%summarise(sum(Unit_price))
D1
Manager=c("Douglas" ,"Hermann", "Martha","Timothy"  )
Unit_price=c(4304,5953,9057,5669)
colours=c("Pink","Yellow","Red","Blue")

pie(D1$'sum(Unit_price)',names.arg=Manager ,labels =Unit_price,col = colours )


##### Access names ####
legend("topleft",Manager,fill =colours)


#### Explination of code ####

## First you have to combine what u wnat 

## Mention function PIE

## D1$'sum(Unit_price)' --> Showing what you want (X)

## names.arg=Manager --> what you want on (Y)

## labels =Unit_price ---> what labels you to see

## col = colours---> Combine colours first

## legend ---> Used to acces names

## "topleft" --> use this locations “bottomright”, “bottom”, “bottomleft”, “left”, “topleft”, “top”, “topright”, “right”, “center”

## Manager --> What names you want see keep their data name

## fill =colours --> colours fill



