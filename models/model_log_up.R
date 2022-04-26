# LOGISTIC REGRESSION UP SAMPLING

upCtrl <- trainControl(method = "repeatedcv",
                       number = 10,
                       repeats = 5,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "up",
                       verboseIter = TRUE)

log_up <- caret::train(default ~ .,
                         data = trainingSet,
                         trControl =  upCtrl,
                         method = "glm",
                         metric = "ROC",
                         family = "binomial")


saveRDS(log_up, "Saved Models/model_log_up.rds")
