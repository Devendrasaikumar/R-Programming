library(ggplot2)

df=data("iris")
df
# Basic Scatter Plot
P=ggplot(iris, aes(Sepal.Length, Petal.Length)) + geom_point()
P
#----------------- (geom_point() Represent a Scatter plot)--------------------------#

# Change the shape of points
ggplot(iris, aes(Sepal.Length, Petal.Length)) + geom_point(shape=1)

#----------------(geom_point(shape=1) Represent a shapes of data points they have 25 shapes)------------#


# Adding colors to that Points 
ggplot(iris, aes(Sepal.Length, Petal.Length, colour=Species))  + geom_point(shape=1)

#---------------((colour=Species) taking random colors)------------------------------# 

# Adding Manual colors
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +geom_point(shape = 25)+
    scale_color_manual(values = c("blue", "black", "red"))

#--------------(scale_color_manual(values = c("blue", "green", "red") Represent to add a Manual colors)----#

# Adding regression line
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point(shape = 0) +
  scale_color_manual(values = c("blue", "black", "red")) +
  geom_smooth(method = lm)

#-------------(geom_smooth(method = lm),Represented a Regression Line)--------------------------#

# Remove Shaded line
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point(shape = 0) +
  scale_color_manual(values = c("blue", "black", "red")) +
  geom_smooth(method = lm,se=FALSE)
#------------(geom_smooth(method = lm,se=FALSE) Represented to Remove a shaded line)------------#


# Adding a Theme 
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point(shape = 0) +
  scale_color_manual(values = c("blue", "black", "red")) +
  geom_smooth(method = lm,se=FALSE) +
  theme_minimal()

#----(theme_minimal() Represented a in built Theme they have Different types of themes)-----------#



# Define a Own theme
Sai_theme = function() {
  theme(
    # Set background color
    plot.background = element_rect(fill = "white"),
    
    # Set axis line color and thickness
    axis.line = element_line(color = "black", size = 1),
    
    # Set axis text size and color
    axis.text = element_text(size = 12, color = "black"),
    
    # Set axis title size and color
    axis.title = element_text(size = 14, color = "black"),
    
    # Set plot title size and color
    plot.title = element_text(size = 16, color = "grey"),
    
    # Remove gridlines
    #panel.grid.major = element_blank(),
    #panel.grid.minor = element_blank(),
    #theme(panel.grid.major = element_line(color = "red",linetype = "dotted")),
    
    # Set panel background color
    panel.background = element_rect(fill = "skyblue")
    
  )
}


# Apply the custom theme to a plot
p=ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point(shape = 0) +
  labs(title = "Scatter plot") +
  scale_color_manual(values = c("blue", "black", "red")) +
  #theme(panel.grid.major = element_line(color = "grey",linetype = "solid")) +
  geom_smooth(method = lm,se=FALSE) +
  Sai_theme()
library(plotly)
ggplotly(p)












 










