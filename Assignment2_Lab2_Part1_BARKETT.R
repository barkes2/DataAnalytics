#useful commands here: hear(<object>); tail (<object>); summary(<object>)

#Measures of Central Tendency for the EPI dataset:
# 1) Generate Central Tendency values for EPI variable
getwd()
EPI_data<-read.csv("EPI_data.csv")#reads in the csv file from the pathway you oultine. check from "getwd()"
attach(EPI_data) #sets the default object
View(EPI_data) #opens window with EPI data
fix(EPI_data) #opens editing window
EPI #displays values from the EPI column in the EPI_data; lots of NA values to be masked
tf <- is.na(EPI) #records true value as NA
E<-EPI[!tf] #filters out these NA values making a new array
E #just so you can view the new array and show that it is missing NA values
summary(E) #displays stats about the EPI data in array without NA values
fivenum(E,na.rm=TRUE) #similar to above: returns Tukey's five number summary for the data (min,lower hinge, median, upper-hinge, max)
#values should be:
#Min.   1st Qu.   Median    Mean    3rd Qu.   Max.
#32.10  48.60     59.20     58.37   67.60     93.50
#how do we find the mode?
# a)create a function
mode<-function(v) {
  uniqv<-(v)
  uniqv[which.max(tabulate(match(v,uniqv)))]
}
# b) create the vector with numbers
v<-EPI[!tf]
# c) calculate the mode using the user function
result<-mode(v)
print(result)
#the mode of EPI is:
#> print(result)
#[1] 44.6
#Central Tendency Values of the EPI column: 
#Mean is 58.37; Median is 59.20; and the Mode is 44.6
#=========================================================================================================================================
# 2) Generate Central Tendency values for DALY variable
getwd()
EPI_data<-read.csv("EPI_data.csv")#reads in the csv file from the pathway you oultine. check from "getwd()"
attach(EPI_data) #sets the default object
View(EPI_data) #opens window with EPI data
fix(EPI_data) #opens editing window
DALY #displays values from the DALY column in the EPI_data; lots of NA values to be masked
tf <- is.na(DALY) #records true value as NA
D<-DALY[!tf] #filters out these NA values making a new array
D #just so you can view the new array and show that it is missing NA values
summary(D) #displays stats about the EPI data in array without NA values
fivenum(D,na.rm=TRUE) #similar to above: returns Tukey's five number summary for the data (min,lower hinge, median, upper-hinge, max)
#values should be:
#Min.   1st Qu. Median  Mean    3rd Qu. Max. 
#0.00   37.19   60.35   53.94   71.97   91.50 
#how do we find the mode?
# a)create a function
mode<-function(z) {
  uniqv<-(z)
  uniqv[which.max(tabulate(match(z,uniqv)))]
}
# b) create the vector with numbers
z<-DALY[!tf]
# c) calculate the mode using the user function
result<-mode(z)
print(result)
#> print(result)
#[1] 86.86
#Central Tendency Values of the DALY column:
#Mean is 53.94; Median is 60.35; and the Mode is 86.86
#=========================================================================================================================================
#Generate Histograms for EPI and DALY variables in the EPI 2010 dataset
# 1) Generate the Histogram for EPI variable
EPI_data<-read.csv("2010EPI_data.csv") #reads in .csv file from the pathway you outline. check your working directory with command "getwd()"
#Note: replace default data frame name - cannot start with numbers! Munging
#Note: replace <path> with either a directory path or use setwd("<path>")
attach(EPI_data) #set the 'default' object
EPI #prints out values EPI_data$EPI
tf <- is.na(EPI) #records True value is NA
E <- EPI[!tf] #filters out NA values, new array
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw="SJ"
lines(density(EPI,na.rm=TRUE,bw="SJ"))
rug(EPI)

# 2) Genreate the Histogram for the DALY variable
EPI_data<-read.csv("2010EPI_data.csv") #reads in .csv file from the pathway you outline. check your working directory with command "getwd()"
#Note: replace default data frame name - cannot start with numbers! Munging
#Note: replace <path> with either a directory path or use setwd("<path>")
attach(EPI_data) #set the 'default' object
DALY #prints out values EPI_data$EPI
tf <- is.na(DALY) #records True value is NA
D <- DALY[!tf] #filters out NA values, new array
hist(DALY)
hist(DALY, seq(30., 95., 1.0), prob=TRUE)
lines(density(DALY,na.rm=TRUE,bw=1.)) # or try bw="SJ"
lines(density(DALY,na.rm=TRUE,bw="SJ"))
rug(DALY)

#below two are in notes and are shown as running; unsure if part of lab but here they are
boxplot(ENVHEALTH,ECOSYSTEM)
#Generates the box plot for the variables ENVHEALTH and ECOSYSTEM
qqplot(ENVHEALTH,ECOSYSTEM)
#generates the Q-Q plot for the variables ENVHEALTH and ECOSYSTEM
#========================================================================================================================================
#Regression Exercises:
#Using the EPI (under /EPI on web) dataset find the single most important factor in increasing the EPI in a given region
#Linear and least-squares
boxplot(ENVHEALTH,DALY,AIR_H,WATER_H)
lmENVH<-lm(ENVHEALTH~DALY+AIR_H+WATER_H)
lmENVH
#Call:
#  lm(formula = ENVHEALTH ~ DALY + AIR_H + WATER_H)
#
#Coefficients:
#(Intercept)   DALY         AIR_H        WATER_H  
#-1.458e-05    5.000e-01    2.500e-01    2.500e-01  
summary(lmENVH)
#Call:
#  lm(formula = ENVHEALTH ~ DALY + AIR_H + WATER_H)
#
#Residuals:
#  Min         1Q     Median         3Q        Max 
#-0.0073210 -0.0027069 -0.0000915  0.0022285  0.0053404 
#
#Coefficients:
#  Estimate Std. Error   t value Pr(>|t|)    
#(Intercept) -1.458e-05  6.520e-04    -0.022    0.982    
#DALY         5.000e-01  1.988e-05 25147.716   <2e-16 ***
#  AIR_H        2.500e-01  1.276e-05 19593.273   <2e-16 ***
#  WATER_H      2.500e-01  1.816e-05 13764.921   <2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
#Residual standard error: 0.003015 on 159 degrees of freedom
#Multiple R-squared:      1,	Adjusted R-squared:      1 
#F-statistic: 3.77e+09 on 3 and 159 DF,  p-value: < 2.2e-16
cENVH<-coef(lmENVH)
cENVH
#(Intercept)          DALY         AIR_H       WATER_H 
#-1.458233e-05  5.000248e-01  2.499979e-01  2.499861e-01 
#========================================================================================================================================
#Predict
DALYNEW<-c(seq(5,95,5))
AIR_HNEW<-c(seq(5,95,5))
WATER_HNEW<-c(seq(5,95,5))
NEW<-data.frame(DALYNEW,AIR_HNEW,WATER_HNEW)
pENV<-predict(lmENVH,NEW,interval="prediction")
cENV<-predict(lmENVH,NEW,interval="confidence")

#repeat these for the variables AIR_E and CLIMATE
DALYNEW<-c(seq(5,95,5))
AIR_HNEW<-c(seq(5,95,5))
WATER_HNEW<-c(seq(5,95,5))
NEW<-data.frame(DALYNEW,AIR_HNEW,WATER_HNEW)
pENV<-predict(lmENVH,NEW,interval="prediction")
cENV<-predict(lmENVH,NEW,interval="confidence")
#Due on March 4th by 11:59 on LMS link available on Feb 25th