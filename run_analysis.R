# Coursera Getting and Cleaning Data Final Project

# Merge the training and test sets to create one data set
subject.training.data <- read.table('./UCI HAR Dataset/train/subject_train.txt')
x.training.data <- read.table('./UCI HAR Dataset/train/X_train.txt')
y.training.data <- read.table('./UCI HAR Dataset/train/y_train.txt')

subject.testing.data <- read.table('./UCI HAR Dataset/test/subject_test.txt')
x.testing.data <- read.table('./UCI HAR Dataset/test/X_test.txt')
y.testing.data <- read.table('./UCI HAR Dataset/test/y_test.txt')

training.data <- cbind(subject.training.data, x.training.data, y.training.data)
testing.data <- cbind(subject.testing.data, x.testing.data, y.testing.data)

data.set <- rbind(training.data, testing.data)

activites <- read.table('./UCI HAR Dataset/activity_labels.txt')
features <- read.table('./UCI HAR Dataset/features.txt')

mean.std.features <- grep("mean|std", features$V2)
desired.data.set <- data.set[,mean.std.features]