library(testthat)

###########
context("calculate_sample")
###########

test_that("AllOnes", {
  ds1 <- data.frame(
    item_01=1, item_02=1, item_03=1, item_04=1, item_05=1,
    item_06=1, item_07=1, item_08=1, item_09=1, item_10=1,
    item_11=1, item_12=1, item_13=1, item_14=1, item_15=1,
    item_16=1, item_17=1, item_18=1)
  
  expected_total <- 18
  expected_inattention <- 9
  expected_hyperactivity <- 9
  ds2 <- calculate_sample(ds1)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})
test_that("AllThrees", {
  ds1 <- data.frame(
    item_01=3, item_02=3, item_03=3, item_04=3, item_05=3,
    item_06=3, item_07=3, item_08=3, item_09=3, item_10=3,
    item_11=3, item_12=3, item_13=3, item_14=3, item_15=3,
    item_16=3, item_17=3, item_18=3)
  
  expected_total <- 54
  expected_inattention <- 27
  expected_hyperactivity <- 27
  ds2 <- calculate_sample(ds1)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})
test_that("HeavyInattention", {
  ds1 <- data.frame(
    item_01=3, item_02=1, item_03=3, item_04=1, item_05=3,
    item_06=1, item_07=3, item_08=1, item_09=3, item_10=1,
    item_11=3, item_12=1, item_13=3, item_14=1, item_15=3,
    item_16=1, item_17=3, item_18=1)
  
  expected_total <- 36
  expected_inattention <- 27
  expected_hyperactivity <- 9
  ds2 <- calculate_sample(ds1)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})

test_that("HeavyHyperactivity", {
  ds1 <- data.frame(
    item_01=1, item_02=3, item_03=1, item_04=3, item_05=1,
    item_06=3, item_07=1, item_08=3, item_09=1, item_10=3,
    item_11=1, item_12=3, item_13=1, item_14=3, item_15=1,
    item_16=3, item_17=1, item_18=3)
  
  expected_total <- 36
  expected_inattention <- 9
  expected_hyperactivity <- 27
  ds2 <- calculate_sample(ds1)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})
