### Group By #####


library(readxl)
d=read_excel("D:/Sai/SaleData.xlsx")
d
d_grouped <- group_by(d , Region)
d_grouped

#___
#d_grouped1 <- d %>% group_by(Region)
#d_grouped1
#mean_value <- d_grouped %>% summarise(mean_value = mean(Month))
#mean_value
#__


# Calculate mean value without using pipe operator
mean_value <- summarise(d_grouped, mean_value = mean(Month))
print(mean_value)

#__________________________________________________________________________


### Aggreagate Data ###

# create a dataframe with 4 columns 
data = data.frame(subjects=c("java", "python", "java", 
                             "java", "php", "php"), 
                  id=c(1, 2, 3, 4, 5, 6), 
                  names=c("manoj", "sai", "mounika", 
                          "durga", "deepika", "roshan"), 
                  marks=c(89, 89, 76, 89, 90, 67)) 
print(data) 

# aggregate sum of marks with subjects 
print(aggregate(data$marks, list(data$subjects), FUN=sum)) 

# aggregate minimum of marks with subjects 
print(aggregate(data$marks, list(data$subjects), FUN=min)) 

# aggregate maximum of marks with subjects 
print(aggregate(data$marks, list(data$subjects), FUN=max)) 

#____________________________________________________________________________



## Pivot Table ##


# create sample data frame 
sample_data <- data.frame(label=c('Geek1', 'Geek2', 'Geek3', 'Geek1', 
                                  'Geek2', 'Geek3', 'Geek1', 'Geek2', 
                                  'Geek3'), 
                          value=c(222, 18, 51, 52, 44, 19, 100, 98, 34)) 
sample_data
# load library dplyr 
library(dplyr) 

# create pivot table with sum of value as summary 
sample_data %>% group_by(label) %>% summarize(average_values = mean(value))



#___________________________________________________________________________