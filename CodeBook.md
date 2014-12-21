# Introduction

The script `run_analysis.R`Accomplishes the 5 steps required for the course project.

* In PreProcessing the working directory is set, plyr library and required datasets are loaded, and created using rbind.
* In Step 1 training and test data is merged using rbind.
* In Step 2 we subset the data selecting only columns with mean and standard deviation measures, and then set the names of the columns to the correct values from the features.txt file.
* In Step 3 we update the values with the correct activity names and column names.
* In Step 4 we set the column name for the subject_data to appropriately label the dataset.
* In Step 5 we create a new data set ave_tidy_data with all the average measures for each subject and activity, then output it to a file called ave_tidy_data.txt.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge earlier datasets.
* `ave_tidy_data` holds averages and is created using dpply() to apply the `colMeans()` function to the data.  `ave_tidy_data` is then output to a text file.   
