

upCtrl <- trainControl(method = "cv",
                             number = 15,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary,
                             sampling = "up")

rf_rcv_up <- train(default ~ ., trainingSet %>% sample_frac(0.1, replace = FALSE), 
                   method = "rf",
                   metric = "ROC",
                   trControl = upCtrl,
                   tuneLenght = 10)

saveRDS(rf_rcv_up, "Saved Models/model_rf_rcv_up.rds")
