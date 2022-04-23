# RANDOM FOREST BOOT UP SAMPLING

upCtrl <- trainControl(method = "boot",
                       number = 5,
                       repeats = 3,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "up",
                       verboseIter = TRUE)

rf <- train(default ~ ., trainingSet, 
            method = "rf",
            metric = "ROC",
            trControl = upCtrl,
            tuneLength = 5)

saveRDS(rf, "Saved Models/model_RF_boot_up.rds")

