library(plyr) 
setwd("/Users/franklinmaduko/Dropbox/Data science self development/Coursera data science/Course 3/datacleanW1/UCI HAR Dataset")
# STEP 1 - Read the data sets
data1<-read.table("./test/X_test.txt")
data2<-read.table("./test/y_test.txt")
data3<-read.table("./train/X_train.txt")
data4<-read.table("./train/y_train.txt")
subject1 <- read.table("./test/subject_test.txt")
subject2 <- read.table("./train/subject_train.txt")
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

# STEP 2 - Rename columns and merge datasets
afeatures<-as.vector(features["V2"]) 
a<-as.matrix(afeatures)
a1<-as.vector(a)
names(data1)<-a1
names(data3)<-a1
testdata <- data.frame(subject1, data2, data1)
trainingdata <- data.frame(subject2, data4, data3)
testdata <- rename(testdata, c("V1"="id"))
testdata <- rename(testdata, c("V1.1"="activity"))
trainingdata <- rename(trainingdata, c("V1"="id"))
trainingdata <- rename(trainingdata, c("V1.1"="activity"))
fullData <-rbind(testdata, trainingdata)

#Step 3
index1<-grep("mean", names(fullData))
index2<-grep("std", names(fullData))
c(index1, index2)
fulldata2<-fullData[, c( 1, 2, index1, index2)]
activity1<-as.vector(activity["V2"]) 
b<-as.matrix(activity1)
b1<-as.vector(b)
fulldata2$activity <- factor(fulldata2$activity,
                    levels = c(1,2,3,4,5,6),
                    labels = b1)

#Step 4
newfulldata<-aggregate(fulldata2[, 3:81], 
             list(fulldata2$id, fulldata2$activity ), mean)
