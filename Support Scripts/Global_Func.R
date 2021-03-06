## This script define the function to clean/ process data

library(tidyverse)

# this function reads in .csv and set the column type
load_data <- function(path){
  df <- read_csv(path, col_types = cols(
      sex = col_factor(),
      education = col_factor(),
      marriage = col_factor(),
      age = col_integer()
      )
    )
  return(df)
}

# adds IDs to data frames that do not have id
add_id <-function(df){return(mutate(df, id = 1:nrow(df) ) ) }

# this function will calculate the Monthly Balance
calculate_balance <- function(dataFrame, rm_extra = FALSE) {
  for(i in 1:6){
    bal <- paste("balance_amt", i, sep = "")
    bill <- paste("bill_amt", i, sep ="")
    pay <- paste("pay_amt", i, sep = "")
    
    dataFrame <- mutate(dataFrame, "{bal}" := .data[[pay]] - .data[[bill]])
    
    if(rm_extra == TRUE){
      dataFrame <- select(dataFrame, - .data[[bill]], - .data[[pay]])
    }
  }
  return(dataFrame)
}

# this function condenses pay, 
crossRow_pay <- function(df, rm_extra = FALSE) {

  df <- df %>% rowwise() %>% 
    mutate( pay_amt_sum = sum(pay_amt1, pay_amt2, pay_amt3,
                               pay_amt4, pay_amt5, pay_amt6)) 
  
  if(rm_extra == TRUE){
    df <- df %>% dplyr::select(-pay_amt1, -pay_amt2, -pay_amt3,
                    -pay_amt4, -pay_amt5, -pay_amt6)
  }
  
  return(df)
}

#this function condense bill
crossRow_bill <- function(df, rm_extra = FALSE) {
  
  df <- df %>% rowwise() %>% 
    mutate( bill_amt_sum = sum(bill_amt1, bill_amt2, bill_amt3,
                               bill_amt4, bill_amt5, bill_amt6))
  
  if(rm_extra == TRUE){
    df <- df %>% dplyr::select(-bill_amt1, -bill_amt2, -bill_amt3,
                    -bill_amt4, -bill_amt5, -bill_amt6)
  }
  
  return(df)
}

#this function condense balance
crossRow_balance <- function(df, rm_extra = FALSE) {
  
  df <- df %>% rowwise() %>% 
    mutate( balance_amt_sum = sum(balance_amt1, balance_amt2, balance_amt3, 
                                  balance_amt4, balance_amt5, balance_amt6))
  
  if(rm_extra == TRUE){
    df <- df %>% dplyr::select(-balance_amt1, -balance_amt2, -balance_amt3,
                    -balance_amt4, -balance_amt5, -balance_amt6)}
  
  return(df)
}

regConfusionMatrix <- function(model) {
  cm <- confusionMatrix(reference = testingSet$default,
                        data = predict(model, testingSet),
                        mode = "everything",
                        positive = "Pos")
  
  return(cm)
}

calLogLoss <- function(model){
  y_pred <- predict(model, testingSet, type = "prob")$Pos
  y_true <-ifelse(testingSet$default == "Pos", 1, 0)
  
  return(MLmetrics::LogLoss(y_pred, y_true) )
}


### PREPARE COMP DATA FOR SUBMISSION

predCompData <- function(model){
  df <- data.frame(id = 1:nrow(compSet),
                   default = predict(model, compSet, type = "prob")$Pos)
  return(df)
}

