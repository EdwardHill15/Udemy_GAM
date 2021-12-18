


setwd("D:/Udemy/Linear Regression GLMs and GAMs with R")
getwd()
head(mtcars)
mtcars <- mtcars
library(readr)
heart <- read_csv("data/heart.csv")
View(heart)
heart <- as.data.frame(heart)
heart
p <- heart$ha /(heart$ha+heart$ok)
p
plot(heart$ck,p,xlab="Creatinine kinase level",
     ylab="Proportion Heart Attack")
mod.0 <- glm(cbind(ha,ok)~ck, family=binomial
             (link=logit),data=heart)
mod.0
par(mfrow=c(2,2))
plot(mod.0)
plot(heart$ck,p,xlab="Creatinine Kinase level",
     ylab="Proportion Heart Attack")
lines(heart$ck,fitted(mod.0))
mod.2 <- glm(cbind(ha,ok)~ck+I(ck^2)+I(ck^3),
             family=binomial, data=heart)
mod.2
par(mfrow=c(2,2))
plot(mod.0)

par(mfrow=c(1,1))
plot(heart$ck,p,xlab="Creatinine Kinase level",
       ylab="Proportion Heart Attack")
lines(heart$ck,fitted(mod.2))

anova(mod.0,mod.2,test="Chisq")


y <- c(12,14,33,50,67,74,123,141,165,204,253,246,240)
t <- 1:13
plot(t+1980,y,xlab="Year",ylab="New AIDS Cases",ylim=c(0,280))


m0 <- glm(y~t,poisson)
m0

m1 <- glm(y~t+I(t^2),poisson)
plot(m1)
summary(m1)
plot(m2)
summary(m2)
plot(m3)

beta.1 <- summary(m1)$coefficients[2,]
ci <- c(beta.1[1]-
            1.96*beta.1[2],beta.1[1]+1.96*beta.1[2])
ci # print 95% CI for beta_1

new.t <- seq(1,13,length=100)
fv <- predict(m1,data.frame(t=new.t),se=TRUE)
plot(t+1980,y,xlab="Year",ylab="New AIDS Cases",ylim=c(0,280))
lines(new.t+1980,exp(fv$fit))
lines(new.t+1980,exp(fv$fit+2*fv$se.fit),lty=2)
lines(new.t+1980,exp(fv$fit-2*fv$se.fit),lty=2)

head(warpbreaks)
wm <- lm(breaks~wool*tension,data=warpbreaks)
par(mfrow=c(2,2))
plot(wm)
anova(wm)
with(warpbreaks, interaction.plot(tension, wool, breaks))






