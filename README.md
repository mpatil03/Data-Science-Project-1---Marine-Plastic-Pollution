# Marine-Plastic-Pollution
Forecasting of global plastic production and analysis of the factors responsible for ocean pollution.
### Abstarct
The amount of plastic enters the ocean is doubling every year. Factors that are mainly responsible for this increasing rate are still unknown or ignored. With the help of comprehensive data on different plastics disposal methods, the rate of plastic waste, coastal populations, and plastic production rate, we are trying to estimate factors that are responsible for polluting the earth’s environment. Plastic Production is a vital element of this environmental problem; Its global production rate reached 359 Million metric tons in the year 2018. If waste management techniques are not improved or taken seriously, marine life will be in the most significant trouble. With the help of different forecasting techniques, we are going to find out the global plastic production rate for upcoming years, hoping it will help us identify potential environmental problems.
###  Time Series Forecasting Methods

#### 1. Average or Mean method of forecasting: 
The average method is used for both cross-sectional and Time Series data. In average values, forecast values are equal to mean of the historical values. We will use meanf(y,h) function to find out the forecast.

y – Represents data
h – Represents forecast horizon

#### 2. Naïve Method of forecasting: 
This method is only applicable for time series data.
We will use Naïve(y,h) function for forecasting plastic production using the naïve method.

#### 3. Drift Method: 
It allows forecast to increase or decrease over time using a drift.

#### 4. Double Exponential Smoothing (Holt’s linear trend method):

Simple exponential smoothing does not support data with a trend or seasonality. Holt's method is an extension to simple exponential smoothing, which adds support for the trend component. This method is creating reliable forecasts quickly. As our data has a healthy trend pattern, we will go ahead and try to fit a double exponential smoothing method. Holt’s linear trend method has three equations, a forecast equation and two smoothing equations (for level and trend)

Forecast equation y^t+h|t=ℓt+hbt
Level equation ℓt=αyt+(1−α)(ℓt−1+bt−1) 
Trend equation bt=β∗(ℓt−ℓt−1)+(1−β∗)bt−1,

Here, ℓt = Estimate of the level of time series bt = Estimate of the trend of a series α = Smoothing parameter for a level β = Smoothing parameter for a trend

#### 4. Holt’s damped method:
In this method of forecasting additional parameter is added into the holt's linear method called a damping parameter. This method is appropriate for long-run forecasts. As damping parameter dampens, trend pattern forecast will remain constant for the long-run forecast.

Forecast equation ˆyt+h|t=ℓt+(ϕ+ϕ2+⋯+ϕh)bt 
Level equation ℓt=αyt+(1−α)(ℓt−1+ϕbt−1) 
Trend equation bt=β∗(ℓt−ℓt−1)+(1−β∗)ϕbt−1. 
Φ = Damping Parameter.
