# Extrem Gradiant Boosting linear up

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             savePredictions = "final",
                             sampling = "up",
                             verboseIter = TRUE)

xgb_cv_up <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  twoClassCtrl,
                       method = "xgbTree")


saveRDS(xgb_cv_up, "Saved Models/model_xgb_cv_up.rds")

