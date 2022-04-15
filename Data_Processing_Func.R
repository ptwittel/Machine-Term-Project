## This script define the function to clean data

load_data <- function(path){
  return(
  read_csv(path, col_types = cols(
      sex = col_factor(),
      education = col_factor(),
      marriage = col_factor(),
      age = col_integer(),
      default = col_factor()
      )
    )
  )
}


# this function will calculate the Monthly Balance
calculate_balance <- function(dataFrame, remove_extra = FALSE) {
  for(i in 1:6){
    bal <- paste("balance_amt", i, sep = "")
    bill <- paste("bill_amt", i, sep ="")
    pay <- paste("pay_amt", i, sep = "")
    
    dataFrame <- mutate(dataFrame, "{bal}" := .data[[pay]] - .data[[bill]])
    
    if(remove_extra == TRUE){
      dataFrame <- select(dataFrame, - .data[[bill]], - .data[[pay]])
    }
  }
  return(dataFrame)
}