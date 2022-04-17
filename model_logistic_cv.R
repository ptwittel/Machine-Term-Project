# Logical Regression Model

df <- load_data("Clean Data/part_train.csv") %>% 
  calculate_balance() %>% 
  crossRow_balance(rm_extra = T) %>% 
  crossRow_pay(rm_extra = T) %>% 
  crossRow_bill(rm_extra = T)

df_val <- load_data("Clean Data/part_validate.csv") %>% 
  calculate_balance() %>% 
  crossRow_balance(rm_extra = T) %>% 
  crossRow_pay(rm_extra = T) %>% 
  crossRow_bill(rm_extra = T) %>% 
  fastDummies::dummy_columns(select_columns = c("sex", "education", "marriage"), 
                             split = "",
                             remove_selected_columns = T) %>% 
  rename(sex1 = sex_1, sex2 = sex_2, 
         education1 = education_1, education2 = education_2, 
         education3 = education_3,education4 = education_4,
         marriage1 = marriage_1, marriage2 = marriage_2, marriage3 = marriage_3)


train_control <- trainControl(method = "cv", number = 15)

model_log <- train(default ~ .,
                   data = df,
                   trControl =  train_control,
                   method = "glm",
                   family = binomial())

summary(model_log)

model_log$results

# parameter   Accuracy   Kappa   AccuracySD     KappaSD
# 1   none    0.792565     0     0.0003712074       0

predict(model_log$finalModel, newdata = df_val)

saveRDS(model_log, "Saved Models/model_logistic_cv.rds")
