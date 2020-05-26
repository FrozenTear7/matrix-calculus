# Zadanie 2, laboratorium wt. 11:15, 19 maja
# Autor: Paweł Mendroch

library(ISLR)
library(boot)
library(leaps)

Hitters = na.omit(Hitters)

fit.bs <- regsubsets(Salary ~ ., data = Hitters, nvmax = 19, method = "backward")
fit.bs.summary <- summary(fit.bs)
adjr2.max = which.max(fit.bs.summary$adjr2)
coef(fit.bs, id = adjr2.max)
fit.bs.summary$adjr2[adjr2.max]

# Najlepsze R^2 wychodzi równe 0.522 dla 11 predyktorów