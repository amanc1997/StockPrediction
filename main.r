
#import dataset
dataset = read.csv('aa.us.txt')


#Encoding categorical data
#dataset$State = factor(dataset$State
#                       levels = c('New York','Chicago','Washington'
#                       labels = c(1,2,3))



#install package(caTools)
library(caTools)
set.seed(123)


#Testing and Training
split = sample.split(dataset$Close,SplitRatio = 0.8)
training_set = subset(dataset,split == TRUE)
test_set = subset(dataset,split == FALSE)


#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])



#Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Close ~ Open + High + Low + Volume, data = training_set)


#Predicting the Test set result
y_pred = predict(regressor , newdata = test_set)


#Building the model using Backward elimination
regressor = lm(formula = Close ~ Open + High + Low + Volume, data = dataset)
summary(regressor)


#First Backward Elimination
regressor = lm(formula = Close ~ Open + High + Low , data = dataset)
summary(regressor)

#Plotting y_pred against the dependent value from the testset
plot(y_pred,test_set$Close)
