# downloading the UCI Human Activity Recognition data from website
library(data.table)
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

# reading the file to get the feature labels
features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

# reading all the training data
trainX <- read.table('./UCI HAR Dataset/train/X_train.txt')
trainActivity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
trainSubject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

# combining all training data
trainData <-  data.frame(trainSubject, trainActivity, trainX)
names(trainData) <- c(c('subject', 'activity'), features)

# reading all testing data
testX <- read.table('./UCI HAR Dataset/test/X_test.txt')
testActivity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
testSubject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

# combining all testing data
testData <-  data.frame(testSubject, testActivity, testX)
names(testData) <- c(c('subject', 'activity'), features)

# merging training and testing datasets
dataMerged <- rbind(trainData, testData)

# extracting mean and standard deviation for each measurement
mean.std <- grep('mean|std', features)
dataMS <- dataMerged[,c(1,2,mean.std + 2)]

# reading activity names from file
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activityLabels <- as.character(activityLabels[,2])

# naming the activities
dataMS$activity <- activityLabels[dataMS$activity]

# rename short variable names to descriptive ones
varNames <- names(dataMS)
varNames <- gsub("[(][)]", "", varNames)
varNames <- gsub("^t", "TimeDomain_", varNames)
varNames <- gsub("^f", "FrequencyDomain_", varNames)
varNames <- gsub("Acc", "Accelerometer", varNames)
varNames <- gsub("Gyro", "Gyroscope", varNames)
varNames <- gsub("Mag", "Magnitude", varNames)
varNames <- gsub("-mean-", "_Mean_", varNames)
varNames <- gsub("-std-", "_StandardDeviation_", varNames)
varNames <- gsub("-", "_", varNames)
names(dataMS) <- varNames

# new tidy data with the average of each variable
# for each activity and subject
tidyData <- aggregate(dataMS[,3:81], by = list(activity = dataMS$activity, subject = dataMS$subject),FUN = mean)

# write the tidy data set to a text file
write.table(x = tidyData, file = "tidy_data.txt", row.names = FALSE)