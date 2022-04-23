# Logical Regression Model


upCtrl <- trainControl(method = "cv",
                       number = 15,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "down")

log_down <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  upCtrl,
                       method = "glm",
                       metric = "ROC",
                       family = "binomial")

log_down

log_down$results

fitted <- predict(log_down, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")
saveRDS(model_log, "Saved Models/model_log_down.rds")
