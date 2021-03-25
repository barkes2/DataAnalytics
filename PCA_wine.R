#Work on code snippets 
winedata<-read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/w
                     ine/wine.data",
sep=",")
head(winedata)
#manually assigning names for each column, need to read documentation
nrow(winedata)
colnames(winedata)<-c("Cvs", "Alcohol","Malic_Acid", "Ash", "Alkalinity_of_Ash",
                      "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_
                      Phenols","Proanthocyanins", "Color_Intensity", "Hue", "OD2
                      80/OD315_of_Diluted_Wine","Proline")
head(winedata)
help("heatmap")
heatmap(cor(winedata),Rowv=NA,Colv=NA)
cultivar_classes<-factor(winedata$Cvs)
cultivar_classes
winedata_PCA<-prcomp(scale(winedata[,-1]))
summary(winedata_PCA)
#we can see PC1 gives the 36.2% cumulative contribution, which indicates
#that PC1 represents 36.2% variance