# KKNN

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary,
                             verboseIter = TRUE)

knn_cv <- caret::train(default ~ .,
                         data = trainingSet,
                         trControl =  twoClassCtrl,
                         method = "kknn",
                         metric = "ROC")

saveRDS(knn_cv, "Saved Models/model_knn_cv.rds")
