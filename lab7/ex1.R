Auto = read.csv("Auto.csv", header=TRUE)

# Ex1
mpg_mean <- mean(Auto$mpg)
mpg_mean

# Ex2
mean(Auto$mpg[Auto$cylinders == 4])

# Ex3
nrow(Auto[Auto$mpg > mpg_mean,])

# Ex4
min(Auto[Auto$mpg > mpg_mean,]$cylinders)