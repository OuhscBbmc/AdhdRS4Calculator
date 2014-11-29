library(testthat)

###########
context("calculate_sample_rename")
###########
map <- c(
  "i_01"="item_01", "i_02"="item_02", "i_03"="item_03", "i_04"="item_04", "i_05"="item_05", 
  "i_06"="item_06", "i_07"="item_07", "i_08"="item_08", "i_09"="item_09", "i_10"="item_10",
  "i_11"="item_11", "i_12"="item_12", "i_13"="item_13", "i_14"="item_14", "i_15"="item_15", 
  "i_16"="item_16", "i_17"="item_17", "i_18"="item_18")

test_that("AllOnes", {
  ds1 <- data.frame(
    i_01=1, i_02=1, i_03=1, i_04=1, i_05=1, i_06=1, i_07=1, i_08=1, i_09=1, i_10=1,
    i_11=1, i_12=1, i_13=1, i_14=1, i_15=1, i_16=1, i_17=1, i_18=1)
  
  expected_total <- 18
  expected_inattention <- 9
  expected_hyperactivity <- 9
  ds2 <- calculate_sample(ds1, map=map)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})
test_that("AllThrees", {
  ds1 <- data.frame(
    i_01=3, i_02=3, i_03=3, i_04=3, i_05=3,
    i_06=3, i_07=3, i_08=3, i_09=3, i_10=3,
    i_11=3, i_12=3, i_13=3, i_14=3, i_15=3,
    i_16=3, i_17=3, i_18=3)
  
  expected_total <- 54
  expected_inattention <- 27
  expected_hyperactivity <- 27
  ds2 <- calculate_sample(ds1, map=map)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})
test_that("HeavyInattention", {
  ds1 <- data.frame(
    i_01=3, i_02=1, i_03=3, i_04=1, i_05=3,
    i_06=1, i_07=3, i_08=1, i_09=3, i_10=1,
    i_11=3, i_12=1, i_13=3, i_14=1, i_15=3,
    i_16=1, i_17=3, i_18=1)
  
  expected_total <- 36
  expected_inattention <- 27
  expected_hyperactivity <- 9
  ds2 <- calculate_sample(ds1, map=map)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})

test_that("HeavyHyperactivity", {
  ds1 <- data.frame(
    i_01=1, i_02=3, i_03=1, i_04=3, i_05=1,
    i_06=3, i_07=1, i_08=3, i_09=1, i_10=3,
    i_11=1, i_12=3, i_13=1, i_14=3, i_15=1,
    i_16=3, i_17=1, i_18=3)
  
  expected_total <- 36
  expected_inattention <- 9
  expected_hyperactivity <- 27
  ds2 <- calculate_sample(ds1, map=map)
  
  expect_equal(ds2$total, expected=expected_total, label="The total score should be correct.")
  expect_equal(ds2$inattention, expected=expected_inattention, label="The inattention subscale should be correct.")
  expect_equal(ds2$hyperactivity, expected=expected_hyperactivity, label="The hyperactivity subscale should be correct.")
})
