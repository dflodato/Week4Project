library(utils)
library(dplyr)
run_analysis<-function(){
    ##Step 1 
    ## Getting the files in the proper directory for the train dataset
    dftrain<-read.table("train/subject_train.txt",col.names = "SubjectID")
    df2train<-read.table("train/y_train.txt",col.names= "ActivityLabel")
    df3train<-read.table("train/X_train.txt")
    ## Binding by columns the three variables for the "training dataset"
    dftot_train<-cbind(dftrain,df2train,df3train)
    ## Getting the files in the proper directory for the train dataset
    dftest<-read.table("test/subject_test.txt",col.names = "SubjectID")
    df2test<-read.table("test/y_test.txt",col.names= "ActivityLabel")
    df3test<-read.table("test/X_test.txt")
    ## Binding by columns the three variables for the "test dataset"
    dftot_test<-cbind(dftest,df2test,df3test)

    ## Merges the training and the test sets to create one data set.
    dftotal<-rbind(dftot_train,dftot_test)

    #Step 2
    ## Getting the names of the V1, ..., V561 variables
    dfnames<-read.table("features.txt",col.names = c("VariableNum","VariableName"))
    dfnames<-subset(dfnames, select="VariableName")
    ## Assigning the Vi names to the columns name of the total dataset
    vectornames<-c("SubjectID","ActivityLabel",as.character(dfnames$VariableName))
    colnames(dftotal)<-vectornames
    ## Skimming the dataset selecting only cols with mean() and std() in the name
    df_skim<-dftotal[,c("SubjectID","ActivityLabel",colnames(dftotal)[grep("mean[()]|std[()]",names(dftotal))])]
    
    #Step 3
    ## Getting the names and initialise a vector of names
    df_labels<-read.table("activity_labels.txt",stringsAsFactors = FALSE)
    labelnames<-df_labels[,2]
    ## Uses descriptive activity names to name the activities in the data set
    df_skim$ActivityLabel<-labelnames[df_skim$ActivityLabel]

    #Step 4
    ## Appropriately labels the data set with descriptive variable names.
    colnames(df_skim)<-gsub("\\(\\)","",colnames(df_skim))
    colnames(df_skim)<-gsub("^t","Time",colnames(df_skim))
    colnames(df_skim)<-gsub("^f","Freq",colnames(df_skim))
    colnames(df_skim)<-gsub("-",".",colnames(df_skim))
    
    #Step 5
    ## From the data set in step 4, creates a second, independent tidy data set 
    ## with the average of each variable for each activity and each subject.
    grouped_df_skim<-group_by(df_skim,SubjectID,ActivityLabel)
    df_tidy<-summarise_all(grouped_df_skim,mean)

    write.table(df_tidy,"./tidyLodato.txt",row.names = FALSE)
}