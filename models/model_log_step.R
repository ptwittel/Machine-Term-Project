# Logical Regression Model


upCtrl <- trainControl(method = "cv",
                       number = 15,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "up")

log_step <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  upCtrl,
                       method = "glmStepAIC",
                       metric = "ROC",
                       family = "binomial")

log_step

log_step$results

fitted <- predict(log_step, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")
saveRDS(model_log, "Saved Models/model_logistic_cv.rds")
