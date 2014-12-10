#' @title Calculate the the two ADHD RS-IV subscales for a single subject.
#' 
#' @param ds_sample A \code{data.frame} containing items 1 through 18.
#' @param item_names_in_sample A \code{character} \code{vector} that specifies the 18 ADHD RS-IV items in the
#' sample.  The \emph{order must correspond} to the 18 items of the scale.
#' 
#' @details The eighteen items can be of class \code{numeric} or \code{integer}.  Currently any missing item value 
#' will make the subscale and the total score missing as well.

calculate_sample <- function( ds_sample, item_names_in_sample=NULL ) {
  if( is.null(item_names_in_sample) ) {
    item_names_in_sample <- sprintf("item_%02d", 1:18)
  }
  
  if( length(item_names_in_sample) != 18 ) stop("There must be 18 item names passed; each corresponds to an ADHD RS-IV item in the sample.")
  
  for( item_name in item_names_in_sample ) {
    if( !(item_name %in% colnames(ds_sample)) ) stop(sprintf("The variable name `%s` was not found in the sample.", item_name))
  }
  
  calculate <- function( d ) {
    results <- AdhdRS4Calculator::calculate_subject(
      item_01 = as.integer(ds_sample[1, item_names_in_sample[01]]), 
      item_02 = as.integer(ds_sample[1, item_names_in_sample[02]]), 
      item_03 = as.integer(ds_sample[1, item_names_in_sample[03]]), 
      item_04 = as.integer(ds_sample[1, item_names_in_sample[04]]),
      item_05 = as.integer(ds_sample[1, item_names_in_sample[05]]),
      item_06 = as.integer(ds_sample[1, item_names_in_sample[06]]), 
      item_07 = as.integer(ds_sample[1, item_names_in_sample[07]]), 
      item_08 = as.integer(ds_sample[1, item_names_in_sample[08]]), 
      item_09 = as.integer(ds_sample[1, item_names_in_sample[09]]), 
      item_10 = as.integer(ds_sample[1, item_names_in_sample[10]]),
      item_11 = as.integer(ds_sample[1, item_names_in_sample[11]]), 
      item_12 = as.integer(ds_sample[1, item_names_in_sample[12]]), 
      item_13 = as.integer(ds_sample[1, item_names_in_sample[13]]), 
      item_14 = as.integer(ds_sample[1, item_names_in_sample[14]]), 
      item_15 = as.integer(ds_sample[1, item_names_in_sample[15]]), 
      item_16 = as.integer(ds_sample[1, item_names_in_sample[16]]), 
      item_17 = as.integer(ds_sample[1, item_names_in_sample[17]]), 
      item_18 = as.integer(ds_sample[1, item_names_in_sample[18]]) 
      # item_19 = as.integer(ds_sample[1, item_names_in_sample[19]]), 
      # item_20 = as.integer(ds_sample[1, item_names_in_sample[20]])
    )
        
    d$total <- results$total
    d$inattention <- results$inattention
    d$hyperactivity <- results$hyperactivity
    return( d )
  }
  
  ds_sample <- dplyr::do(
    dplyr::group_by(
      ds_sample,
      row_number()
    ),
    calculate(.)
  )
  #   ds_sample <- ds_sample %>%
  #     dplyr::group_by(1:dplyr::n()) %>%
  #     dplyr::do(calculate(.))
  
  #ds_sample <- dplyr::do(ds_sample, calculate(.))
  # ds %>%
  #   dplyr::do(calculate(.))
  return( ds_sample )
}
