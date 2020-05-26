# Zadanie 1, laboratorium wt. 11:15, 19 maja
# Autor: Paweł Mendroch

library(ISLR)
library(boot)

comp.mse.cv <- function(degree, k) {
  fit.glm <- glm(mpg ~ poly(horsepower, degree), data = Auto)
  cv.glm(Auto, fit.glm, K = k)$delta[1]
}

mse10 <- replicate(10, sapply(1:10, comp.mse.cv, k = 10))
mse10

mseMeans10 = rowMeans(mse10)
mseMeans10

plot(rowMeans(mse10), pch = 20, type = "l", ylab = "Blad predykcji", xlab="Stopien wielomianu")


# 1. Najmniejszy MSE w 10-krotnej walidacji krzyżowej daje stopień 5, czasami lepszy wynik daje stopień 2, lecz
# wciąż wygrywa stopień 5.

# 2. Dla zakresu do 10, na wykresie można zauważyć, że najmniejszy średni błąd predykcji
# daje wielomian 7 stopnia