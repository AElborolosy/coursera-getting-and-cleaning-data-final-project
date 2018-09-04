# Coursera Getting and Cleaning Data Final Project
library(dplyr)

# Load the files and rename columns based on their activity labels.
# Activities value
activities <- read.table('./UCI HAR Dataset/activity_labels.txt')
features <- read.table('./UCI HAR Dataset/features.txt')

subject.training.data <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subject.testing.data <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subject.data <- rbind(subject.training.data, subject.testing.data)
names(subject.data) <- "SubjectID"

x.training.data <- read.table('./UCI HAR Dataset/train/X_train.txt')
x.testing.data <- read.table('./UCI HAR Dataset/test/X_test.txt')
x.data <- rbind(x.training.data, x.testing.data)
names(x.data) <- features$V2

y.training.data <- read.table('./UCI HAR Dataset/train/y_train.txt')
y.testing.data <- read.table('./UCI HAR Dataset/test/y_test.txt')
y.data <-
  rbind(y.training.data, y.testing.data)
#  lapply(FUN = function (x) {gsub(x, activities$V2[x], x)})
names(y.data) <- "Activity"
# Merge the training and testing data together.
unfiltered.data.set <- cbind(subject.data, x.data, y.data)

# Generate list of columns to keep
mean.std.features <- grep("mean|std", features$V2, ignore.case = TRUE)

# Filter data set accordingly and then rename it
filtered.data.set <-
  cbind(subject.data, x.data[, mean.std.features], y.data) %>%
  as_tibble

# Replace activity labels with their values.
filtered.data.set$Activity <- factor(filtered.data.set$Activity,
                                     levels = activities[,1],
                                     labels = activities[,2])

# Create an independent table that has the mean of each activity and subject
filtered.data.set$SubjectID <- factor(filtered.data.set$SubjectID)

avg.data.set <-
  filtered.data.set %>%
  group_by(SubjectID, Activity) %>%
  summarise_all(mean)

write.csv(avg.data.set, "summarised-data.csv", row.names = FALSE)