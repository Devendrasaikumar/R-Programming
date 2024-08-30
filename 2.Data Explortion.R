
#------------------------------------------------------------------------#

# Importing Data Sets

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

#-------------------------------------------------------------------------#

# create a data frame
data = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, NA, 5))



#--------------------------------------------------------------------------#

### Data Manipulation using DPYLR package 
library(dplyr)

## Filter 

# We can take the subset of the data with the help of giving any Condition
# Syntax 
# filter(dataframeName, condition)

## Example

# create a data frame
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, NA, 5))

# fetch players who scored more 
# than 100 runs
filter(stats, runs>100)

# filter()---> Function name
# stats---> Data name
# runs>100---> Condition


#--------------------------------------------------------------------------------

# distinct()

# It remove Duplicated Rows in data
# Synatx
# distinct(dataframeName, col1, col2,.., .keep_all=TRUE)

# Example

# create a data frame
stats = data.frame(player=c('A', 'B', 'C', 'D', 'A', 'A'),
                    runs=c(100, 200, 408, 19, 56, 100),
                    wickets=c(17, 20, NA, 5, 2, 17))

stats
# removes duplicate rows
distinct(stats)

#remove duplicates based on a column
distinct(stats, player, .keep_all = TRUE)

#-------------------------------------------------------------------------------

# arrange()

# It can arrange low to high use coloumn name 
# Syntax
# arrange(dataframeName, columnName)

# Example

# # create a data frame 
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, NA, 5))
stats

# ordered data based on runs
arrange(stats, runs)

#-------------------------------------------------------------------------------

# Select()

# Accessing the columns
# Syntax
# select(dataframeName, col1,col2,…)

# Example

# create a data frame 
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, NA, 5))
stats
# fetch required column data
select(stats, player,wickets)

#-------------------------------------------------------------------------------

# Rename()

# Changing the Columns Names
# syntax
# rename(dataframeName, newName=oldName)

# Example 

# create a data frame 
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, NA, 5))
stats
# renaming the column
rename(stats, runs_scored=runs)

#-------------------------------------------------------------------------------

# Mutate()
# Create new variables without dropping old Variables
# syntax
# mutate(dataframeName, newVariable=formula)

# Example

# create a data frame 
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, 7, 5))
stats
# add new column avg
mutate(stats, avg=runs/4)

#-------------------------------------------------------------------------------

# Transmute()
# Create new variables and dropping old Variables
# syntax
# transmute(dataframeName, newVariable=formula)

# Example

# create a data frame 
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, 7, 5))
stats
# # drop all and create a new column
transmute(stats, avg=runs/4)

#-------------------------------------------------------------------------------

# Summarize()

# It Shows everything about the data set
# Syntax
# summarize(dataframeName, aggregate_function(columnName))

# Example

# create a data frame 
stats = data.frame(player=c('A', 'B', 'C', 'D'),
                    runs=c(100, 200, 408, 19),
                    wickets=c(17, 20, 7, 5))
stats
# summarize method
summarize(stats, sum(runs), mean(runs))

#-------------------------------------------------------------------------------



# END ______










