##### Linear Regression ###

Data=read.csv("D:/Sai/LR Data set.csv")
Data
#### Data clenning ####
head(Data)
tail(Data)
dim(Data)
colnames(Data)
is.null(Data)
summary(Data)
library(dplyr)
Df=select(Data,ENGINE.SIZE,CYLINDERS,FUEL.CONSUMPTION,COEMISSIONS)
Df
head(Df)

### EDA ###
####### Histogram #######

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1)) 
# mar = c(bottom, left, top, right)
# par = Set Graphical Parameter
# mfrow = c(2, 2) --> Telling 4 graphs if keep c(3,3)--> 6 graphs
hist(Data$ENGINE.SIZE,main = "ENGINE SIZE",col=terrain.colors(11))
hist(Data$CYLINDERS,main = "CYLINDERS",col=terrain.colors(11))
hist(Data$FUEL.CONSUMPTION,main = "FUEL CONSUMPTION",col=terrain.colors(11))
hist(Data$COEMISSIONS,main = "COEMISSIONS",col=terrain.colors(11))

#### Scatter #####  
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1)) 

plot(Data$ENGINE.SIZE,Data$COEMISSIONS)
plot(Data$CYLINDERS,Data$COEMISSIONS)
plot(Data$FUEL.CONSUMPTION,Data$COEMISSIONS)
plot(Data$COEMISSIONS,Data$COEMISSIONS)

### Model Training ###
# We Split Data train (80%) and test (20%) 

library(caTools)
set.seed(2)  # For reproducibility
data <- Df  # Example data set
data

# Number of rows in the data set
n_rows <- nrow(data)
n_rows

# Number of rows for training (80%)
n_train <- round(0.8 * n_rows)
n_train

# Randomly sample row indices for training set
train_indices <- sample(1:n_rows, n_train, replace = FALSE)
train_indices

# Create the training set
train_data <- data[train_indices, ]
train_data
dim(train_data)

# Create the testing set (excluding the rows used in training)
test_data <- data[-train_indices, ]
test_data
dim(test_data)


#### Fit Linear Model ####
Model <- lm(COEMISSIONS~., data =train_data)
Model
summary(Model)

#### Predict model using test data ####
pred <- predict(Model, test_data)
pred
res<-residuals(Model)
res
res<-as.data.frame(res)
res

results<-cbind(pred,test_data$COEMISSIONS)
results

colnames(results)<-c('predicted','real')

results<-as.data.frame(results)
head(results)

plot(test_data$COEMISSIONS, type = 'l', lty = 1.8, col = "red")
lines(pred, type = "l", col = "blue")
plot(pred, type = "l", lty = 1.8, col = "blue")

rmse <- sqrt(mean(pred-Data$COEMISSIONS)^2)
rmse

###### Export output text form ####
sink(file = "lm_output.txt")
results
sink(file = NULL)

##### Export output Excel ####

library(openxlsx)
write.xlsx(Model, "output.xlsx")






#######################################################################
### Another method (multiple) #####

Model=lm(COEMISSIONS~.,data=data1,ENGINE.SIZE+CYLINDERS)
Model

#### Correlation graph ####
library(corrplot)

num.cols=sapply(data1, is.numeric)
num.cols
cor.data=cor(data1[,num.cols])
cor.data

corrplot(cor.data, method='color')

##### Manova ####
iris
data=iris
head(data)
king = manova(cbind(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) ~ Species, data = iris)
king




























