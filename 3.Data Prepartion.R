## Data Preparation ##

## Handling missing Values 
# vector with some data
f = c(NA, "TP", 4, 6.7, 'c', NA, 12)
f
df_clean = na.omit(f)
df_clean

## na.omit uses to check the rows

### Replace NA values with any number 
replace(myVector,is.na(myVector),0)



## example data set
data = data.frame(
  A = c(1, NA, 3, NA, 5),
  B = c(NA, 2, NA, 4, NA),
  C = c(1, 2, 3, NA, NA)
)
data
replace(data,is.na(data),3)


#-------------------------------------------------------------------------------#

## Handling Duplicates

# Creating a sample data frame of students
# and their marks in respective subjects.
student_result=data.frame(name=c("Ram","Geeta","John","Paul",
                                 "Cassie","Geeta","Paul"),
                          maths=c(7,8,8,9,10,8,9),
                          science=c(5,7,6,8,9,7,8),
                          history=c(7,7,7,7,7,7,7))

student_result
duplicated(student_result)
sum(duplicated(student_result))
unique(student_result)
## distinct and unique both are same in R ##
library(dplyr)
distinct(student_result)
#-------------------------------------------------------------------------------#


## Data Formatting   

x = 123456.789
formatted_number = format(x, big.mark=",", scientific=FALSE)
print(formatted_number)

text = "hello"
formatted_text = format(text, width=10, justify="left")
print(formatted_text)

factor_vector = factor(c("A", "B", "C", "A", "B"))
factor_vector
formatted_factor = format(factor_vector)
print(formatted_factor)

# Create a Date object
date = as.Date("2024-05-28")
formatted_date = format(date, "%A, %B %d, %Y")
formatted_date

#%A: Represents the full name of the weekday (e.g., "Monday", "Tuesday").
#%B: Represents the full name of the month (e.g., "January", "February").
#%d: Represents the day of the month as a zero-padded decimal number (e.g., "01", "02", ..., "31").
#%Y: Represents the year as a four-digit number (e.g., "2022", "2023", ...).


#-----------------------------------------------------------------------------------

## Data Normalization ##

# 1. Min - Max 


data = data.frame(
  x1 = c(10, 20, 30, 40),
  x2 = c(0.1, 0.2, 0.3, 0.4),
  x3 = c(100, 200, 300, 400)
)
data
# Min-max normalization function
min_max_normalize = function(x) {
  (x - min(x)) / (max(x) - min(x))
}
min_max_normalize
# Apply min-max normalization to each column
normalized_data = as.data.frame(lapply(data, min_max_normalize))
print(normalized_data)



# 2. Z-Score



data = data.frame(
  x1 = c(10, 20, 30, 40),
  x2 = c(0.1, 0.2, 0.3, 0.4),
  x3 = c(100, 200, 300, 400)
)
data
# Z-score normalization function
z_score_normalize = function(x) {
  (x - mean(x)) / sd(x)
}
z_score_normalize
# Apply Z-score normalization to each column
normalized_data = as.data.frame(lapply(data, z_score_normalize))
print(normalized_data)


# Decimal Scaller

data = data.frame(
  x1 = c(10, 20, 30, 40),
  x2 = c(0.1, 0.2, 0.3, 0.4),
  x3 = c(100, 200, 300, 400)
)
data
# Decimal scaling normalization function
decimal_scaling_normalize <- function(x) {
  max_abs <- max(abs(x))
  }
decimal_scaling_normalize

# Apply Decimal scaling normalization to each column
normalized_data <- as.data.frame(lapply(data, decimal_scaling_normalize))
print(normalized_data)

#----------------------------------------------------------------------------------




