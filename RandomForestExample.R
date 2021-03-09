#Random forest example
#This example original is from R-Bloggers (url in ppt)
#car Acceptability (Car condition) dataset from UCI ML Repository
#Data Source: https://archive.ics.uci.edu/ml/machine-learning-databases/car/
#Download the car.data from: same as above^
install.packages("randomForest")
library(randomForest)
data1<-read.csv("car.data",header=T) #load in the dataset
head(data1)
colnames(data1) <- c("BuyingPrice","Maintenance","NumDoors","NumPersons","BootSpace","Safety","Condition") #add some column names
head(data1)
str(data1)
#View(data1)
help("levels")
data1$Condition<-as.factor(data1$Condition) #dont know why that worked??? No longer NULL
levels(data1$Condition) #lets look ar the levels of the condition column 
#4 levels: "acc" "good" "unacc" and "vgood"
summary(data1)
#================================================================================

##Creating a 'training' and a 'validation' dataset
#we will randomly choose 70% (0.7) of the data points for training and 30% or 0.3 
#for validation. First we need to seed.
set.seed(100)
train<-sample(nrow(data1),0.7*nrow(data1),replace=F)
TrainSet<-data1[train,]
ValidSet<-data1[-train,]
summary(TrainSet)
summary(ValidSet)
help(randomForest)#Read the documentation
#Random Forest Model with default parameters
model1<-randomForest(Condition ~ .,data = TrainSet, Importance = TRUE)
model1 #YAY code runs

#Fine tuning the parameters of the randomForest model
#we have increased the mtry to 6 from 2
#mtry=Number of variables randomly sampled as candidates at each split
#Note that the default values are different for classification (sqrt(p)where p is 
#number of of variables in x) and regression (p/3)
model2<-randomForest(Condition~.,data=TrainSet,ntree=500,mtry=6,importance=T)
model2

#First we will conduct predictions using training set
#after we will predict using validation set
#reason we are doing this is to see the differences in results
#Predict on the Training set
predTrain<-predict(model2,TrainSet,type="class")
#We can use the table() to check the classification accuracy
table(predTrain,TrainSet$Condition)
#Predicting on validation set
predValid<-predict(model2,ValidSet,type="class")
table(predValid, ValidSet$Condition)

#We can also use importance() function to check important variables
#The below functions show the drop in mean accuracy for each of the variables
#To check the important variables
importance(model2)
varImpPlot(model2)

#Now we will use 'for' loop and check for different values of mtry
#Using a For-loop to identify the right "mtry" for the model
a=c()
i=5#value of 5 is greater than nmber of predictor variables
ValidSet$Condition<-as.factor(ValidSet$Condition)
for(i in 3:8){
  model3<-randomForest(Condition~.,data=TrainSet,ntree=500,mtry=i,importance=T)
  predValid<-predict(model3,ValidSet,type="class")
  a[i-2]=mean(predValid==ValidSet$Condition)
} #she runs but she aint pretty. mtry had to be set to lower valid value ig
a
plot(3:8,a)

#Now we have seen the implimentation of randomForest and understood the import-
#ance of the model
#Lets compare this model with decision tree and see how decision trees fare in 
#comparison to randomForest
#Compare with decision tree
library(rpart)
install.packages('caret',dependencies = T)
library(caret)
install.packages('e1071',dependencies = T)
library(e1071)
#We will compare model1 of randomForest with decision tree
model_dt<-train(Condition~.,data=TrainSet,method="rpart")
model_dt_1=predict(model_dt,newdata=TrainSet) #newdata not just data or throws Error
table(model_dt_1,TrainSet$Condition)
mean(model_dt_1==TrainSet$Condition)
#On the training dataset the accuracy is around 79.4% and there is a lot of misclass-
#ification. Now look at the validation dataset
#Running the validation dataset
model_dt_vs<-predict(model_dt,newdata=ValidSet)
table(model_dt_vs,ValidSet$Condition)
mean(model_dt_vs==ValidSet$Condition)
