# KKNN

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 5,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary)

knn_cv <- caret::train(default ~ .,
                         data = trainingSet,
                         trControl =  twoClassCtrl,
                         method = "kknn",
                         metric = "ROC")


fitted <- predict(knn_cv, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")

saveRDS(knn_cv, "Saved Models/model_knn_cv.rds")
