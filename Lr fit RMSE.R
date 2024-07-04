library(readxl)
da=read_excel("D:/Sai/Data sets/SLR.xlsx")
da=data.frame(da)
head(da)
tail(da)
is.null(da$YearsExperience)
is.null(da$Salary)

#### Box Plot ####
library(ggplot2)
boxplot(da$YearsExperience, main = "Box Plot", ylab = "Values", col = "lightgreen", border = "black")
boxplot(da$Salary, main = "Box Plot", ylab = "Values", col = "lightgreen", border = "black")
colnames(da)

### Model Fitting ###
model=lm(Salary ~ YearsExperience,data = da)
model
predictions <- predict(model, da)
predictions
mse <- mean((da$Salary - predictions)^2)
cat("Mean Squared Error:", round(mse, 3), "\n")
rmse <- sqrt(mse)
cat("Root Mean Squared Error:", round(rmse, 3), "\n")

plot(x=da$YearsExperience, y=da$Salary, main = "Scatter Plot", xlab = "Years of Exp", ylab = "Salary",pch=16, col = "Blue")
abline(model, col = "red")



