# Logical Regression Model StepAIC


upCtrl <- trainControl(method = "repeatedcv",
                       number = 5,
                       repeats = 3,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "up",
                       verboseIter = TRUE)

log_step <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  upCtrl,
                       method = "glmStepAIC",
                       metric = "ROC",
                       family = "binomial")


saveRDS(log_step, "Saved Models/model_log_step.rds")
