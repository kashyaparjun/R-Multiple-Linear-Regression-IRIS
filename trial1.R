# Importing the dataset
dataset = read.csv('iris.csv')


#Encoding catagorical Data
dataset$Species = factor(dataset$Species,
                       levels = c('setosa', 'versicolor', 'virginica'),
                       labels = c(1, 2, 3))


# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Species, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression to trining set
regressor = lm(formula = Petal.Width ~ .,
               data = training_set)

#Predicting test set
y_pred = predict(regressor, newdata = test_set)

#Backward elimination
regressor = lm(formula = Petal.Width ~ Sepal.Width + Petal.Length + Species,
               data = dataset)
summary(regressor)


#Dataset 2
dataset2 = read.csv('iris2.csv')
library(caTools)
set.seed(123)
split = sample.split(dataset2$Species, SplitRatio = 0.8)
training_set2 = subset(dataset2, split == TRUE)
test_set2 = subset(dataset2, split == FALSE)

regressor2 = lm(formula = Species ~ .,
               data = training_set2)

y_pred2 = predict(regressor2, newdata = test_set2)

#Backward Elimination
regressor2 = lm(formula = Species ~ Sepal.Width + Petal.Length + Petal.Width,
                data = training_set2)



