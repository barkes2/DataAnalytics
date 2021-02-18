#useful commands here: hear(<object>); tail (<object>); summary(<object>)
#Measures of Central Tendency for the EPI dataset:
# 1) Generate Central Tendency values for EPI variable
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
EPI_data<-read.csv("EPI_data.csv")
attach(EPI_data);
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