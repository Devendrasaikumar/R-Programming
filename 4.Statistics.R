# Statistics


#---------------------------------------------------------------------#

# Measure of Central Tendency
# Mean

data = c(20,30,40,50)
mean(data)
     
# Median

data = c(100,30,40,50)
median(data)

# Mode

install.packages("DescTools")
library(DescTools)
data <- c(100,30,40,100)
Mode(data)

#------------------------------------------------------------------------#


# Measure of Variability

# Range

x = c(1, 2, 3, 4, 5)
range(x)

# Variance

x = c(1, 2, 3, 4, 5)
Var(x)


# Standard Deviation

x = c(1, 2, 3, 4, 5)
sd(x)


# Co-Variance
x = c(1, 2, 3, 4, 5)
y = c(6, 7, 8, 9, 10)
cov(x,y)


#-------------------------------------------------------------------#

# Skewness

install.packages("moments")
library(moments)
x <- c(100, 220, 73, 64, 500)
skewness(x)


#------------------------------------------------------------------#

# Kurtosis

library(moments)
x <- c(100, 220, 73, 64, 500)
kurtosis(x)

#----------------------------------------------------------------#

# Normal Distribution

# Generate 1000 random numbers from a normal distribution with mean 0 and standard deviation 1
x = rnorm(1000, mean = 0, sd = 1)

# Plot the histogram of x
hist(x, probability = TRUE, col = "lightblue")

# Overlay the normal distribution curve
curve(dnorm(x, mean = 0, sd = 1), add = TRUE, col = "red")

#--------------------------------------------------------------------#


# Bi-Nomial Distribution

# Number of trials (n)
n = 10

# Probability of success (p)
p = 0.5

# Generate 1000 random numbers from a binomial distribution
x = rbinom(1000, size = n, prob = p)

# Plot the histogram of x
hist(x, probability = TRUE, col = "lightblue")

# Overlay the binomial distribution curve
curve(dbinom(x, size = n, prob = p), add = TRUE, col = "red")


#-------------------------------------------------------------------#
