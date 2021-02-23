#abalone dataset from UCI repository
#reading the dataset from UCI repository URL
abalone <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"),header=FALSE,sep=",")
#Column names
colnames(abalone)<-c("sex","length",'diameter','height','whole_weight','shucked_weight','viscera_weight','shell_weight','rings')
#summary on abalone
summary(abalone)
#structure of the abalone data
str(abalone)
#summary of the abalone rings column
summary(abalone$rings)

#"rings" variable has a range between 1-29; we want to predict this variable
#break the rings variable into 3 levels "young"(<8) "adult"(8-11) and "old"(11<)
abalone$rings<-as.numeric(abalone$rings)
abalone$rings<-cut(abalone$rings,br=c(-1,8,11,35),labels=c("young",'adult','old'))
abalone$rings<-as.factor(abalone$rings)
summary(abalone$rings)
#remove sex variable because KNN needs numeric
#z<-abalone
aba<-abalone
aba$sex<-NULL
#normalize the data using min max normalization
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
aba[1:7]<-as.data.frame(lapply(aba[1:7],normalize))
summary(aba$shucked_weight)
