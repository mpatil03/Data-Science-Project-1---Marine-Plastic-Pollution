if (!require("pacman")) install.packages("pacman")
pacman::p_load(pacman, party, rio, tidyverse)

install.packages("forecast")
install.packages("ggplot2")
install.packages("dplyr")
library(forecast)
library(dplyr)
library(ggplot2)
library(data.table)
library(fpp2)
library(stats)
library(tseries)
library(expsmooth)
library(fma)
library(scales)


#Importing from excel file
ProductionData <- import("C:/Users/Mayuri/Documents/Global_Plastics_Production.xlsx")
summary(ProductionData)
head(ProductionData)
glimpse(ProductionData)
plot(ProductionData$Year,ProductionData$Production,xlab= "Year", ylab= "Production",main = "Plastic Production Globally")


ProductionData$Production<-rescale(ProductionData$Production,to= c(1,100))
ProductionData$Production

#Creating time series by creating R object for time series data that is ts() 
#Coverting data into Time series format
myts<-ts(ProductionData$Production, start = 1950, end = 2015, frequency = 1) #for annual data its 1 ,monthly=12, Quarter=4
plot(myts)

#myts is our data in the time series format
myts
plot(myts, xlab= "Year", ylab= "Production",main = "Plastic Production Golobally")

#Observations on above plot
#Production rate is in increasing in numbers, implying presence of trend component. 
#No fluctuations in the data so there is no seasonality component. 

#Decomposition plot




#Seasonal Plot- This gives error that data is not seasonal.
ggseasonplot(myts,year.labels = TRUE,year.labels.left = TRUE)

#Creating Trianing and test data

#Training
myts_train<-window(myts,start=1950,end=2005, freq = 1)
myts_train
plot(myts_train)

#Test Data
myts_test<-window(myts,start=2006, freq = 1)
myts_test
plot(myts_test)

#mean and Naive methods of forecasting for original time series object
mean(myts,5)
naive(myts,5)


#Average method or mean method for training set
Method_Average<-meanf(myts_train,10)
plot(meanf(myts_train,10))

#Naive Method on traing set
Method_Naive<-naive(myts_train,10)
#This forecast doesn't show any trend so we will use drift method to forecast trend pattern


#Drift method
Method_Drift<-rwf(myts_train,h=10,drift = TRUE)
#This shows forecast with trend pattern
Drift_Method<-rwf(myts_train,h=10,drift = TRUE)


#Plot of all the above methods together

autoplot(myts_train)+
  autolayer(meanf(myts_train, h=10),series="Mean", PI=FALSE) +
  autolayer(rwf(myts_train, h=10), series="Naïve", PI=FALSE) +
  autolayer(rwf(myts_train,h=10,drift = TRUE),series="Drift",PI=FALSE)




accuracy(Method_Average,myts_test)
accuracy(Method_Naive,myts_test)
accuracy(Method_Drift,myts_test)

plot(ses(myts_train, h=10))
summary(holt(myts_train,h=10))


#Below forecast methods are suitable for non seasonal trend data

Method_Holt<-holt(myts_train,h=10)
Method_Holt_damped<-holt(myts_train,damped = TRUE,h=10)
plot(Method_Holt,type = "o",ylab="Plastic Production in milion tonne",flwd=2,PI=FALSE, main = "Forecasts from Holt's linear trend and Holt's Damped Method")
lines(window(myts_test),type="o")
lines(Method_Holt_damped $mean, col=2)
summary(Method_Holt)
summary(Method_Holt_damped)


 
#To measure how good my forecast is I am using accuracy


accuracy(Method_Drift,myts_test)
accuracy(Method_Holt,myts_test)
accuracy(Method_Holt_damped,myts_test)

#Final forecast model 

Final_forecast_Holts<-holt(myts,h=20)
plot(Final_forecast_Holts)
summary(Final_forecast_Holts)

#Result
Final_Result<-ts(ProductionData$Production,frequency = 1,start=1950,end=2015)
Final_Result1<-holt(Final_Result,h=20)
summary(Final_Result1)
autoplot(Final_Result1)