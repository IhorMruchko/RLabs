get_variant <- function(group, student_position) {
  group * 25 + student_position
}

get_percentage <- function(group, student_position) {
  set.seed(get_variant(group, student_position))
  round(runif(1, min = group + 5, max = 25 - group)) / 100
}

get_indexes <- function(dataset, percentage) {
  sample(seq(from = 1, to = length(dataset[, 1])),
         round(length(dataset[, 1]) * percentage))
}

remove <- function(dataset, percentage) {
  dataset[-get_indexes(dataset, percentage), ]
}

left <- function(dataset, percentage) {
  dataset[get_indexes(dataset, percentage), ]
}
group <- 2
student_position <- 9
variant <- get_variant(group, student_position)
percentage <- get_percentage(group, student_position)
