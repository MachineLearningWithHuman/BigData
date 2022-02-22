#The DBI package helps connecting R to database management systems (DBMS)
library('DBI')
#Dplyr is mainly used for data manipulation in R
library('dplyr')

library('dbplyr')
#The odbc package provides a DBI-compliant interface to Open Database Connectivity (ODBC) drivers
library('odbc')
# DT package is very easy to use and based on this package can filter, search, and export data into different formats easily
library('DT')
myconn <- DBI::dbConnect(odbc::odbc(), "snow", uid="Anvesh", pwd='Kipi@100')
mydata <- DBI::dbGetQuery(myconn,"SHOW WAREHOUSES")
head(mydata)
datatable(mydata)
daily_data <- DBI::dbGetQuery(myconn,"select*from day ")
datatable(data)
#ggplot2 is a R package dedicated to data visualization
library('ggplot2')
#It contains functions for performing decomposition and forecasting with exponential smoothing, arima, moving average models, and so forth.
library('forecast')
#it is used for time series and functional computation
library('tseries')
daily_data$date = as.Date(daily_data$DTEDAY)
ggplot(daily_data, aes(date, CNT)) + geom_line() + scale_x_date('month')  + ylab("Daily sales count")
count_ts = ts(daily_data[, c('CNT')])

daily_data$clean_cnt = tsclean(count_ts)

ggplot() + 
  geom_line(data = daily_data, aes(x = date, y = clean_cnt)) + ylab('Cleaned sales Count')
daily_data$cnt_ma = ma(daily_data$clean_cnt, order=7) # using the clean count with no outliers
daily_data$cnt_ma30 = ma(daily_data$clean_cnt, order=30)

ggplot() + 
  geom_line(data = daily_data, aes(x = date, y = clean_cnt, colour = "Counts")) +
  geom_line(data = daily_data, aes(x = date, y = cnt_ma,   colour = "Weekly Moving Average"))  +
  geom_line(data = daily_data, aes(x = date, y = cnt_ma30, colour = "Monthly Moving Average"))  +
  ylab('sales Count')

count_ma = ts(na.omit(daily_data$cnt_ma), frequency=30)
decomp = stl(count_ma, s.window="periodic")
deseasonal_cnt <- seasadj(decomp)
plot(decomp)
adf.test(count_ma, alternative = "stationary")
Acf(count_ma, main='')
Pacf(count_ma, main='')
count_d1 = diff(deseasonal_cnt, differences = 1)

plot(count_d1)
adf.test(count_d1, alternative = "stationary")
Acf(count_d1, main='ACF for Differenced Series')
Pacf(count_d1, main='PACF for Differenced Series')
auto.arima(deseasonal_cnt, seasonal=FALSE)
fit<-auto.arima(deseasonal_cnt, seasonal=FALSE)
tsdisplay(residuals(fit), lag.max=45, main='(1,1,1) Model Residuals')
fit2 = arima(deseasonal_cnt, order=c(1,1,7))
tsdisplay(residuals(fit2), lag.max=15, main='Seasonal Model Residuals')
fcast <- forecast(fit2, h=30)
plot(fcast)
hold <- window(ts(deseasonal_cnt), start=700)
fit_no_holdout = arima(ts(deseasonal_cnt[-c(700:725)]), order=c(1,1,7))

fcast_no_holdout <- forecast(fit_no_holdout,h=25)
plot(fcast_no_holdout, main=" ")
lines(ts(deseasonal_cnt))
fit_w_seasonality = auto.arima(deseasonal_cnt, seasonal=TRUE)
seas_fcast <- forecast(fit_w_seasonality, h=30)
plot(seas_fcast)