#k-fold cross-validation
#cv.glm() can also implement k-fold-CV
#we should set random seed and initialize vector in which we store the CV errors
#corresponding to the polynomial fits of orders on to ten
#here K is 10
library(ISLR)
library(MASS)#dataset from this one
library(boot)
set.seed(17)
#help("rep")
cv.error.10=rep(0,10)
for(i in 1:10){
  glm.fit=glm(mpg~poly(horsepower,i),data=Auto)
  cv.error.10[i]=cv.glm(Auto,glm.fit,K=10)$delta[1]
}
cv.error.10
#computaion time is low compared to L00CV 
#little evidence for cubic, or high order polynomial
#terms leads to lower test error that simply using quadratic fit