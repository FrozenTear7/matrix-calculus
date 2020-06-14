# Zadanie 1, lab6, Paweł Mendroch

library(randomForest)
library(MASS)

medv.bag <- randomForest(medv ~ ., data = Boston, importance = TRUE)
medv.bag

plot(medv.bag, type = "l")

importance(medv.bag)

varImpPlot(medv.bag)