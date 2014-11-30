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
    expected_error <- sprintf("Error in calculate_sample\\(ds_slim\\) : \n  The variable name `item_%02d` was not found in the sample.\n",  
                              item_number)

    testthat::expect_error(
      object = calculate_sample(ds_slim),
      regexp = expected_error
    )  
  }
  
})

test_that("negative value", {
  ds <- data.frame(
    item_01=1, item_02=1, item_03=1, item_04=1, item_05=1, item_06=1, item_07=1, item_08=1, item_09=1, item_10=1,
    item_11=1, item_12=1, item_13=1, item_14=1, item_15=1, item_16=1, item_17=1, item_18=1)
  
  for( item_number in item_numbers ) {
    item_name <- sprintf("item_%02d", item_number)
    ds2 <- ds
    ds2[1, item_name] <- runif(n=1, min=-1, max=-1e-15)
    
    expected_error <- sprintf("Error in AdhdRS4Calculator::calculate_subject.+?  : \n  The item_%02d value must be from 0 to 3.  It was -0.\\d{5,25}.\n", 
                              item_number)
    testthat::expect_error(
      object = calculate_sample(ds2),
      regexp = expected_error
    )  
  }
  
})
