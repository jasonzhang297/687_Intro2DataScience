# Question 1
set.seed(2)
#It sets the starting number as "2" used to generate a sequence of random numbers.
sampleSize <-  30
#The sample comtains total number of 30 students.
studentPop <-  rnorm(20000,mean=20,sd=3)
# It returns 20000 values that the mean equals to 20 and standard deviation equals to 3 store into studentpop.
undergrads <-  sample(studentPop,size=sampleSize,replace=TRUE)
# It draws 30 times from studentpop and it can be replaced.
grads <-  rnorm(sampleSize,mean=25,sd=3)
# It returns 30 values that the mean equals to 25 and standard deviation equals to 3 store into grads.
if (runif(1)>0.5) { testSample <-  grads } else { testSample <-  undergrads }
#If the result is bigger than 0.5, then test sample is grads else it's undergrads.
mean(testSample)
# Calculate the mean of testSample is 24.89729.

# Question 2
sample(undergrads, size=10, replace=TRUE)

# Question 3
mean(sample(undergrads, size=10, replace=TRUE))

# Question 4
replicate(3, mean(sample(undergrads, size=10, replace=TRUE)))

# Question 5
sample <- replicate(100, mean(sample(undergrads, size=10, replace=TRUE)))
sample

# Question 6
# Towards the right end.
abline(v=qnorm(0.975))
abline(v=qnorm(0.025))
quantile(undergrads,probs=c(0.025,0.975))

# Question 7
print('Sample mean is not extreme.')

# Question 8
# testSample is undergrads students. 19.52719 is the mean.

# Question 9
# Once the mean is 24.89729, then it is grads students, 50/50 chance.