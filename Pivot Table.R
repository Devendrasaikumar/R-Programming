#Pivot table

library(readxl)
d=read_excel("D:/Sai/SaleData.xlsx")
d

#### Syntax ####

library(dplyr)
d%>%group_by(Item)%>%summarise(sum(Unit_price))

#### Expliation code ####

# d--> Data variable name

# %>% ---> Allows us to link a sequence of analysis steps

# group_by(Item) ---> What u what to check first did group and give data (Item)

# summarise ---> Mandoratory to have (calculate)

# sum  ---> Sum to add

#{unit_price}---> what u want to calculate

