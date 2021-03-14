#k-fold cross validation
#the cv.glm() function can also be used to implement k-fold CV
#We again set a random seed and initialize a vector in which we
#will store the CV errors corresponding to the polynomial fits of
#orders one to ten
#here the k=10
#read the cv.glm documentation
??cv.glm
set.seed(17)
help("rep")#read the documentation for the rep() fucntion in R
cv.error.10=rep(0,10)#read documentation, help("rep")
for(i in 1:10){
  gim.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1]
}
cv.error.10
#Notice the computation time is much shorter than LOOCV
#This depends on laptop/computer
#We will see little evidence that using cubic or higher order 
#polynomial terms leads to lower test error than simply using a 
#quadratic fit
