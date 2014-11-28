library(AdhdRS4Calculator)
library(dplyr)

ds <- data.frame(
  item_01=1, item_02=1, item_03=1, item_04=1, item_05=1,
  item_06=1, item_07=1, item_08=1, item_09=1, item_10=1,
  item_11=1, item_12=1, item_13=1, item_14=1, item_15=1,
  item_16=1, item_17=1, item_18=1)

calculate <- function( d ) {
  results <- AdhdRS4Calculator::calculate_subject(
    d$item_01, d$item_02, d$item_03, d$item_04, d$item_05,
    d$item_06, d$item_07, d$item_08, d$item_09, d$item_10,
    d$item_11, d$item_12, d$item_13, d$item_14, d$item_15,
    d$item_16, d$item_17, d$item_18)
  d$total <- results$total
  d$inattention <- results$inattention
  d$hyperactivity <- results$hyperactivity
  return( d )
}
ds %>%
  dplyr::do(calculate(.))

dplyr::do(ds, calculate(.))


# mtcars %>% group_by(cyl) %>% do(head(., 1))
# 
# h <- function( d ) {
#   head(d, 1)
# }
# mtcars %>% group_by(cyl) %>% do(h(.))
