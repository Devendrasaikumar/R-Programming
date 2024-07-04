###Importing CSV Data set###
d=read.csv("D:/Sai/BrentOilPrices.csv")
d

### Importing xlsx Data set ##### 
install.packages("readxl")

# Load the library into R work space.

library("readxl")
d=read_excel("D:/Sai/SaleData.xlsx")
d

#### Last 5 Rows ####
tail(d)

#### First 5 Rows only 7 rows ####
head(d,7)

#### Calculate Average ####
mean(d[,2]) /mean(d$price)

#### Calculate Minimum Price ####
min(d$Price)

#### Calculate Maximum Price ####
max(d[,2])

#### Calculate Median ####
median(d[,2])

#### Calculate Mode ####
mode(d[,2])

#### Only Access one row ####
(d$Price)

####change data into row ###
m=data.frame(r)
m
tail(r)
d

###Importing CSV Data set###
d=read.csv("D:/Sai/BrentOilPrices.csv")
d
duplicated(d)
f=unique(d$Price)
f
duplicated(f)

#################################################

library(readxl)
data1=read_excel("D:/Sai/Oil price 1.xlsx")
data1

data2=read_excel("D:/Sai/Oil price 2.xlsx")
data2

#### combine two rows ####
r=rbind(data1,data2)
r

head(r)
tail(r)

#########################################################
d=read_excel("D:/Sai/SaleData.xlsx")
d

##### Change categorical values to numeric values ########
d$Region<-c(East=1,Central=2,West=3)[d$Region]
d

#### Change numeric to Categorical values #####
d$Month=factor(d$Month,levels=1:12,labels=c("Jan","Feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"))
d


#### Doing sum Specific one in coloums data ####
library(readxl)
d=read_excel("D:/Sai/SaleData.xlsx")
d
print(sum(d$Region=='East'))
print(sum(d$Region=='Central'))
print(sum(d$Region=="West"))
print(sum(d$Item=="Television"))












