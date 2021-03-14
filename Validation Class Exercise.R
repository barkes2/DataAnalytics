#ISLR: Introduction to Statistical Learning with R
#Not using cross validaton
#Validation set example with Auto dataset.
library(ISLR)
library(MASS)#dataset from this one
library(boot)#dont need for this right now but just leaving this
set.seed(1)
#read the cv.glm documentation
#??cv.glm
#help("sample")#read the doc for sample() function
train <- sample(392,196) 
lm.fit<-lm(mpg~horsepower,data=Auto,subset=train)
#we use the subset option in the lm() function to fit a linear regression using
#the observations corresponding to the training set
attach(Auto)
#predict() to estimate response from 392 observations
#mean() calculates the MSE of the 196 observations in validation set
#-train selects on the observations NOT in the training set
mean((mpg-predict(lm.fit,Auto))[-train]^2)
#MSE for the linear regression is 23.27
#We can use the poly() function to estimate test error for the quadratic and 
#cubic regression
#Quadratic regression line
lm.fit2<-lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
#quadratic is lower than linear 18.72
#If we fit a Cubic function is there an improvement in my model
lm.fit3<-lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
#cubic is still lower at 18.79
set.seed(2)  #new seed eg new sample set
train=sample(392,196)
lm.fit<-lm(mpg~horsepower,data=Auto,subset=train)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
#MSE/error rate for linear is 25.73 higher than linear in first
#Quadratic regression
lm.fit2<-lm(mpg~poly(horsepower,2),data=Auto,subset=train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
#error rate 20.43
lm.fit3<-lm(mpg~poly(horsepower,3),data=Auto,subset=train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
#error rate 20.39
#quadratic model yields the lowest error,however, cubic yields small improvement
#over a linear function, little evidence to favor cubic function model of HP
