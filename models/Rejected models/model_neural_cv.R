# NEURAL NETWORK

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             savePredictions = "final",
                             classProbs = TRUE,
                             summaryFunction = twoClassSummary,
                             verboseIter = TRUE)

neural_cv <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  twoClassCtrl,
                       method = "mxnet",
                       metric = "ROC")


saveRDS(model_log, "Saved Models/model_neural_cv.rds")