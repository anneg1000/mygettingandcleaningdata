#Code Book
This CodeBook describes the source data, variables used, and the transformations performed in the process to clean up the raw data and  create a tidy dataset as per the requirements of course project.

### Original Data Source
A full description is available at the site where the data was obtained: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data set for the project can be found at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Process in Getting and Cleaning the Raw Data to Create a Tidy Dataset

1. Downloads the dataset from the URL mentioned above and unzips it to create UCI HAR Dataset folder
2. Merges the training and the test sets to create one data set, and check the data
3. Extracts only the measurements on the mean and standard deviation for each measurement, using the features from 'features.txt' file 
4. Uses descriptive activity names to name the activities in the data set, via the activity labels from 'activity_labels.txt' file
5. Appropriately labels the data set with descriptive activity names, replacing beging 't' with 'time', 'f' with 'frequency', and so on 
6. Write the tidy dataset to a txt file with row.name=FALSE, named 'tidydata.txt'
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject, and write it to a text file named 'tidydata_with_average.txt', which has 180 rows and 68 variables, including subject, activity, and those mean/sd measurements
8. Additionally, the code reshaped the data from wide-format to long-format using melt() based on the 'subject' and 'activity' for all related measurements, and writes to a 3rd file named 'tidydata_with_average_long.txt'.  

### Tidy DataSet Information
The tidy dataset from step 7 above contains 180 observations, corresponding to 30 subjects’ average activity data for 6 types of activities.

There are 68 variables in the tidy dataset. The first two are 'subject' and 'activity', and the rest of 66 variables are the average of mean values and standard deviation values for the data collected.
