# Zadanie 2, lab6, Paweł Mendroch

library(ISLR)
library(randomForest)
library(tree)
library(gbm)

attach(Carseats)

set.seed(1)

High <- factor(ifelse(Carseats$Sales <= 8, "No", "Yes"))
CarseatsH <- data.frame(Carseats, High)

n <- nrow(CarseatsH)
train <- sample(1:n, n / 2)
test <- -train

# Bagging

sales.high.bag <- randomForest(High ~ . - Sales, data = CarseatsH, mtry = 10, importance = TRUE, subset = train)
sales.high.bag.pred <- predict(sales.high.bag, newdata = CarseatsH[test,], type = "class")

importance(sales.high.bag)
table(sales.high.bag.pred, CarseatsH$High[test])
mean(sales.high.bag.pred != CarseatsH$High[test])

# Wartość błędu wynosi 18.5%

# Las losowy

sales.high.rf <- randomForest(High ~ . - Sales, data = CarseatsH, importance = TRUE, subset = train)
sales.high.rf.pred <- predict(sales.high.rf, newdata = CarseatsH[test,], type = "class")

importance(sales.high.rf)
table(sales.high.rf.pred, CarseatsH$High[test])
mean(sales.high.rf.pred != CarseatsH$High[test])

# Wartość błędu wynosi 18%

# Boosting

CarseatsHB <- CarseatsH
CarseatsHB$High <- ifelse(CarseatsH$High == "Yes", 1, 0)


sales.high.boost <- gbm(High ~ . - Sales, data = CarseatsHB[train,], distribution = "bernoulli", 
                        n.trees = 5000, interaction.depth = 4)
sales.high.boost.pred <- predict(sales.high.boost, newdata = CarseatsH[test,], n.trees = 5000)
sales.high.boost.pred <- ifelse(sales.high.boost.pred <= 0.5, 0, 1)

importance(sales.high.rf)
table(sales.high.boost.pred, CarseatsHB$High[test])
mean(sales.high.boost.pred != CarseatsHB$High[test])

# Wartość błędu wynosi 14%

# Najmniejszą wartość błędu dał nam boosting, gdzie trochę gorzej prezentują się bagging i las losowy
# z podobną wartością błędu


