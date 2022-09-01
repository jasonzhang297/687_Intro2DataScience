# Lab 10 Assignment
# By Yunhan Zhang

library(arules)
library(arulesViz)

data (Groceries) # Load data into memory
myGroc <- Groceries # Make a copy for safety
summary(myGroc) # What is the structure?

# Question 1
# There are 9835 different transactions. 169 different items. We can see 2159 transaction has 1 item and so on. The average items/transaction are 4.409. The most frequent bought item is milk.

# Queston 2
q2 <- itemFrequency(myGroc)
str(q2) # It lists all 169 items and their bought density.
sortedq2 <- sort(q2)
head(sortedq2)
tail(sortedq2) # Whole milk is the most frequently purchased item.

# Question 3
itemFrequencyPlot(myGroc, topN=20) # Y-axis means the frequency from the top 20 purchased items.

# Question 4
ct	<- crossTable(myGroc,	sort=TRUE)
ct[1:2,	1:3]
# 736 means the amount of purchases with whole milk & vegatables.
# Diagonal of	the	matrix can gives the raw frequency of single item.

# Question 5
rules1 <- apriori(myGroc, parameter=list(supp=0.0008, conf=0.55), control=list(verbose=F), 
                  appearance=list(default="lhs",rhs=("bottled beer")))

# Question 6
inspect(rules1)

# Question 7
rules2 <- apriori(myGroc, parameter=list(supp=0.0005, conf=0.55), control=list(verbose=F), 
                  appearance=list(default="lhs",rhs=("bottled beer")))
inspect(rules2)
# It does not quite makes sense. For the following rules, when I decreased the support, it does not generate enough cases.

# Question 8
data(mtcars)
mynewdata <- mtcars
view(mynewdata)

mynewdata_2 <- mynewdata %>%
  mutate(condition2 = case_when(mpg > 25 ~ "Good",
                                TRUE ~ 'Bad'))
mynewdata_2 <- as(mynewdata_2, "transactions")
rules3 <- apriori(mynewdata_2, parameter=list(supp=0.5, conf=0.55), control=list(verbose=F), 
                  appearance=list(default="lhs",rhs=("condition2=Bad")))
inspect(rules3)