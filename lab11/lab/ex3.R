# Zadanie 3, lab5, Paweł Mendroch

library(ISLR)
library(gam)

Wage = na.omit(Wage)
attach(Wage)

# Przykład z konspektu GAM w GLM

fit.logistic.gam <- gam(I(wage > 250) ~ year + s(age, df = 5) + education, family = binomial, data = Wage)
summary(fit.logistic.gam)

pred.gam = predict(fit.logistic.gam, se.fit = TRUE)
errors = cbind(education, pred.gam$se.fit)
aggregate(errors[,2], list(education), mean)

# Widzimy ogromną różnicę błędu między poziomem pierwszym, a pozostałymi czterema:
# 235, a pozostałe 0.3 do 0.65.
# Chcemy następnie dopasować ten sam model regresji logistycznej wykluczając < HS Grad.

WageNew = Wage[!c(Wage[["education"]] == "1. < HS Grad"),]

attach(WageNew)

# Dopasowujemy nowy model do tej samej regresji logistycznej, tym razem bez poziomu pierwszego edukacji

fit.logistic.gamNew <- gam(I(wage > 250) ~ year + s(age, df = 5) + education, family = binomial, data = WageNew)
summary(fit.logistic.gamNew)
