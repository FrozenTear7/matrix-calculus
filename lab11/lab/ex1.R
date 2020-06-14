# Zadanie 1, lab5, Paweł Mendroch

library(ISLR)

Wage = na.omit(Wage)
attach(Wage)

fit.poly <- lm(wage ~ poly(age, 4), data = Wage)
summary(fit.poly)

fit.poly.raw <- lm(wage ~ poly(age, 4, raw = TRUE), data = Wage)
summary(fit.poly.raw)

# Mimo że coefficientsy się różnią między sobą, to wyniki wychodzą identyczne
# Residual standard error: 39.91 on 2995 degrees of freedom
# Multiple R-squared:  0.08626,	Adjusted R-squared:  0.08504
# F-statistic: 70.69 on 4 and 2995 DF,  p-value: < 2.2e-16