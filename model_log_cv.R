# Logical Regression Model

df <- load_data("Raw Data/final_train.csv") %>% 
  calculate_balance() %>% 
  crossRow_balance(rm_extra = T) %>% 
  crossRow_pay(rm_extra = T) %>% 
  crossRow_bill(rm_extra = T)



train_control <- trainControl(method = "cv", number = 15)

model_log <- train(default ~ .,
                   data = df,
                   trControl =  train_control,
                   method = "glm",
                   family = binomial())

summary(model_log)

