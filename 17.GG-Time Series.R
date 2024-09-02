# load library ggplot2 
library(ggplot2) 
library(readxl)
df=read_excel("D:/Sai/Oil price 1.xlsx")
df
head(df)
tail(df)

# time Series plot

# create plot 
ggplot(df, aes(x=Date, y=Price, group = 1)) + 
  geom_line()+

    # check.overlap avoids label overlapping 
  scale_x_datetime(guide = guide_axis(check.overlap = TRUE))

#-----------------------------------------------------------------------
#-----------------------------------------------------------------------

# Change X date label 
ggplot(df, aes(x=Date, y=Price, group = 1)) + 
  geom_line()+
  
# check.overlap avoids label overlapping 
scale_x_datetime(date_labels = "%B",guide = guide_axis(check.overlap = TRUE))

#Identifiers	Explanation	               Example
#%d	          day as a number	              21
#%a	          short-form weekday	          Mon
#%A	          long-form weekday	            Monday
#%m	          month as number             	10
#%b	          short-form month            	Oct
#%B	          long-form month	              October
#%y	          2 digit year	                21
#%Y	          4 digit year                	2021

#---------------(Above Showing a Examples and identifiers we can use this according to req)->

#-----------------------------------------------------------------------
#-----------------------------------------------------------------------


#Breaks and Minor breaks

# Helps us to see what happens in month wise are week wise like that

ggplot(df, aes(x=Date, y=Price, group = 1)) + 
  geom_line()+ 
  
  # check.overlap avoids label overlapping 
  scale_x_datetime(date_labels = "%b",date_breaks = "1 month",
                  guide = guide_axis(check.overlap = TRUE))
  
#------------------------------((date_breaks = "1 month")--> Function)---------------------- 

#-----------------------------------------------------------------------
#-----------------------------------------------------------------------


#Limit Axis Data


# Convert 'Date' column to Date format
df$Date <- as.Date(df$Date)

# Plot the time series graph
ggplot(df, aes(x = Date, y = Price)) + 
  geom_line() + 
  xlim(as.Date("1987-05-20"), as.Date("1988-06-20"))

#--------(First we can do convert Date column to date formar)------------------------

#--------(xlim(as.Date("1987-05-20"), as.Date("1988-06-20"))---to show only this year data graph)--
