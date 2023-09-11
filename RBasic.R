get_percentage <- function(group, student_position){
	set.seed(group*25 + student_position)
	round(runif(1, min=group + 5, max=25-group)) / 100
}

get_indexes <- function(dataset, percentage){
	sample(1:length(dataset[,1]), round(length(dataset[,1])*percentage))
}

remove <- function(dataset, percentage){
	dataset[-get_indexes(dataset, percentage),]
}

left <- function(dataset, percentage){
	dataset[get_indexes(dataset, percentage),]
}