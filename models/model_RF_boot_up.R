
upCtrl <- trainControl(method = "boot",
                       number = 5,
                       repeats = 5,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "up")

rf <- train(default ~ ., trainingSet %>% sample_frac(0.1, replace = FALSE), 
            method = "rf",
            metric = "ROC",
            trControl = upCtrl,
            tuneLength = 10)
rf

varimp_RF <- varImp(rf)
plot(varimp_RF, main = "Default Variable Importance (Random Forest)")

saveRDS(rf, "Saved Models/model_RF_boot.rds")


fitted <- predict(rf, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")
