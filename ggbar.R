## Bar graph

A <- c(17, 32, 8, 53, 1)

barplot(A, xlab = "X-axis", ylab = "Y-axis", main ="Bar-Chart")

#------------------------------------------------------------------------
#------------------------------------------------------------------------

# Creating a horizontal bar chart

A <- c(17, 32, 8, 53, 1)

barplot(A, horiz = TRUE, xlab = "X-axis",
        ylab = "Y-axis", main ="Horizontal Bar Chart"
)

#------------------------------------------------------------------------
#------------------------------------------------------------------------



# To add the color in bar chart

A <- c(17, 2, 8, 13, 1, 22)
B <- c("Jan", "feb", "Mar", "Apr", "May", "Jun")

barplot(A, names.arg = B, xlab ="Month",
        ylab ="Articles", col ="green",
        main ="Sample")

#------------------------------------------------------------------------
#------------------------------------------------------------------------



# Changing Size of titles
A <- c(17, 2, 8, 13, 1, 22)
B <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun")

barplot(A, names.arg = B, xlab = "Month",
        ylab = "Articles", col = "green",
        main = "GeeksforGeeks - Article Chart",
        cex.main = 1.5, cex.lab = 1.2, cex.axis = 1.1)

#---------------(cex-->character expansion)----------------------------------

#---------------(cex.main--->Main Title Size)--------------------------------

#---------------(cex.lab--->X & Y Title Size)--------------------------------

#---------------(cex.axis--->Values in y Title Size)--------------------------------

#------------------------------------------------------------------------
#------------------------------------------------------------------------


# Adding Data Labels in ABove Graph

A <- c(17, 2, 8, 13, 1, 22)
B <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun")

barplot(A, names.arg = B, xlab = "Month",
        ylab = "Articles", col = "steelblue",
        main = "GeeksforGeeks - Article Chart",
        cex.main = 1.5, cex.lab = 1.2, cex.axis = 1.1)

# Add data labels on top of each bar
text(
  x = barplot(A, names.arg = B, col = "steelblue" , ylim = c(0, max(A) * 1.2)),
  y = A + 0.1, labels = A, pos = 3, cex = 1.2, col = "grey"
)

#---------------(text---> To add Something in Graph ggplot2 Function)----------------------------------

#---------------(ylim = c(0, max(A) * 1.2---> y axis limt)----------------------------------

#---------------(y = A + 0.1 ---> position of labels)----------------------------------

#------------------------------------------------------------------------
#------------------------------------------------------------------------


# Grouped bars

colors = c("green", "orange", "brown")
months <- c("Mar", "Apr", "May", "Jun", "Jul")
regions <- c("East", "West", "North")

# Create the matrix of the values.
Values <- matrix(c(2, 9, 3, 11, 9, 4, 8, 7, 3, 12, 5, 2, 8, 10, 11),
                 nrow = 3, ncol = 5, byrow = TRUE)
Values

# Create the bar chart
barplot(Values, main = "Total Revenue", names.arg = months,
        xlab = "Month", ylab = "Revenue",
        col = colors, beside = TRUE)

# Add the legend to the chart
legend("topleft", regions, cex = 0.7, fill = colors)


#----------------(beside = TRUE---> function to beside)-------------------

#------------------------------------------------------------------------
#------------------------------------------------------------------------

# Stacked bar charts
colors = c("green", "orange", "brown")
months <- c("Mar", "Apr", "May", "Jun", "Jul")
regions <- c("East", "West", "North")

# Create the matrix of the values.
Values <- matrix(c(2, 9, 3, 11, 9, 4, 8, 7, 3, 12, 5, 2, 8, 10, 11),
                 nrow = 3, ncol = 5, byrow = TRUE)

# Create the bar chart
barplot(Values, main = "Total Revenue", names.arg = months,
        xlab = "Month", ylab = "Revenue", col = colors)

# Add the legend to the chart
legend("topleft", regions, cex = 0.7, fill = colors)

























