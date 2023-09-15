source("RBasic.R", encoding = "UTF-8")

create_mlr <- function(formula, color = "red", p = 19, c = 2) {
  model <- lm(formula)
  print(summary(model))

  layout(matrix(c(1, 2, 3, 4), 2, 2))
  plot(model, pch = p, col = color, cex = c)
}

auto <- read.csv("RSecondLab\\Auto.csv")
print(paste0("Original auto dataframe rows:", nrow(auto)))

auto_varianted <- remove(auto, percentage)
print(paste0("Modified auto dataframe rows:", nrow(auto_varianted)))

linear_model <- lm(auto_varianted$mpg ~ auto_varianted$weight)

create_mlr(auto_varianted$mpg ~ auto_varianted$weight)
plot(auto_varianted$mpg, auto_varianted$weight, col = "red", pch = 19, cex = 2)


library(ISLR)
print(paste0("Original carseats dataframe rows:", nrow(Carseats)))

carseats_varianted <- remove(Carseats, percentage)
print(paste0("Modified carseats dataframe rows:", nrow(carseats_varianted)))

multi_linear_model <- lm(carseats_varianted$Sales ~
                           carseats_varianted$Price +
                             carseats_varianted$Urban +
                             carseats_varianted$US)

print(summary(multi_linear_model))
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(multi_linear_model, pch = 19, col = "darkred", cex = 2)

multi_linear_model_modified <- lm(carseats_varianted$Sales ~
                                    carseats_varianted$Price +
                                      carseats_varianted$US)

print(summary(multi_linear_model_modified))
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(multi_linear_model_modified, pch = 19, col = "darkgreen", cex = 2)


multi_linear_model_modified2 <- lm(carseats_varianted$Sales ~
                                     carseats_varianted$Price +
                                       carseats_varianted$Urban)

print(summary(multi_linear_model_modified2))
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(multi_linear_model_modified2, pch = 19, col = "darkorange", cex = 2)

multi_linear_model_modified3 <- lm(carseats_varianted$Sales ~
                                     carseats_varianted$Price)

print(summary(multi_linear_model_modified3))
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(multi_linear_model_modified3, pch = 19, col = "darkblue", cex = 2)

print(anova(multi_linear_model, multi_linear_model_modified))
print(anova(multi_linear_model, multi_linear_model_modified2))
print(anova(multi_linear_model, multi_linear_model_modified3))

set.seed(variant)
x1 <- runif(100)
x2 <- (variant / 2) * x1 + rnorm(100) * variant / 10
y <- (2 * variant) + variant * x1 + (variant / 3) * x2 + rnorm(100)

y_linear_model <- lm(y ~ x1)
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(y_linear_model, pch = 19, col = "darkblue", cex = 2)

y_linear_model2 <- lm(y ~ x2)
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(y_linear_model2, pch = 19, col = "darkblue", cex = 2)

x1_modified <- c(x1, 0.1)
x2_modified <- c(x2, (variant / 2) * 0.9)
y_modified <- c(y, 5 * variant)

y_linear_model_modified <- lm(y_modified ~ x1_modified)
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(y_linear_model_modified, pch = 19, col = "darkblue", cex = 2)

y_linear_model_modified2 <- lm(y_modified ~ x2_modified)
layout(matrix(c(1, 2, 3, 4), 2, 2))
plot(y_linear_model_modified2, pch = 19, col = "darkblue", cex = 2)