data=read.csv("new.csv")
x=data$Net.Loss..Barrels.
mean_pop=mean(x) #231.0112
mean_pop

data1=data[data$Pipeline.Type=="UNDERGROUND",]
write.csv(data1,file="sample_pop.csv")

data2=read.csv("sample_pop.csv")
y=data2$Net.Loss..Barrels.

#HYPOTHESIS TESTING
#NULL Hypothesis => mean = 231.0112
#ALT. Hypothesis => mean != 231.0112

t.test(y,mu=mean_pop)

#mean of y = 529.9476
#Hence, Null hyp is rejected

boxplot(y)
# More outliers implies more probablity of rejecting Null Hyp