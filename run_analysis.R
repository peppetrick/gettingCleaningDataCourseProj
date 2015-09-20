library(plyr)
library(reshape2)
# 1)read data common to train and test data set: feature and activity
#read feaure.txt
features<-read.table("features.txt",sep=" ")
names(features)<-c("Code","Label")
#read activity label
activit_labels<-read.table("activity_labels.txt",sep=" ")
names(activit_labels)<-c("Code","Label")

#2) read test set
#read subject test
subject_test<-read.table("./test/subject_test.txt",sep=" ")

#read activity class for test set 
activity_test<-read.table("./test/y_test.txt")
#read test set
test_set<-read.table("./test/X_test.txt")


#3)read train set

#read subject test
subject_train<-read.table("./train/subject_train.txt",sep=" ")


#read activity class for test set 
activity_train<-read.table("./train/y_train.txt")
#read test set
train_set<-read.table("./train/X_train.txt")


#bind train and test set
total_set<-rbind(train_set,test_set)
#add name to columns
names(total_set)<-features$Label;
#store subject for the total_set object  
subject_total<-c(subject_train$V1,subject_test$V1)
#store activity  for the total_set object  
activity_total<-c(activity_train$V1,activity_test$V1)
#select only mean and std columns
total_mean_std<-total_set[,c(grep("mean",features$Label),grep("mean",features$Label))]
#add activity and subject colums
total_mean_std$activity<-activity_total
total_mean_std$subject<-subject_total
#Uses descriptive activity names to name the activities in the data set
total_mean_std_activity<-merge(total_mean_std,activit_labels,by.x="activity",by.y="Code")
#obtain a tydy data set 
total_melt<-melt(total_mean_std_activity,id=c("Label","subject"),measure.vars=colnames(total_mean_std))
#result data set
result_data_set<-ddply(total_melt,c("Label","subject","variable"),summarize,mean=mean(value))

