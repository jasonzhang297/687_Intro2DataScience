# Question 1
library(MASS)
library(ggplot2)
ggplot(data=Boston) +  aes(x=rm, y=medv) + geom_point() + geom_smooth(method="lm", se=FALSE)

?Boston

# Question 2
ggplot(data=Boston) +  aes(x=crim, y=medv) + geom_point() + geom_smooth(method="lm", se=FALSE)

# Question 3
hist(Boston$crim)
# It will not be a bell shape. Highest frequency appears between 0 and 20.

# Question 4
elmOut <- lm(medv ~ crim, data=Boston)
summary(elmOut)

# Question 5
elmOut2 <- lm(medv ~ crim + rm + dis, data=Boston)
summary(elmOut2)

# Question 6
# Adjusted R-squared values 0.5399 indicates that the two factors account for 53.99% of dependent variable (medv). p-value: < 2.2e-16. Boston$crim & Boston$rm & Intercept, the Boston$dis doesn't matter.
# Boston$crim: -0.25 / Boston$rm: 8.34 / Intercept:-29.46


# Question 7
median(Boston$crim)
median(Boston$dis)
median(Boston$rm)
predDF  <-  data.frame(crim  =  0.26,  dis=3.2,  rm=6.2)
predDF

# Question 8
predict(elmOut2, predDF)
# 22.60