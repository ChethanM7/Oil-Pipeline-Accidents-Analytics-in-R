library(ggplot2)
library(readr)

data=read.csv(file="database.csv",stringsAsFactors=TRUE)

dim(data)
str(data) 
names(data)
attributes(data)

sum(is.na(data))#check for missing values

data[!complete.cases(data),]  #list data rows that has missing values


data$Public.Evacuations[is.na(data$Public.Evacuations)]=0

data$Operator.Employee.Injuries[is.na(data$Operator.Employee.Injuries)]=0

#DELETED COLUMNS

data$Operator.Contractor.Injuries=NULL
data$Emergency.Responder.Injuries=NULL
data$Other.Injuries=NULL
data$Public.Injuries=NULL
data$All.Injuries=NULL
data$Operator.Employee.Fatalities=NULL
data$Operator.Contractor.Fatalities=NULL
data$Emergency.Responder.Fatalities=NULL
data$Other.Fatalities=NULL
data$Public.Fatalities=NULL
data$All.Fatalities=NULL


testing=subset(data,!(is.na(data)))
class(testing$Environmental.Remediation.Costs)
mn=mean(testing$Environmental.Remediation.Costs,na.rm=TRUE)
mn
data$Environmental.Remediation.Costs[is.na(data$Environmental.Remediation.Costs)]=mn

#setting NA values zero
data$Property.Damage.Costs[is.na(data$Property.Damage.Costs)]=0
data$Lost.Commodity.Costs[is.na(data$Lost.Commodity.Costs)]=0
data$Public.Private.Property.Damage.Costs[is.na(data$Public.Private.Property.Damage.Costs)]=0
data$Emergency.Response.Costs[is.na(data$Emergency.Response.Costs)]=0
data$Other.Costs[is.na(data$Other.Costs)]=0

#Removing Rows of further NA values  
data=na.omit(data)



write.csv(data,"new.csv")

