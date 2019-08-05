# Finding_and_replacing_duplicates_across_columns_R
Finding duplicates in data frame across columns and replacing them with unique values using R

Suppose you have a dataset with many variables, and you want to check:
* if there are any duplicated for each of the observation
* replace duplicates with random value from pool of existing values.

Core of the procedure is:
```{r, echo=FALSE, warning=FALSE}
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
```
More is available at the blog post: [Finding duplicates in data frame across columns and replacing them](https://tomaztsql.wordpress.com/2019/08/05/finding-duplicates-in-data-frame-across-columns-and-replacing-them-with-unique-values-using-r/)
