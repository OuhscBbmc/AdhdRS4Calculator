library(testthat)

###########
context("calculate_sample_with_errors")
###########
item_numbers <- 1:18

test_that("missing_one_column", {
  ds <- data.frame(
    item_01=1, item_02=1, item_03=1, item_04=1, item_05=1, item_06=1, item_07=1, item_08=1, item_09=1, item_10=1,
    item_11=1, item_12=1, item_13=1, item_14=1, item_15=1, item_16=1, item_17=1, item_18=1)
  
  for( item_number in item_numbers ) {
    item_name <- sprintf("item_%02d", item_number)
    ds_slim <- ds[, !(colnames(ds) %in% item_name)]
    expected_error <- sprintf("Error in AdhdRS4Calculator::calculate_subject.+?  : \n  The 'item_%02d' variable must be of class 'numeric' or 'integer'.\n", 
                              item_number)
    testthat::expect_error(
      object = calculate_sample(ds_slim),
      regexp = expected_error
    )  
  }
  
})
