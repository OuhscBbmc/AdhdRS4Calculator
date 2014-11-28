library(testthat)

###########
context("calculate_subject")
###########

test_that("AllOnes", {
  expected <- list(total=18, inattention=9, hyperactivity=9 )
  actual <- calculate_subject(1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1,1)
  
  expect_equal(actual, expected=expected, label="The subscales and total score should be correct.")
})
test_that("AllThrees", {
  expected <- list(total=54, inattention=27, hyperactivity=27 )
  actual <- calculate_subject(3,3,3,3,3, 3,3,3,3,3, 3,3,3,3,3, 3,3,3)
  
  expect_equal(actual, expected=expected, label="The subscales and total score should be correct.")
})
test_that("HeavyInattention", {
  expected <- list(total=36, inattention=27, hyperactivity=9 )
  actual <- calculate_subject(3,1,3,1,3, 1,3,1,3,1, 3,1,3,1,3, 1,3,1)
  
  expect_equal(actual, expected=expected, label="The subscales and total score should be correct.")
})

test_that("HeavyHyperactivity", {
  expected <- list(total=36, inattention=9, hyperactivity=27 )
  actual <- calculate_subject(1,3,1,3,1, 3,1,3,1,3, 1,3,1,3,1, 3,1,3)
  
  expect_equal(actual, expected=expected, label="The size of the downloaded file should match.")
})