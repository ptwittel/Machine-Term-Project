# Extrem Gradiant Boosting linear up

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 5,
                             savePredictions = "final",
                             sampling = "up")

xgb_cv_up <- caret::train(default ~ .,
                       data = trainingSet %>% sample_frac(0.1,replace = F),
                       trControl =  twoClassCtrl,
                       method = "xgbLinear")


fitted <- predict(xgb_cv_up, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")

saveRDS(xgb_cv_up, "Saved Models/model_xgb_cv_up.rds")
