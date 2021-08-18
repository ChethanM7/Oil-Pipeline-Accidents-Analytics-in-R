op=read.csv("datasetmain.csv")
op
summary(op)
head(op)


#splitting data into training and test

set.seed(2)
library(caTools)
split=sample.split(op,SplitRatio = 0.8)
split

train=subset(op,split="TRUE")
test=subset(op,split="FALSE")

#create the model
net=train$Net.Loss..Barrels.
unint=train$Unintentional.Release..Barrels.
rec=train$Liquid.Recovery..Barrels.
int=train$Intentional.Release..Barrels.
model=lm(net~(unint+int+rec),data=train)
summary(model)

#prediction

pred=predict(model,test)
plot(test$Net.Loss..Barrels.,type="l",lty=1.8,col="red")
lines(pred,type="l",col="blue")

#Finding the accuracy
rmse = sqrt(mean(pred-op$Net.Loss..Barrels.)^2)
rmse

#correlation 
cor(op$Net.Loss..Barrels.,op$Unintentional.Release..Barrels.)

head(test$Net.Loss..Barrels.)
head(pred)

