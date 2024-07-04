## Predicting The ROI 
## Building MMM Model 

install.packages("datarium")

# Loading Marketing Data From Datarium package
library(datarium)
data(marketing)
df = marketing
df
head(df)
tail(df)
dim(df)
colnames(df)
summary(df)

# They Have 200 Rows and 4 Variables "youtube" "facebook" "newspaper" "sales"

# We need to find Co relation with the sales 
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(df, histogram = TRUE, pch = 1)

# We can see that in Graph youtube has positive relation with Sales (0.78)
# We can see that in Graph Facebook has positive relation with Sales (0.58)
# We can see that in Graph newspaper has slight positive relation with Sales (0.23)

# We want create adstock-adjusted advertising data
#set adstock fb rate
# Parameters for adstock effect
set_rate_fb = 0.1
set_memory = 2
# Calculate adstock effect for fb advertising
get_adstock_fb = rep(set_rate_fb, set_memory+1) ^ c(0:set_memory)
get_adstock_fb

#set adstock youtube rate
# Parameters for adstock effect
set_rate_yt = 0.15
set_memory = 2
# Calculate adstock effect for youtube advertising
get_adstock_youtube = rep(set_rate_yt, set_memory+1) ^ c(0:set_memory)
get_adstock_youtube

#set adstock news rate
# Parameters for adstock effect
set_rate_news = 0.25
set_memory = 2
# Calculate adstock effect for newspaper advertising
get_adstock_news = rep(set_rate_news, set_memory+1) ^ c(0:set_memory)
get_adstock_news

# Now we can Check the Effect of facebook advertisements using a convolution filter

#adstocked fb
# Apply adstock to fb advertising data
ads_fb = stats::filter(c(rep(0, set_memory), df$facebook), get_adstock_fb, method="convolution")
ads_fb = ads_fb[!is.na(ads_fb)]
ads_fb
#plot
plot(seq(1,length(df$facebook)), df$facebook, type="h", 
     main = "Adstocked Facebook",
     xlab="Time (Weeks)", ylab="Facebook", 
     ylim=c(0, max(c(df$facebook, ads_fb))), 
     frame.plot=FALSE)
lines(ads_fb, col="orange")

#adstocked youtube
# Apply adstock to youtube advertising data
ads_youtube = stats::filter(c(rep(0, set_memory), df$youtube), get_adstock_youtube, method="convolution")
ads_youtube = ads_youtube[!is.na(ads_youtube)]
ads_youtube
#plot
plot(seq(1,length(df$youtube)), df$youtube, type="h", 
     main = "Adstocked Youtube", 
     xlab="Time (Weeks)", ylab="Youtube", 
     ylim=c(0, max(c(df$youtube, ads_youtube))), 
     frame.plot=FALSE)
lines(ads_youtube, col="yellow")


#adstocked newpaper
# Apply adstock to newspaper advertising data
ads_news = stats::filter(c(rep(0, set_memory), df$newspaper), get_adstock_news, method="convolution")
ads_news = ads_news[!is.na(ads_news)]
ads_news
#plot
plot(seq(1,length(df$newspaper)), df$newspaper, type="h", 
     main = "Adstocked Newspaper",
     xlab="Time (Weeks)", ylab="Newspaper", 
     ylim=c(0, max(c(df$newspaper, ads_news))), 
     frame.plot=FALSE)
lines(ads_news, col="red")

#We are specifying sales as the dependent variable in the lm() function
mmm_1 = lm(df$sales ~ ads_youtube + ads_fb + ads_news)
summary(mmm_1)

# Conclusion:
# The regression model is statistically significant as indicated by the low p-value of the F-statistic (< 0.05).
# Advertising expenditures on YouTube and Facebook have significant positive effects on sales, as their coefficients have low p-values (< 0.05).
# However, advertising expenditure on news does not have a significant effect on sales, as its coefficient has a high p-value (> 0.05).
# The model explains approximately 88.19% of the variance in sales, suggesting that it is a good fit for the data.

#Check for multicollinearity using VIFs
install.packages("mctest")
library(mctest)
imcdiag(mmm_1, method = "VIF")

# Conclusion:
# No multicollinearity was detected in the VIF method
# VIF stands for Variance Inflation Factor Measure how much Variance

#check for heteroscedasticity
#first, plot the model out and review the siduals vs fitted plot and the Sclae-Location plot
par(mfrow=c(2,2)) # put all 4 charts into 1 page
plot(mmm_1)

#Confirm with an objective test for heteroscedasticity using Breusch Pagan test and NCV test
install.packages("lmtest")
library(lmtest)
lmtest::bptest(mmm_1)
install.packages("car")
library(car)
car::ncvTest(mmm_1)

#As our p-values from the Breusch Pagan and NCV tests returned values above the significance level of 0.05
#Hence, we can say that there are no major issues with heteroskedasticity in our model
summary(mmm_1)

# Conclusion:
#For every £1000 spent on Youtube, we can expect sales to increase by 45 (0.045*1000) units
#For every £1000 spent on Facebook, we can expect sales to increase by 188 (0.188 * 1000) units
#For every £1000 spent on Newspapers, we can expect sales to decrease by 6 (0.006 * 1000) units though this is not significant

