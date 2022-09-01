library(caret)
library(kernlab)
library(tidyverse)

data("GermanCredit")
subCredit <- GermanCredit[,1:10]
str(subCredit)

# Quesiton 1
help("GermanCredit")
# This data set uses so many attributes to eveluate single person's credit worthiness: good or bad.

# Question 2
trainList <- createDataPartition(y=subCredit$Class,p=.40,list=FALSE)
trainList

# Question 3
# It has 400 cases number.

# Question 4
# It randomly select data into a data set called the trainlist.
# It represents the index row got picked and put into the trainlist.
# The proportion of both good and bad data should be 50:50.

# Quesiton 5
trainSet <- subCredit[trainList,]
view(trainSet)

# Question 6
testSet <- subCredit[-trainList,]
view(testSet)

# Question 7
boxplot(Duration ~ Class, data = subCredit)
boxplot(Amount ~ Class, data = subCredit)
boxplot(InstallmentRatePercentage ~ Class, data = subCredit)
boxplot(ResidenceDuration ~ Class, data = subCredit)
boxplot(Age ~ Class, data = subCredit)
boxplot(NumberExistingCredits ~ Class, data = subCredit)
boxplot(NumberPeopleMaintenance ~ Class, data = subCredit)
boxplot(Telephone ~ Class, data = subCredit)
boxplot(ForeignWorker ~ Class, data = subCredit)

# Question 8
q8 <- ksvm(Class ~., data = trainSet, C = 5, cross = 3, prob.model	=	TRUE)

# Question 9
# I think it is a good model since the Cross Validation Error is less than 0.50.

# Question 10
predOut <- predict(q8, newdata=testSet)
summary(predOut)

# Question 11
str(predOut)

confMatrix <- table(predOut,testSet$Class)
confMatrix

# Question 12
errorRate <- (sum(confMatrix) - sum(diag(confMatrix))) / sum(confMatrix)

# Question 13
confusionMatrix(predOut, testSet$Class)