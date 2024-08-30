## GG Histogram 

set.seed(123)
df = data.frame(
  gender=factor(rep(c(
    "Average Female income ", "Average Male income"), each=20000)),
  Average_income=round(c(rnorm(20000, mean=15500, sd=500), 
                         rnorm(20000, mean=17500, sd=600))) 
) 
df
head(df)
tail(df)
max(df$Average_income)
min(df$Average_income)



library(ggplot2)
# Basic histogram
ggplot(df, aes(x=Average_income)) + geom_histogram()

#---------(df--> Data)--------------------------#
#---------(aes(x=Average_income))---> What you want show)------------#
#---------(geom_histogram()---> In built function for Histogram)---------------#


# Keeping colors
ggplot(df, aes(x=Average_income)) + 
  geom_histogram(color ="black",fill="gold")


# Adding Titles 
ggplot(df, aes(x=Average_income)) + 
  geom_histogram(color ="black",fill="red")+
  labs(x="Average income",y="Frequency")+
  ggtitle("Histogram of Average income")

#--------(labs function we used change the titles for only X and Y)---------------#
#--------(ggtitle function we used change the Main titles )-----------------#


# Changing width of the graph
ggplot(df, aes(x=Average_income)) + 
  geom_histogram(color ="blue",binwidth = 1)+
  labs(x="Average income",y="Frequency")+
  ggtitle("Histogram of Average income")

#---------------------------------------------------------------------------------
#---------------------------------------------------------------------------------  

# We can use Advanced Levels Now 

# Adding Descriptive Statistics

histogram_plot <- ggplot(df, aes(x = Average_income, fill = gender)) +
  geom_histogram(binwidth = 500, position = "identity", alpha = 0.7) +
  

#---- (We can change Post ion Using this 4 functions)-----------------#  
  
# "stack" (default): This stacks the bars on top of each other.

# "dodge": This places the bars side by side for each group.

# "fill": This stacks the bars, but normalizes each stack to have the same height, making it easier to compare distributions.

# "identity": This positions the bars directly according to their x-values without any adjustment.
  
#----(alpha=0.7)-->(Transparency of Histogram)---#
  



# Add vertical lines for mean and median
  geom_vline(aes(xintercept = mean(Average_income, na.rm = TRUE), color = gender),
             linetype = "dashed", size = 1) +
  geom_vline(aes(xintercept = median(Average_income, na.rm = TRUE), color = gender),
             linetype = "dotted", size = 1) +
  
  
#--------(Xintercept =  mean(Average_income, na.rm = TRUE)--> Where line we want)-------------------#
  
  
# Customize color and theme
  scale_fill_manual(values = c("gold", "navy")) +
  scale_color_manual(values = c("red", "tomato")) +
  
# Add titles and labels
  ggtitle("Distribution of Average Income by Gender") +
  xlab("Average Income") +
  ylab("Frequency") +
  
# Adjust legend position
  theme(legend.position = "top")

print(histogram_plot)

#--------------------------------------------------------------------------------
#--------------------------------------------------------------------------------

# Plotting Normal Distribution of Graph (Density)

# Assuming 'price' is the column in home_data
ggplot(df, aes(x = Average_income, y = after_stat(density))) +
  
  
  ##Creating bars 
  geom_histogram(aes(y = after_stat(density)), bins = 30, fill = "gold", 
                 color = "navy", alpha = 0.7) +
  
  
  ## Creating Mean Line
  geom_vline(aes(xintercept = mean(Average_income, na.rm = TRUE)), color = "red", 
             linetype = "dashed", size = 1.5) +
  
  
  # Density line
  geom_density(color = "black", size = 1.5, alpha = 0.5) +
  
  
  
  # Customize labels and theme
  ggtitle("Distribution of Home Prices") +
  xlab("Price") +
  ylab("Density") +
  theme_minimal()


#---------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------

## creating histograms Based on Groups


data("iris")

# Create a histogram with customized colors based on the 'Species' column
ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(bins = 30, color = "black", alpha = 0.7) +
  
  # Customize labels and theme
  ggtitle("Distribution of Sepal Length by Species") +
  xlab("Sepal Length") +
  ylab("Frequency") +
  
  # Customize color palette
  scale_fill_manual(values = c("blue", "pink", "red")) +
  
  theme_minimal()

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------




## Creating Separate panels in Histogram

# Create a histogram faceted by 'Species'
h=ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(bins = 30, color = "black", alpha = 0.7) +
  transition_states(
    frame,
    transition_length = 2,
    state_length = 1
  ) +
  
# Facet by 'Species'
  facet_wrap(~Species, scales = "free") +

#-------------(facet_wrap)----> function to create separate panels
#-------------(~species)------> what you want to create    
  
  
# Customize labels and theme
  ggtitle("Histogram of Sepal Length by Species") +
  xlab("Sepal Length") +
  ylab("Frequency") +
  theme_minimal()
library(plotly)
ggplotly(h)

# Render the animation

library(gifski)
animate(h, renderer = gifski_renderer()) 

