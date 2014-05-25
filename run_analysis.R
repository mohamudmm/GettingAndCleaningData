# the test data is contained in a folder with sub-folder and several file
# the list-files extracts the file names and the files were read into a
#data frame
library(reshape2)


file_path_test <- "//UCI HAR Dataset//test"
 
file_test <- list.files(file_path_test)[2]
file_test1 <- paste(file_path_test,file_test,sep ="//")
file_test2 <- list.files(file_path_test)[3:4]
test_data <- read.table(file_test1)
for (i in seq_along(file_test)){
                x <- paste(file_path_test,file_test[i], sep = "//")
                y <- read.table(x)
                test_data <- cbind(test_data,y)
                
        }
test_data

# in a manner analogous to the test data, the training data were extracted.
file_path_train <- "//UCI HAR Dataset//train"
        
file_path_train <- paste(a,"train", sep = "//")
file_train <- list.files(file_path_train)[2]
file_train1 <- paste(file_path_train,file_train,sep ="//")
file_train2 <- list.files(file_path_train)[3:4]
train_data <- read.table(file_train1)
for (i in seq_along(file_train)){
        x <- paste(file_path_train,file_train[i], sep = "//")
        y <- read.table(x)
        train_data <- cbind(train_data,y)
                
        }
train_data


# training and test data are merged into one dataset using rbind
merged_data <- rbind(train_data,test_data)

# the column names of 561 features  were extracted from the features file
#the names were striped of the parentheses and dashes
features <- read.table("//UCI HAR Dataset//features.txt")
features$V3 <- gsub("[(),-]","",features$V2)
#the subject and the activity column names was combined with the features
names <- c("subj",features$V3,"activity")
#the column names was attached to the data frame
colnames(merged_data) <- names
#the column names was cleaned by removing extra :Body"
colnames1 <- sub("Body","",colnames(merged_data))
colnames(merged_data) <- colnames1
# the numeric code for activity was changed into more descriptive names using
#the information in the activity_label folder
merged_data$actlab <-"unset"
merged_data$actlab[merged_data$activity == 1] <- "walk"
merged_data$actlab[merged_data$activity == 2] <- "walkup"
merged_data$actlab[merged_data$activity == 4] <-"sit"
merged_data$actlab[merged_data$activity == 3] <- "walkdown"
merged_data$actlab[merged_data$activity == 6] <- "lay"
merged_data$actlab[merged_data$activity == 5] <- "stand"
#to subset only the columns of the mean and std of the variables
#a vector of the column numbers of the desired columns was selected
#and used to subset from the combined dataset
meanStdCol <- grep("mean", colnames(merged_data3))
meanStdCol1 <- grep("std", colnames(merged_data3))
colnums <- c(meanStdCol, meanStdCol1)
tidyMergedData <- merged_data3[,c(1,colnums,563,564)]
#finally the tidy data was obtained by a sequence of melting and casting
#using the reshape2 package
B <- melt(tidyMergedData,id.vars = c("subj","actlab"))
Bl <- dcast(B,subj+actlab~variable,fun.aggregate = mean)






