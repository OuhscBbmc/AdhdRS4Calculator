#' @title Calculate the the two ADHD RS-IV subscales for a single subject.
#' 
#' @param item_01 Item #1 value.  
#' @param item_02 Item #2 value.  
#' @param item_03 Item #3 value.  
#' @param item_04 Item #4 value.  
#' @param item_05 Item #5 value.  
#' @param item_06 Item #6 value.  
#' @param item_07 Item #7 value.  
#' @param item_08 Item #8 value.  
#' @param item_09 Item #9 value.  
#' @param item_10 Item #10 value.  
#' @param item_11 Item #11 value.  
#' @param item_12 Item #12 value.  
#' @param item_13 Item #13 value.  
#' @param item_14 Item #14 value.  
#' @param item_15 Item #15 value.  
#' @param item_16 Item #16 value.  
#' @param item_17 Item #17 value.  
#' @param item_18 Item #18 value.  
#' 
#' @details The twenty items can be of class \code{numeric} or \code{integer}.  Currently any missing item value 
#' will make the subscale and the total score missing as well.
#' 
calculate_subject <- function( 
  # age, is_male, is_home,
  item_01, item_02, item_03, item_04, item_05, item_06, item_07, item_08, item_09, item_10, 
  item_11, item_12, item_13, item_14, item_15, item_16, item_17, item_18 #, item_19=0, item_20=0
  ) {
  
  # testit::assert("The 'age' variable must be of class 'numeric' or 'integer'.", class(age) %in% c("numeric", "integer"))
  # testit::assert("The 'is_male' variable must be of class 'logical'.", class(is_male)=="logical")
  # testit::assert("The 'is_home' variable must be of class 'logical'.", class(is_home)=="logical")
  
  if( !(class(item_01) %in% c("numeric", "integer")) ) stop("The 'item_01' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_02) %in% c("numeric", "integer")) ) stop("The 'item_02' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_03) %in% c("numeric", "integer")) ) stop("The 'item_03' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_04) %in% c("numeric", "integer")) ) stop("The 'item_04' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_05) %in% c("numeric", "integer")) ) stop("The 'item_05' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_06) %in% c("numeric", "integer")) ) stop("The 'item_06' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_07) %in% c("numeric", "integer")) ) stop("The 'item_07' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_08) %in% c("numeric", "integer")) ) stop("The 'item_08' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_09) %in% c("numeric", "integer")) ) stop("The 'item_09' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_10) %in% c("numeric", "integer")) ) stop("The 'item_10' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_11) %in% c("numeric", "integer")) ) stop("The 'item_11' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_12) %in% c("numeric", "integer")) ) stop("The 'item_12' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_13) %in% c("numeric", "integer")) ) stop("The 'item_13' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_14) %in% c("numeric", "integer")) ) stop("The 'item_14' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_15) %in% c("numeric", "integer")) ) stop("The 'item_15' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_16) %in% c("numeric", "integer")) ) stop("The 'item_16' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_17) %in% c("numeric", "integer")) ) stop("The 'item_17' variable must be of class 'numeric' or 'integer'.")
  if( !(class(item_18) %in% c("numeric", "integer")) ) stop("The 'item_18' variable must be of class 'numeric' or 'integer'.")
  # if( !(class(item_19) %in% c("numeric", "integer")) ) stop("The 'item_19' variable must be of class 'numeric' or 'integer'.")
  # if( !(class(item_20) %in% c("numeric", "integer")) ) stop("The 'item_20' variable must be of class 'numeric' or 'integer'.")
  
  inattention <- sum(c(item_01, item_03, item_05, item_07, item_09, item_11, item_13, item_15, item_17)) #item_19
  hyperactivity <- sum(c(item_02, item_04, item_06, item_08, item_10, item_12, item_14, item_16, item_18)) #item_20
  total <- inattention + hyperactivity
  
  return( list(total=total, inattention=inattention, hyperactivity=hyperactivity) )
}
