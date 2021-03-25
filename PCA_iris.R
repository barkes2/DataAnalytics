data("iris")
head(iris)
iris1<-iris[,1:4]
head(iris1)
principal_components<-princomp(iris1,cor=TRUE,score=TRUE)
summary(principal_components)
plot(principal_components) #using plot() to plot PCs
plot(principal_components,type="l") #generates line plot
biplot(principal_components) #plots components