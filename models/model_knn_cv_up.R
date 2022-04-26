# KKNN

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary,
                             sampling = "up",
                             verboseIter = TRUE)

knn_cv_up <- caret::train(default ~ .,
                         data = trainingSet,
                         trControl =  twoClassCtrl,
                         method = "kknn",
                         metric = "ROC")

saveRDS(knn_cv_up, "Saved Models/model_knn_cv_up.rds")


