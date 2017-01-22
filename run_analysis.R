require(plyr)
#Assuming Data Set is in this working directory
#Load activity variable list
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
rawVariableNames <- read.table("UCI HAR Dataset/features.txt")
names(rawVariableNames) <- c("Index","Variable Name")
## Get Variables List for mean and std variables only
requiredVariables <- grep("mean|std",rawVariableNames$`Variable Name`)
requiredVariableNames <- rawVariableNames[requiredVariables,]
requiredVariableNames <- as.character(requiredVariableNames[,2])
## Load in Raw Data Set from Source Files
testRawData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
trainRawData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
#Pretty up activity lists
testActivities[,1] <- activityLabels[testActivities[,1],2]
trainActivities[,1] <- activityLabels[trainActivities[,1],2]
## Drop out unwanted columns from sensor data sets
testRawData <- testRawData[,requiredVariables]
trainRawData <- trainRawData[,requiredVariables]
## Add in Subject and Activity Information
testRawData <- cbind(testSubjects,testActivities,testRawData)
trainRawData <- cbind(trainSubjects,trainActivities,trainRawData)
# Merge test and training data to create complete data set
completeDataSet <- rbind(trainRawData,testRawData)
## Rename Columns in Data Sets to something more descriptive
colnames(completeDataSet) <- c("Subject","Activity",requiredVariableNames)

#Calculate Mean Data for Tidy Data
meanData <- ddply(completeDataSet, .(Subject,Activity), function(n) colMeans(n[,3:81]))
#Write out Tidy Data
write.table(meanData,"tidyMeanData.txt", row.name=FALSE)
