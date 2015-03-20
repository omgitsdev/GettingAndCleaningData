downloadFile <- function() {
  if (!file.exists("UCI HAR Dataset/")) {
    download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ', 'dataset.zip', method='curl')
    unzip('dataset.zip')
    file.remove('dataset.zip')
  }
}

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

data <- rbind(X_train, X_test)
labels <- rbind(Y_train, Y_test)
subjects <- rbind(subject_train, subject_test)

names(data) = features[[2]]
names(labels) = c("activityid")
names(subjects) = c("subjects")

mean_index_array <- grep("mean[^F]", features[[2]])
std_index_array <- grep("std", features[[2]])
merged <- unique(c(mean_index_array, std_index_array))

indexed_data <- data[merged]

names(activity_labels) = c("activityid", "activityname")

activities <- merge(activity_labels, labels, "activityid")
indexed_data$activities <- activities[[2]]
indexed_data$subjects <- subjects[[1]]

names(indexed_data) <- gsub("\\(\\)","",names(indexed_data))
names(indexed_data) <- gsub("std","Std",names(indexed_data))
names(indexed_data) <- gsub("mean","Mean",names(indexed_data))
names(indexed_data) <- gsub("-","",names(indexed_data))

second_set <- aggregate(indexed_data, by=list(activity = indexed_data$activities, subject=indexed_data$subjects), mean)

write.table(second_set, "output.txt", row.name=FALSE)