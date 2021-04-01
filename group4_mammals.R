library(MASS)
data(mammals)
mammals
mammals.glm <- glm(log(brain)~log(body),data=mammals)(cv.err<-cv.glm(mammals,mammals.glm)$delta)
(cv.err.6<-cv.glm(mammals,mammals.glm,K=6)$delta)
#leave-one-out cross validation estimate without any extra model-fitting.
muhat<-fitted(mammals.glm)
