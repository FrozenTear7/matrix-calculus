# Zadanie 2, lab5, Paweł Mendroch

library(ISLR)

Wage = na.omit(Wage)
attach(Wage)

age.lims <- range(age)
age.grid <- seq(age.lims[1], age.lims[2])

fit.poly <- lm(wage ~ poly(age, 15), data = Wage)
pred.poly <- predict(fit.poly, list(age = age.grid), se.fit = TRUE)

fit.ns <- lm(wage ~ ns(age, df = 15), data = Wage)
pred.ns <- predict(fit.ns, list(age = age.grid), se.fit = TRUE)

plot(age, wage, cex = 0, col = "darkgrey")
lines(age.grid, pred.poly$fit, col = "red", lwd = 2)
lines(age.grid, pred.ns$fit, col = "aquamarine3", lwd = 2)

# Na wykresie widać, że naturalny splajn nie powoduje na końcu efektu Rungego co jest widoczne
# przy wielomianie stopnia 15