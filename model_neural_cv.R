# NEURAL NETWORK

twoClassCtrl <- trainControl(method = "cv",
                             number = 5,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary)

neural_cv <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  twoClassCtrl,
                       method = "mxnet",
                       metric = "ROC")


fitted <- predict(nearal_cv, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")

saveRDS(model_log, "Saved Models/model_neural_cv.rds")