#Create time series
install.packages("forecast")
library(forecast)

#frequency is 52 to denote weekly as there are about 52 weeks in a year. 
#ts() needs a minimum of 2 periods (52 x 2 = 104 weeks), 
#our data has observations from 200 weeks so this should be sufficient
ts_sales = ts(df$sales, start = 1, frequency = 52)
ts_sales
#check class. should state "ts"
class(ts_sales)

#decompose to get the individual components for trends, seasonality, etc
ts_sales_comp = decompose(ts_sales)
ts_sales_comp
#plot out
plot(ts_sales_comp)

#To add a basic linear trend of sales to lm(), we could use seq_along() which produces a vector of sequential integers
basic_trend = seq_along(df$sales)
basic_trend

#we can use tslm() for our regression. 
#this is just  a timeseries wrapper for lm() but allows trend and seasons on the fly from the data 
#just specify "trend" and "season" and tslm() will automatically generate values based on the ts() object you have specified.

#fit the time Series Liner model
mmm_2 = tslm(ts_sales ~ trend + season + ads_youtube + ads_fb + ads_news)
summary(mmm_2)
library(openxlsx)
write.xlsx(mmm_2, "output.xlsx")
summary(mmm_1)
write.xlsx(mmm_1, "output.xlsx1")
#Comparison:
#Model Complexity: The second model is more complex as it includes trend and seasonality components.
#R-squared: The R-squared value for the second model (0.9178) is higher than the first model (0.8819), indicating that the second model explains more of the variance in sales.
#Adjusted R-squared: The adjusted R-squared also considers model complexity, and in this case, it's slightly lower for the second model, but still high (0.8865).
#Significance of Predictors: Both models show that ads on YouTube and Facebook are highly significant predictors of sales. Ads in news, however, are not significant in both models.

#Conclusion:
#Considering the higher R-squared value and the inclusion of additional relevant variables like trend and seasonality, 
#the second model seems to be a better fit for the data.

#Forecasting

#we want to forecast using our model
#i.e. if we were to spend x1 in youtube, x2 in facebook and 0 in newspaper for the next period what would this look like?
#we first need to create a dataframe containing new figures

#we want to get newspaper spend
news_spend = as.data.frame(ads_news)
news_spend
names(news_spend)[1] = "ads_news"
names(news_spend)[1]
#and give 40% to Youtube.
#this is added to the current youtube spend budget (assuming we are keeping the youtube budget 
#for the next period is the same as it has been for the previous period)
yt_spend = as.data.frame(ads_youtube)
yt_spend
names(yt_spend)[1] = "ads_youtube"
yt_spend$ads_youtube = yt_spend$ads_youtube + (news_spend$ads_news*0.4)
yt_spend


#and give the remainder 60% of newspaper spend to facebook.
#this is added to the current fb spend budget (assuming we are keeping the fb budget 
#for the next period is the same as it has been for the previous period)
fb_spend = as.data.frame(ads_fb)
fb_spend
names(fb_spend)[1] = "ads_fb"
fb_spend$ads_fb = fb_spend$ads_fb + (news_spend$ads_news*0.6)
fb_spend


#leaving nothing for newspapers (we are swtiching it off for the next period)
final_news_spend =  as.data.frame(news_spend*0)
final_news_spend
names(final_news_spend)[1] = "ads_news"
final_news_spend

#now put these new values all into a dataframe. 
#We'll use the model to predict sales for the next period based on these new budget allocation values
new_spends = cbind(yt_spend, fb_spend,final_news_spend)
new_spends

install.packages("ggfortify")
library(ggfortify)
par(mfrow=c(1,1)) # reset to 1 chart per page
set.seed(9999)

#what performance looks like with no change
forecast_unchanged = forecast(mmm_2, h=200)
forecast_unchanged
ggplot2::autoplot(forecast_unchanged, ts.colour = 'black', size= 0.7, predict.size = 0.7, predict.colour = 'red', conf.int = TRUE, conf.int.fill = 'red', main = "Forecasted", predict.linetype='dashed') 

#forecast with budget changes
forecast_new_spends = forecast(mmm_2, newdata=new_spends)
forecast_new_spends
ggplot2::autoplot(forecast_new_spends, ts.colour = 'black', size= 0.7, predict.size = 0.7, predict.colour = 'blue', conf.int = TRUE, conf.int.fill = 'blue', main = "Forecasted")


#overlaying them together using autolayer()
forecast_unchanged = forecast(mmm_2, h=200)
forecast_unchanged
ggplot2::autoplot(forecast_unchanged, ts.colour = 'black', size= 0.7, predict.size = 0.7, predict.colour = 'red', conf.int = TRUE, conf.int.fill = 'red', main = "Forecasted", predict.linetype='dashed') + forecast::autolayer(forecast_new_spends, col = 'blue')

#Get fitted values
#Finally, you can access fitted values from the model by quering forecast_new_spends$fitted

forecast_new_spends$fitted







