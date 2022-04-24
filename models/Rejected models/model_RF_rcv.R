# RANDOM FOREST REPEATED CV

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary,
                             verboseIter = TRUE)

rf_rcv <- train(default ~ ., trainingSet %>% sample_frac(0.1, replace = FALSE), 
                method = "rf",
                metric = "ROC",
                trControl = twoClassCtrl,
                tuneLenght = 5)

saveRDS(rf_rcv, "Saved Models/model_RF_rcv.rds")
