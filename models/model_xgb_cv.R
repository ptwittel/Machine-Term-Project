# Extrem Gradiant Boosting linear

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             savePredictions = "final",
                             verboseIter = TRUE)

xgb_cv <- caret::train(default ~ .,
                            data = trainingSet,
                            trControl =  twoClassCtrl,
                            method = "xgbLinear")


saveRDS(xgb_cv, "Saved Models/model_xgb_cv.rds")
