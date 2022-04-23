#RANDOM FOREST CV UP SAMPLING

upCtrl <- trainControl(method = "repeatedcv",
                       number = 5,
                       repeats = 3,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "up",
                       verboseIter = TRUE)

rf_cv_up <- train(default ~ ., trainingSet, 
                   method = "rf",
                   metric = "ROC",
                   trControl = upCtrl,
                   tuneLenght = 5)

saveRDS(rf_cv_up, "Saved Models/model_rf_cv_up.rds")
