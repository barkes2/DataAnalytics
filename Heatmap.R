set.seed(12345)
help("par")
par(mar=rep(0.2,4))
data_matrix<-matrix(rnorm(400),nrow-40)
image(1:10,1:40,t(data_matrix)[,nrow(data_matrix):1])
heatmap(data_matrix)
set.seed(678910)
for(i in 1:40){
  coin_Flip<-rbinom(1,size=1,prob=0.5)
  if(coin_Flip){
    data_matrix[1,]<-data_matrix[1,]+rep(c(0,3),each=5)
  }
}
par(mar=rep(0.2,4))
image(1:10,1:40,t(data_matrix)[,nrow(data_matrix):1])