# Sample data
x = c(1, 2, 3, 4, 5)
y = c(10, 15, 7, 20, 12)

# Plotting the line graph
plot(x,y, type = "o", col = "blue", xlab = "X-axis label", ylab = "Y-axis label", main = "Line Graph Example")

###### Code Explanation ######

#--->   x contains the x-axis values.

#--->   y contains the corresponding y-axis values.

#--->   plot() function is used to create the plot.

#--->   type = "l" specifies that it's a line graph.

#-->   col = "blue" sets the color of the line to blue.

#-->   xlab, ylab, and main are labels for the x-axis, y-axis, and the main title of the plot, respectively.


# Multiple Lines 

# Create the data for the chart.
v <- c(17, 25, 38, 13, 41)
t <- c(22, 19, 36, 19, 23)
m <- c(25, 14, 16, 34, 29)

# Plot the bar chart.
plot(v, type = "o", col = "red",
     xlab = "Month", ylab = "Article Written ",
     main = "Article Written chart")

lines(t, type = "o", col = "blue")
lines(m, type = "o", col = "green")


