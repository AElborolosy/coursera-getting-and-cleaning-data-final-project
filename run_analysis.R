# Coursera Getting and Cleaning Data Final Project

# Part 1
# Merge the training and test sets to create one data set

subject.training.data <- read.csv('./UCI HAR Dataset/train/subject_train.txt')
x.training.data <- read.csv('./UCI HAR Dataset/train/X_train.txt')
y.training.data <- read.csv('./UCI HAR Dataset/train/y_train.txt')

subject.testing.data <- read.csv('./UCI HAR Dataset/test/subject_test.txt')
x.testing.data <- read.csv('./UCI HAR Dataset/test/X_test.txt')
y.training.data <- read.csv('./UCI HAR Dataset/test/y_test.txt')