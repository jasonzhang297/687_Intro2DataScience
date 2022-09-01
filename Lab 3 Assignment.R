# Question 1
help("state.x77")

# Question 2
dfStates77 <- state.x77
dfStates77

# Question 3
summary(dfStates77)

# Question 4
totalPop77 <- sum(dfStates77[,'Population'])
totalPop77

# Question 5
library(tidyverse)
dfStates17 <- read_csv("https://intro-datascience.s3.us-east-2.amazonaws.com/statesNew.csv")
dfStates17

# Question 6
summary(dfStates17)

# Question 7
totalPop17 <- sum(dfStates17[,'population'])
totalPop17

# Question 8
ratio <- totalPop77/totalPop17

# Question 9
popDensity <-  function (pop, area) {
  popDens <- pop/area
  return(popDens)
}

# Question 10
dfStates77 <- as.data.frame(state.x77)

# Quesstion 11
tempPop <- dfStates77[,'Population']
tempPop

# Question 12
tempArea <- dfStates77[,'Area']
tempArea

# Question 13
popDensity(tempPop, tempArea)

# Question 14
dfStates77 <- rownames_to_column(dfStates77, var="popDensity")

# Question 15
slice (dfStates77, which.max (dfStates77 $ popDensity))
slice (dfStates77, which.min (dfStates77 $ popDensity))

# Question 16
slice (dfStates77, 1)

# Qestion 17
sort (dfStates77 $ popDensity)
# From smallesr value to largest value.