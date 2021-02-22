#call the naivebayes classifier package e1071 which auto calls the class package
iris
library("e1071")
classifier<-naiveBayes(iris[,1:4],iris[,5])
table(predict(classifier, iris[,-5]),iris[,5],dnn=list('predicted','actual'))
classifier$apriori
classifier$tables$Petal.Length
plot(function(x)dnorm(x,1.462,0.1736640),0,8,col="red",main="Petal length distribution for the 3 different species")
curve(dnorm(x,4.260,0.4699110),add=TRUE,col="blue")
curve(dnorm(x,5.552,0.5518947),add=TRUE,col="green")
#===================================================================================================================
#Decision trees
#Install the following library/packages
library(rpart)
library(rpart.plot)
iris #use the iris dataset
dim(iris) 
# (below) creating a sample from the iris dataset
s_iris<-sample(150,100)
s_iris
#create testing and training sets
iris_train<-iris[s,iris,]
iris_test<-iris[s_iris,]
dim(iris_test)
dim(iris_train)
#generate the decision tree model
dectionTreeModel<-rpart(Species~.,iris_train,method="class")
dectionTreeModel
#plotting the decision tree model using rpart.plot() function
rpart.plot(dectionTreeModel)
