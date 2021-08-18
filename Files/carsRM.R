head(cars)
cor(cars$speed,cars$dist)

linearMod=lm(dist~speed,data=cars)

summary(linearMod)

modelSummary=summary(linearMod) #model summary as object
modelCoeffs=modelSummary$coefficients  #model coeffs
beta.estimate=modelCoeffs["speed","Estimate"]  #get beta estimate
std.error=modelCoeffs["speed","Std. Error"] #get std error for speed
t_value=beta.estimate/std.error #calculate t
p_value=2*pt(-abs(t_value),df=nrow(cars)-ncol(cars)) #calc p value

f_statistic=linearMod$fstatistic[1] #fstatistic
f=summary(linearMod)$fstatistic #parameters for model p-value calc
model_p=pf(f[1],f[2],f[3],lower=FALSE)

t_value
p_value
f
model_p

AIC(linearMod)
BIC(linearMod)

#prediction
#1.creating training and test
set.seed(100)
trainingRowIndex=sample(1:nrow(cars),0.8*nrow(cars))
trainingData=cars[trainingRowIndex,] #model training
testData=cars[-trainingRowIndex,] #test data

#2.developing the model
lmMod=lm(dist~speed,data=trainingData) #bluiding model
distPred=predict(lmMod,testData) #predict distance
distPred

#3.Review Diagnostic measures
summary(lmMod)
#p value and predictor p value are less than significance level
#hence we have a statistically significant model

#4.Prediction accuracy and error rates
actuals_preds=data.frame(cbind(actuals=testData$dist,predicteds=distPred))
correlation_accuracy=cor(actuals_preds) #82.7%
head(actuals_preds)
