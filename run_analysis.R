# Coursera Getting and Cleaning Data Final Project
library(dplyr)

# Merge the training and test sets to create one data set

# Load the files, renaming the columns for the subject & y data to avoid naming issues
subject.training.data <- read.table('./UCI HAR Dataset/train/subject_train.txt')
names(subject.training.data) <- "Activity"

y.training.data <- read.table('./UCI HAR Dataset/train/y_train.txt')
names(y.training.data) <- "Result"

subject.testing.data <- read.table('./UCI HAR Dataset/test/subject_test.txt')
names(subject.testing.data) <- "Activity"

y.testing.data <- read.table('./UCI HAR Dataset/test/y_test.txt')
names(y.testing.data) <- "Result"

x.training.data <- read.table('./UCI HAR Dataset/train/X_train.txt')
x.testing.data <- read.table('./UCI HAR Dataset/test/X_test.txt')

activites <- read.table('./UCI HAR Dataset/activity_labels.txt')
features <- read.table('./UCI HAR Dataset/features.txt')

# Combine the training data tables by column, same w/ testing data
# Combine the training and testing data together by rows
training.data <- cbind(subject.training.data, x.training.data, y.training.data)
testing.data <- cbind(subject.testing.data, x.testing.data, y.testing.data)
unfiltered.data.set <- rbind(training.data, testing.data)

# Generate list of columns to keep
mean.std.features <- grep("mean|std", features$V2, ignore.case = TRUE)
mean.std.features <- sapply(mean.std.features,
                            function (x) {paste0("V", as.character(x))})

# Replace the V-names with their matching activity label


# Add the Activity and Result column names
mean.std.features <- append(mean.std.features, "Activity", 0)
mean.std.features <- append(mean.std.features, "Result")

# Filter data set accordingly and then rename it
filtered.data.set <- unfiltered.data.set[, mean.std.features]
names(filtered.data.set) <- mean.std.features
