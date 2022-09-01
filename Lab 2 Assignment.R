# Question 1
myIris <-iris

# Question 2
help("iris")

# Question 3
library(tidyverse)

# Question 4
summary(myIris)

# Question 5
myIris$Sepal.Length

# Question 6
sort(myIris$Sepal.Length)

# Question 7
order(myIris$Sepal.Length)

# Question 8
# Sort() put a collection of all the elements into a specific order. And order() returns the indices of the vector in a sorted order.

# Question 9
sortedDF <- myIris[order(myIris$Sepal.Length),]
sortedDF

# Question 10
sortedDF1 <- myIris %>% arrange(Petal.Width)
sortedDF1

# Question 11
view(myIris)

# Question 12
myIris[ , 1]
# It returns the first colum from myIris.

# Question 13
myIris[ , "Sepal.Length"]
myIris$Sepal.Length
# There's no difference between them. They both return the row of Sepal.Length.

# Question 14
select(myIris,Sepal.Length)

# Question 15
myIris <- rownames_to_column(myIris, var="Ave.Length")
myIris$Ave.Length <- (myIris$Sepal.Length + myIris$Petal.Length) / 2

# Question 16
which.min(myIris$Petal.Length)
# It returns the smallest value from myIris$Petal.Length.

# Question 17
myIris[which.min(myIris$Petal.Length),]

# Question 18
newIris <- myIris[,3:4]
newIris

# Question 19
newIris <- slice(myIris,1:3)
newIris

# Question 20
shortPetalDF <- myIris[myIris$Petal.Length < 1.4,]
shortPetalDF

# Question 21
nrow(shortPetalDF)

# Question 22
help("if")
help("Control")
myNumbers <- c(10,20,30,40)
if (sum(myNumbers) >40) print("The sum is greater than 40.")