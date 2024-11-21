# สมาชิกกลุ่ม
# กลุ่ม 4 แซมบาสก้าไอซ์
# 65050689 ภาณุภณ สิริวรพาส
# 65050866 ศิรชัช เมธาศิลวัต
# 65050895 สรวิชญ์ หงษ์เกิด
# 65050989 อภิสิทธิ์ เยียระยงค์

# Install Package
# install.packages('fpp3', dependencies = TRUE)
# install.packages("ggplot2")
# install.packages("ggseasonplot")

# Call Library
# fpp2 เป็นพวก Example Dataset
library(fpp2)
library(forecast)
library(ggplot2)
library(dbplyr)

#### z ####
# Normal Test
## Install Package
# install.packages('nortest')
library('nortest')

### 1. Data Preparation
# ข้อมูลราคาย้อนหลังของหุ้น Waste Mangementt, Inc. ตั้งแต่วันที่ 1/1/2014 จนถึงปี 31/1/2023
z <- c(41.9, 43.5, 45.8, 48.69, 53.2, 50.28, 49.83, 53.13, 55.2, 60.42,
       65.38, 66.88, 71.36, 72.81, 75.99, 81.4, 85.8, 82.8, 88.67, 89.79,
       97.58, 108.5, 116.78, 112.93, 114.7, 100.97, 110.51, 116.61, 116.88,
       138.24, 149.65, 160.79, 151.6, 156.63, 165.07, 160.91, 153.16, 165.32,
       161.81, 167.68)

# แบ่งเป็น Quater โดยเริ่มตั้งแต่ปี 2014
y <- ts(z, start=2014, frequency=4)
Seasonal=cycle(y)
Trend=rep(1:length(z))
dataframe=data.frame(y,Trend,Seasonal)

# To create dummary variable using ifelse function
dataframe$Qtr1<-ifelse(dataframe$Seasonal==1,1,0)
dataframe$Qtr2<-ifelse(dataframe$Seasonal==2,1,0)
dataframe$Qtr3<-ifelse(dataframe$Seasonal==3,1,0)
dataframe$Qtr4<-ifelse(dataframe$Seasonal==4,1,0)
dataframe


### 2. Testing of Normality
# Anderson Daring test ใช้วิธีนี้เนื่องจากข้อมูลมีจำนวนน้อยกว่า 50

ad.test(z)
## Reject H0
## สรุปได้ว่า อนุกรมเวลาไม่มีการแจกแจงปกติ ##


### 3. Testing for Trend 
# Daniel's Test ใช้วิธีนี้เนื่องจากข้-อมูลเป็น Nonparametric 

cor.test(dataframe$y, dataframe$Trend, method=c("spearman"))
## Reject H0
## สรุปได้ว่า อนุกรมเวลายอดขายของ น้ำส้ม มีแนวโน้ม
## ถ้าข้อมูลมี แนวโน้ม เราต้องไปทำการ detrend ก่อน


### 4. Seasonality Test 
# Kruskal-Wallis test ใช้วิธีนี้เนื่องจากข้อมูลเป็น Nonparametric
# ต้องทำการ detrend ก่อน เพราะข้อมูลมีแนวโน้ม โดยมี 3 Step

#Step 1: Detect the Trend
# ใช้ centre = T เพราะข้อมูลมันไม่ตกกึ่งกลางของชั้น โดยทำการหา ma ซ้ำอีกรอบนึง
trend = ma(y, order = 4, centre = T)

#Step 2: Detrend the Time Series
detrend = y - trend

#Step 3: Kruskal-Wallis test
kruskal.test(detrend ~ Seasonal, data = dataframe)
## Failed to Reject H0 
## สรุปได้ว่า อนุกรมเวลาไม่มีอิทธิพลฤดูกาลเข้ามาเกี่ยวข้อง

#######################################################################

# ตรวจสอบว่าข้อมูลเป็น Stationary หรือยัง

# library ที่ใช้ทำ 
library(urca)

summary(ur.kpss(z))
# Reject H0 จึงสรุปได้ว่า ข้อมูลอนุกรมเวลาไม่เป็น Stationary
