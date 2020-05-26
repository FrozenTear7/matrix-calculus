library(ISLR)
library(MASS)
library(class)
attach(Smarket)

# Setup danych

train <- Year < 2005
Smarket.test <- Smarket[!train,]
Direction.test <- Direction[!train]
y2005index = Year == 2005
Smarket.y2005 = Smarket[y2005index,]
observation6 = Smarket.y2005[6,]

# Zad 1
# Wykorzystując przykład z konspektu podmieniam dane w predict na obserwacje szóstą

fit.logistic <- glm(Direction ~ Lag1 + Lag2, family = binomial, data = Smarket, subset = train)
probs.logistic <- predict(fit.logistic, observation6, type = "response")

1 - probs.logistic # probs.logistic odpowiada wzrostowi, więc musimy odwrócić wartość by otrzymać spadek

# 0.4938612

# Zad 2
# Ponownie używając konspektu zmieniam dane, tym razem nie trzeba odwracać wyniku, posterior[1] zawiera szukany spadek

fit.lda <- lda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
pred.lda <- predict(fit.lda, observation6)
pred.lda$posterior[1]

# 0.4938562

# Zad 3

fit.qda <- qda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
pred.qda <- predict(fit.qda, observation6)
pred.qda$posterior[1]

# 0.4913561

# Zad 4
# W porównaniu do przykładu z konspektu musimy dodać parametr prob = TRUE, aby uzyskać prawdopodobieństwa
# Wstawiam dane obserwacji szóstej w test, wynik ponownie odwracamy 1 - prob

train.set <- Smarket[train, c("Lag1", "Lag2")]
test.set <- observation6[c("Lag1", "Lag2")]
Direction.train <- Direction[train]
probs.knn.10 <- knn(train.set, test.set, Direction.train, k = 10, prob = TRUE)

1 - attributes(probs.knn.10)$prob

# 0.4