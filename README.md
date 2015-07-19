# Cleaning-Data-Project
##The code in run_analysis.R is stuctured as follows:
1. Read in all the tables of data
2. Create test and training dataframes by merging subject,X and Y files together.
3. Assign column names to Subject and Activity columns (this might not have been necessary here, but it helped me)
4. Combine these into one large dataframe by rowbind.
5. For simplicity (although this may not be strictly necessary) I sorted the data by Subject and Activity.  This allowed me to better understand the data.
6. I retrieved the variable names from features.txt appended Subject, Activty and assigned these as row names. (See comment on step 3)
7. Since I only wanted columns dealing with mean and std, I used the grepl function to identifty the columns I wanted.
8. I took the "pruned" data frame with only these columns, and called it "Pruned"
9. I used Activity_labels.txt to change the activity labels from numbers to the words describing the acivity.
10. Finally I used the dplyr package to summarize each column (after appropriately grouping) by mean

##Some comments
- I only used variables ending in -mean() and -std() since it seemed like the other variables that had mean in their names were averages of different kinds of data.
- The grepl function has not been mentioned in the course, but as an example  grepl("h", c("hi", "bye", "aha"))
returns TRUE FALSE TRUE
