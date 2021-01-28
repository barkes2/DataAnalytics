#01/28/2021
#R refresher
#Ctrl + L clear console
install.packages("MASS") #install the MASS package
library(MASS) #loads the library MASS
attach(Boston) #attaches the dataset
?Boston #help function with "?" gives descriptions
head(Boston) #shows the head of the dataset
head(Boston, 10)
tail(Boston, 15)
dim(Boston) #dimensions of the dataset
names(Boston) #column names
str(Boston) #str function shows the structure of the dataset
nrow(Boston) #function shows the number of rows
ncol(Boston) #function shows the number of columns
summary(Boston)#summary() function shows the summary statistics
summary(Boston$crim) #summary of the "crime" column in the Boston dataset
#END
