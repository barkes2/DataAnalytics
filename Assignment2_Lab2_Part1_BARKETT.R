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

# 2) Generate Central Tendency values for DALY variable

#Generate Histograms for EPI and DALY variables in the EPI 2010 dataset
# 1) Generate the Histogram for EPI variable
# 2) Genreate the Histogram for the DALY variable
boxplot(ENVHEALTH,ECOSYSTEM)
#Generates the box plot for the variables ENVHEALTH and ECOSYSTEM
qqplot(ENVHEALTH,ECOSYSTEM)
#generates the Q-Q plot for the variables ENVHEALTH and ECOSYSTEM

#Regression Exercises:
#Using the EPI (under /EPI on web) dataset find the single most important factor in increasing the EPI in a given region

#Linear and least-squares
boxplot(ENVHEALTH,DALY,AIR_H,WATER_H)
lmENVH<-lm(ENVHEALTH~DALY+AIR_H+WATER_H)
lmENVH
summary(lmENVH)
cENVH<-coef(lmENVH)

#Predict
DALYNEW<-c(seq(5,95,5))
AIR_HNEW<-C(seq(5,95,5))
WATER_HNEW<-C(seq(5,95,5))
NEW<-data.frame(DALYNEW,AIR_HNEW,WATER_HNEW)
pENV<-predict(lmENVH,NEW,interval="prediction")
cENV<-predict(lmENVH,NEW,interval="confidence")

#repeat these for the variables AIR_E and CLIMATE

#Due on March 4th by 11:59 on LMS link available on Feb 25th