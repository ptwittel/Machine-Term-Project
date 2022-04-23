

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 5,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary)

rf_rcv <- train(default ~ ., trainingSet %>% sample_frac(0.1, replace = FALSE), 
                method = "rf",
                metric = "ROC",
                trControl = twoClassCtrl,
                tuneLenght = 10)

varimp_RF <- varImp(rf_rcv)
plot(varimp_RF, main = "Default Variable Importance (Random Forest)")

saveRDS(rf_rcv, "Saved Models/model_RF_rcv.rds")


fitted <- predict(rf_rcv, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")
