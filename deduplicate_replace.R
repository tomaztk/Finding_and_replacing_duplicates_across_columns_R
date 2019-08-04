########################################
# Finding duplicates in data frame 
# across columns and replacing them 
# with unique values using R
#
#
# Author: Tomaz Kastrun
# Blog: tomaztsql.wordpress.com
# Date: 04.08.2019
######################################

library(dplyr)

df <- structure(list(
   v1 = c(10,20,30,40,50,60,70,80)
  ,v2 = c(5,7,6,8,6,8,9,4)
  ,v3 = c(2,4,6,6,7,8,8,4)
  ,v4 = c(8,7,3,1,8,7,8,4)
  ,v5 = c(2,4,6,7,8,9,9,3))
  ,.Names = c("ID","a", "b","d", "e")
  ,.typeOf = c("numeric", "numeric", "numeric","numeric","numeric")
  ,row.names = c(NA, -8L)
  ,class = "data.frame"
  ,comment = "Sample dataframe for duplication example")


df_old <- df
set.seed(2908)
for (row in 1:nrow(df)) {
      vec = df %>% slice(row) %>% unlist() %>% unname()
      
      #check for duplicates
      if(length(unique(vec)) != length(df)) {
        positions <- which(duplicated(vec) %in% c("TRUE"))
        #iterate through positions
        for(i in 1:length(positions)) {
        possible_new_values <- c(1,2,3,4,5,6,7,8,9)
        df[row,positions[i]]  <- sample(possible_new_values[! possible_new_values %in% unique(vec) ],1)
        }
      }
    }


cat("before: ")
df_old
cat("after: ")
df



#rm(list=ls())
# cat("\014")  
