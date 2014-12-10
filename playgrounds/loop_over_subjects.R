library(AdhdRS4Calculator)
# library(dplyr)
library(magrittr)

ds1 <- data.frame(
  item_01=1, item_02=1, item_03=1, item_04=1, item_05=1,
  item_06=1, item_07=1, item_08=1, item_09=1, item_10=1,
  item_11=1, item_12=1, item_13=1, item_14=1, item_15=1,
  item_16=1, item_17=1, item_18=1)

# calculate <- function( d ) {
#   results <- AdhdRS4Calculator::calculate_subject(
#     d$item_01, d$item_02, d$item_03, d$item_04, d$item_05,
#     d$item_06, d$item_07, d$item_08, d$item_09, d$item_10,
#     d$item_11, d$item_12, d$item_13, d$item_14, d$item_15,
#     d$item_16, d$item_17, d$item_18)
#   d$total <- results$total
#   d$inattention <- results$inattention
#   d$hyperactivity <- results$hyperactivity
#   return( d )
# }
calculate <- function( d ) {
  item_names_in_sample <- sprintf("item_%02d", 1:18)
    
#   browser()
  results <- AdhdRS4Calculator::calculate_subject(
      item_01 = d[, item_names_in_sample[01]], 
      item_02 = d[, item_names_in_sample[02]], 
      item_03 = d[, item_names_in_sample[03]], 
      item_04 = d[, item_names_in_sample[04]],
      item_05 = d[, item_names_in_sample[05]],
      item_06 = d[, item_names_in_sample[06]], 
      item_07 = d[, item_names_in_sample[07]], 
      item_08 = d[, item_names_in_sample[08]], 
      item_09 = d[, item_names_in_sample[09]], 
      item_10 = d[, item_names_in_sample[10]],
      item_11 = d[, item_names_in_sample[11]], 
      item_12 = d[, item_names_in_sample[12]], 
      item_13 = d[, item_names_in_sample[13]], 
      item_14 = d[, item_names_in_sample[14]], 
      item_15 = d[, item_names_in_sample[15]], 
      item_16 = d[, item_names_in_sample[16]], 
      item_17 = d[, item_names_in_sample[17]], 
      item_18 = d[, item_names_in_sample[18]]
  )
  d$total <- results$total
  d$inattention <- results$inattention
  d$hyperactivity <- results$hyperactivity
  return( d )
}

plyr::daply(ds1, .variables=1, calculate)


# ds1 %>%
#   #dplyr::group_by(1:n()) %>%
#   dplyr::group_by(row_number()) %>%
#   dplyr::do(calculate(.))

# dplyr::do(ds1, calculate(.))


# mtcars %>% group_by(cyl) %>% do(head(., 1))
# 
# h <- function( d ) {
#   head(d, 1)
# }
# mtcars %>% group_by(cyl) %>% do(h(.))

library(AdhdRS4Calculator)
set.seed(23)
item_count <- 18 #This was determined by the test developers.
subject_count <- 20 #Specify how many subjects to simulate

#When a data frame is created this way, the default variable names are V1...V18
ds2 <- as.data.frame(matrix(sample(0:3, item_count*subject_count, replace=T), ncol=item_count))
map2 <- sprintf("item_%02d", 1:18)
names(map2) <- paste0("V", 1:18)
ds2 <- plyr::rename(ds2, map2)

#apply(ds2, MARGIN = 1, FUN = calculate)
sapply(ds2,FUN = calculate)


plyr::ddply(ds2, .variables=1, calculate)

ds2 %>%
  #dplyr::group_by(1:n()) %>%
  dplyr::group_by(row_number()) %>%
  dplyr::do(calculate(.))


dplyr::do(
  dplyr::group_by(
    ds2,
    row_number()
  ),
  calculate(.)
)

t1 <- dplyr::group_by( row_number()) 


# dplyr::do(ds2, calculate(.))

# sample_names <- paste0("V", 1:18)
# calculate_sample(ds2, item_names_in_sample=sample_names)

