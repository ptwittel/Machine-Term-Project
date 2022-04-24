# Logical Regression Model DOWN SAMPLING


downCtrl <- trainControl(method = "repeatedcv",
                       number = 5,
                       repeats = 3,
                       savePredictions = "final",
                       classProbs = TRUE,
                       summaryFunction = twoClassSummary,
                       sampling = "down",
                       verboseIter = TRUE)

log_down <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  downCtrl,
                       method = "glm",
                       metric = "ROC",
                       family = "binomial")

saveRDS(log_down, "Saved Models/model_log_down.rds")
