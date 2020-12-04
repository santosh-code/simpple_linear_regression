library(readr)
sd<-read.csv(file.choose())
View(sd)
colnames(sd)<-c("ye","sal")
##single variet analysis###
attach(sd)
barplot(ye,col = "blue")
barplot(sal,col = "blue")


hist(ye,col="blue")
hist(sal,col="blue")

boxplot(ye,col="blue",horizontal = T)
boxplot(sal,col="blue",horizontal = T)
boxplot(sd)

qqnorm(ye,col="blue")
qqline(ye,col="blue")
shapiro.test(ye)

qqnorm(sal,col='blue')
qqline(sal,col="blue")
shapiro.test(sal)
###bivariet analysis####
plot(x=ye,y=sal,main = "years of exp. vs sal_hike",
     xlab ="years of exp ",ylab = "sal_hike",col="blue",pch=20,col.lab="blue",
     col.main="blue")
cor(ye,sal)
####mode1
model<-lm(sal~ye,data = sd)
summary(model)
pred<-predict(model,interval = "confidence")
pred<-as.data.frame(pred)
pred
err<-pred$fit-sal
sqr_err<-err*err
mse<-mean(sqr_err)
rmse<-sqrt(mse)
rmse
plot(model)

######model2####
plot(log(ye),sal)
cor(log(ye),sal)
model2<-lm(log(sal)~ye,data = sd)
summary(model2)
pred<-predict(model2,interval = "confidence")
exp_pred<-exp(pred)
exp_pred<-as.data.frame(exp_pred)

err<-exp_pred$fit-sal
sqr_err<-err*err
mse<-mean(sqr_err)
rmse<-sqrt(mse)
rmse
#cor-coef=0.95,r2=0.95,err=7213.23
#####model######
model3<-lm(sal~ye+I(ye*ye)+I(ye*ye*ye),data = sd)
summary(model3)
pred<-predict(model3,interval = "confidence")
pred<-as.data.frame(pred)
pred
plot(pred$fit,model3$residuals)
plot(model3)
cor(pred$fit,sd$sal)
err<-sqrt(mean(model3$residuals^2))
err
#r2 value is 0.96 and adjusted r2=0.95,cor-coef=0.98,err=5142.642
#model3 is good fit model

