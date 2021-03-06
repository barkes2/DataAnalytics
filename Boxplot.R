#Boxplots
#setwd()
nyt6<-read.csv("nyt6.csv")
head(nyt6)
#"Gender" and "Signed_In" appear to be discrete data
#Need to choose quant data ("Age" and "Impressions" will do)
boxplot(nyt6$Age, ylab="Age",main="Boxplot Distribution of Age in NYT6")