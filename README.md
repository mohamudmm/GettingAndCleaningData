Title
===========================================================
The script consists of three phases:
1. the first phase reads in the data.The data consists of folder with subfolder and files.Using the list.files function the script loops over the test folder and reads in the contents of the folder: subject_test,X_test,and y_test with the read.table function.The three vectors are then assembled into a data frame,test_data.In a similar fashion the training folder content:subject_train,X_train,y_train are assembled into a second data frame,train_data.The two data frames are merged into one dataset merged_data using the rbind function.
2. in the second phase the dataframe's columns were renamed.The 561 variable names was extracted from the features file and attached to the merged_data dataframe.The column names was cleaned up by stripping the () and - characters and removing extra "Body" in the variable names.
3. In the third phase the activity variable was converted from numeric code to more expressive names using the information contained in the activity_label file.
4.The script next selects from the merged dataframe only those columns containing mean or std in the variable name.
5.In the final step the tidy data with the average of each variable for each subject and each activity was created using the melt and cast functions in the reshape2 package
