require(rpart)
swiss_rpart<-rpart(Fertility~Agriculture+Education+Catholic,data=swiss)
plot(swiss_rpart)#trying some different plot options
text(Swiss_rpart)#ditto for text
require(party)
treeSwiss<-ctree(Species~.,data=iris)
plot(treeSwiss)
cforest(Species~.,data=iris,controls=cforest_control(mtry=2,mincriterion=0))
treeFert<-ctree(Fertility~Agriculture+Education+Catholic,data=swiss)
cforest(Fertility~Agriculture+Education+Catholic,data=swiss,controls=cforest_control(mtry=2,mincriterion=0))
library(tree)
tr<-tree(Species~.,data=iris)
tr
tr$frame
plot(tr)
text(tr)
