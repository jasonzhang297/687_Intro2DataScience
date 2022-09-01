# Question 1
# It need "myPlot" to invoke the plot to draw it.
myPlot <-  ggplot(economics, aes(x=date))
myPlot <-  myPlot  + geom_line(aes(y=psavert))
myPlot

# Question 2
help("economics")
# Answer: Psavert means person saving rate

# Question 3
# Answer: It reaches maximum value right after 1975. And it reaches minimum value right after 2005.

# Quesition 4
economics$date[which.max(economics$psavert)]
economics$date[which.min(economics$psavert)]
# Answer: Max: "1975-05-01" & Min: "2005-07-01"

# Question 5
myPlot <-  ggplot(economics, aes(x=date))
myPlot <-  myPlot  + geom_line(aes(y=psavert),col="green")
myPlot

# Question 6
myPlot <-  ggplot(economics, aes(x=date))
myPlot <-  myPlot  + geom_line(aes(y=psavert),col="green") + ggtitle("Personal Savings Rate: 1967-2014")
myPlot

# Question 7
myPlot <-  ggplot(economics, aes(x=date))
myPlot <-  myPlot  + geom_line(aes(y=psavert),col="green") + ggtitle("Personal Savings Rate: 1967-2014")
myPlot <-  myPlot  + geom_line(aes(y=uempmed),col="red")
myPlot

# Question 8
myPlot <-  ggplot(economics, aes(x=date))
myPlot <-  myPlot  + geom_line(aes(y=psavert),col="green") + ggtitle("Personal Savings Rate: 1967-2014 & Median duration of unemployment, in weeks,")
myPlot <-  myPlot  + geom_line(aes(y=uempmed),col="red")
myPlot

# Question 9
myPlot <-  ggplot(economics, aes(x=date))
myPlot <-  myPlot  + geom_line(aes(y=psavert),col="green") + ggtitle("Personal Savings Rate: 1967-2014 & Median duration of unemployment, in weeks,")
myPlot <-  myPlot  + geom_line(aes(y=uempmed),col="red")
myPlot <-  myPlot + ylab("psavert + uempmed")
myPlot

# Question 10
library(tidyverse)
economics %>% ggplot(aes(x=unemploy,y=psavert)) +geom_point(color=economics$uempmed)