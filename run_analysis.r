##PreProcessing

setwd("C:/Users/e4sc6go/Documents/Coursera DS/Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")
library(plyr)

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# Step 1
subject_data <- rbind(subject_train, subject_test)

# Step 2
x_data <- x_data[, grep("mean|std", read.table("features.txt")[, 2])]
names(x_data) <- read.table("features.txt")[grep("mean|std", read.table("features.txt")[, 2]), 2]

# Step 3
y_data[, 1] <- read.table("activity_labels.txt")[y_data[, 1], 2]
names(y_data) <- "activity"

# Step 4
names(subject_data) <- "subject"

# Step 5
ave_tidy_data <- ddply(cbind(x_data, y_data, subject_data), .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(ave_tidy_data, "ave_tidy_data.txt", row.name=FALSE)