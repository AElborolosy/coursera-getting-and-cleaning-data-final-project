# coursera-getting-and-cleaning-data-final-project
Final Project for the JHU Data Science Course, Getting and Cleaning Data.

The script reads the training and testing data as well the subject IDs from their respective text files. The data sets are renamed based on their feature names and then merged. The subject IDs are encoded as a factor and the activities are converted from their numeric labels to their names (i.e: 1 -> Walking).

This dataset is then grouped by SubjectID and Activity before being summarised by mean. The end result is saved as a .txt file "summarised-data.txt".
