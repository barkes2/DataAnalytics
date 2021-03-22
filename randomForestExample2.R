require(randomForest)
fitKF<-randomForest(Kyphosis~Age+Number+Start,data=kyphosis)
print(fitKF)
importance(fitKF)