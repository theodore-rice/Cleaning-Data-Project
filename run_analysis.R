##I put the files into a directory called "Clean-Proj"
##Read files into R
X_test<-read.table("./test/X_test.txt")
Y_test<-read.table("./test/subject_test.txt")
subject_test<-read.table("./test/subject_test.txt")
X_train<-read.table("./train/X_train.txt")
Y_train<-read.table("./train/Y_train.txt")
subject_train<-read.table("./train/subject_train.txt")
##Merge to create test and training data sets
test_set<-cbind(subject_test,Y_test,X_test)
train_set<-cbind(subject_train,Y_train,X_train)
##Rename columns
colnames(test_set)[1]<-"Subject"
colnames(test_set)[2]<-"Activity"
colnames(train_set)[1]<-"Subject"
colnames(train_set)[2]<-"Activity"
combined<-rbind(test_set,train_set)
Sorted<-arrange(combined,Subject,Activity)
##Get variable names
vars<-read.table("features.txt")
names<-as.character(vars$V2)
names(Sorted)<-c("Subject","Activity",names)
##Find only names that contan -mean() or -std()
used_cols<-which(grepl("-mean()",colnames(Sorted))|grepl("-std()",colnames(Sorted)))
##Pruned is the data frame with only the right variables
Pruned<-Sorted[c(1:2,used_cols)]
##Change Activity Labels
labels<-read.table("activity_labels.txt")
for(i in 1:nrow(Pruned)) {Pruned$Activity[i]<-as.character(labels[Pruned$Activity[i],2])}
tidy<-Pruned %>% group_by(Subject,Activity)%>%summarise_each(funs(mean))
write.table(tidy,file="Tidy_data.txt",row.name=FALSE)
