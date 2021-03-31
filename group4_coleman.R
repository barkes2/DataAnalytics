install.packages('cvTools')
library(cvTools)
library(robustbase)
data(coleman)
head(coleman)
c<-call('lmrob',formula=Y~.)
#set up folds for cross-validation
folds<-cvFolds(nrow(coleman),K=5,R=10)
#perform cross validation
cvTool(c,data=coleman,y-coleman$Y,cost=rtmspe,folds=folds,
       costArgs = list(trim=0.1))
#vary K and R
#look at cvfits, use densityplot
tuning<-list(tuning.psi=seq(2.,6.,20))
cvFitsLmrob<-cvTuning(c,data=coleman$Y,tuning=tuning,cost=rtmspe,folds=folds,
                      costArgs=list(trim=0.1))
cvFitsLmrob#look at output
aggregate(cvFitsLmrob,summary)#summarize