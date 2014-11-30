#' @title Calculate the the two ADHD RS-IV subscales for a single subject.
#' 
#' @param ds_sample A \code{data.frame} containing items 1 through 18.
#' @param map A 'named' \code{character} \code{vector} that maps the variable
#' names in the observed dataset to the expected variable names 
#' (ie, \code{item_01} through \code{item_18}.)
#' 
#' @details The eighteen items can be of class \code{numeric} or \code{integer}.  Currently any missing item value 
#' will make the subscale and the total score missing as well.

calculate_sample <- function( ds_sample, map=NULL ) {
  if( !is.null(map) ) {
    ds_sample <- plyr::rename(x=ds_sample, replace=map, warn_missing=TRUE)
  }
  
  calculate <- function( d ) {
    results <- AdhdRS4Calculator::calculate_subject(
      d$item_01, d$item_02, d$item_03, d$item_04, d$item_05, d$item_06, d$item_07, d$item_08, d$item_09, d$item_10,
      d$item_11, d$item_12, d$item_13, d$item_14, d$item_15, d$item_16, d$item_17, d$item_18)
    d$total <- results$total
    d$inattention <- results$inattention
    d$hyperactivity <- results$hyperactivity
    return( d )
  }
  
  ds_sample <- dplyr::do(ds_sample, calculate(.))
  # ds %>%
  #   dplyr::do(calculate(.))
  return( ds_sample )
}
