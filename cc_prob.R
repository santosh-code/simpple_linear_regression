install.packages("readr")
library(readr)
cc<-read.csv(file.choose())
colnames(cc)<-c("y","x")
#####single variet analysis#####
attach(cc)
summary(x)
summary(y)
#barplot
barplot(x)
barplot(y)
#histogram
hist(x)
hist(y)
#box plot
boxplot(x,horizontal = T)
boxplot(y,horizontal = T)
#qqplot
qqnorm(x)
qqline(x)
qqnorm(log(y))
qqline(log(y))
shapiro.test(log(y))
shapiro.test(y)
######

install.packages("lattice")
library(lattice)
dotplot(x)
dotplot(y)
##correlation
cor(x,y)
####


#####multivariet analysis######
plot(x=y,y=x,main="calories vs weight",xlab = "calories",ylab = "weight",
     col="green",pch=20,col.lab="green",col.main="green")

model<-lm(y~x,data = cc)
summary(model)



shapiro.test(model$residuals)
err<-sqrt(mean(model$residuals^2))
err
#err is 103.25
#r-sqr value=0.89 and adjusted r sq value=0.88
#cor=0.94
#hence its best fit model

