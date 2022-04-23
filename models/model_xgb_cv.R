# Extrem Gradiant Boosting linear

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 5,
                             savePredictions = "final")

xgb_cv <- caret::train(default ~ .,
                            data = trainingSet %>% sample_frac(0.1,replace = F),
                            trControl =  twoClassCtrl,
                            method = "xgbLinear")


fitted <- predict(xgb_cv, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")

saveRDS(xgb_cv, "Saved Models/model_xgb_cv.rds")
