library(MASS)

lmFit5 <- lm(medv ~ poly(lstat, 5), data = Boston)
lmFit6 <- lm(medv ~ poly(lstat, 6), data = Boston)

summary(lmFit5)
summary(lmFit6)

anova(lmFit5, lmFit6)

# Patrząc na wyniki summary można stwierdzić, że model lmFit6 jest w niewielkim stopniu lepszy
# (lmFit 5 vs 6) RSE 5.215 vs 5.212 oraz Mul. R-Sq 0.6817 vs 0.6827
# lmFit6 ma odrobinę mniejszy błąd oraz R-squared jest bliższe 1

# anova mówi nam, po ostatniej kolumnie ostatniej Pr(>F) dającej wynik 0.2123, że modele są nieistotnie lepsze
# prawdopodobieństwo, że dopasowanie stopnia 6 jest nieistotnie lepsze niż 5