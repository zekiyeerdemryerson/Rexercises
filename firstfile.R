#We will use the "thuesen" dataset available in the ISwR package 
#and start by preparing the data environment by carrying out the following commands:

library(ISwR)
attach(thuesen)

#Let’s now investigate the data by checking the first six records and the structure.

head(thuesen)
summary (thuesen)
str(thuesen)

#Let's scatterplot for the data.

plot(thuesen)

#Are there any missing values ? How many and in which column?

sum(is.na(thuesen$short.velocity))
which(is.na(thuesen$short.velocity)) 
sum(is.na(thuesen$blood.glucose))



#We see that blood.glucose column has no missing values 
#but short.velocity column has 1 missing value.

new_thuesen<-na.omit(thuesen)

#Now, let's use linear regression to predict the expected short velocity record
#for a new patient with a blood glucose level of 14.

#Let's remove the missing values of the thuesen data and assign it to a new variable.


lm(short.velocity~blood.glucose, data=new_thuesen)
new_blood_glucose <- 14
new_short_velocity <- 1.09781 +0.02196 *new_blood_glucose

new_short_velocity