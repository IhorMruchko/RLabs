source("e:\\Programming\\R\\RLabs\\RBasic.R", encoding = "UTF-8")

collage_dataset <-
  read.csv("e:\\Programming\\R\\RLabs\\RFirstLab\\College.csv", header = TRUE)
percentage <- get_percentage(2, 9)
collage_dataset_varianted <- remove(collage_dataset, percentage)
fix(collage_dataset_varianted)

collages_without_names <- collage_dataset_varianted[, -1]
collages_without_names$Private <-
  ifelse(collages_without_names$Private == "Yes", 1, 0)

collages_without_names$Private <- as.factor(collages_without_names$Private)

plot(collages_without_names$Private, collages_without_names$Outstate)

fix(collages_without_names)

summary(collages_without_names)

pairs(collages_without_names)

pairs(data.frame(collages_without_names$Accept,
                 collages_without_names$Top25perc,
                 collages_without_names$PhD))

plot(collages_without_names$Private, collages_without_names$Outstate)

elite <- rep(FALSE, nrow(collages_without_names))
elite[collages_without_names$Top10perc > 50] <- TRUE
elite <- as.logical(elite)
collages_without_names <- data.frame(collages_without_names, elite)
fix(collages_without_names)
print(length(which(elite)))
print(sum(elite == FALSE, na.rm = TRUE))

elite <- as.factor(elite)
plot(elite, collages_without_names$Outstate)
library(MASS)
boston_varianted <- remove(Boston, percentage)
print(nrow(Boston))
print(ncol(Boston))
print(nrow(boston_varianted))

print(sum(boston_varianted$chas == 1))
print(median(boston_varianted$ptratio))
print(which(boston_varianted$ptratio == min(boston_varianted$ptratio)))
print(which(boston_varianted$ptratio == max(boston_varianted$ptratio)))

print(which(boston_varianted$rm > 7))
print(which(boston_varianted$rm > 8))
print(which(boston_varianted$rm > 4 & boston_varianted$rm < 7))