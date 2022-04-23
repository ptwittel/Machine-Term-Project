# Least Square Support Vector Machine

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 5,
                             savePredictions = "final")

svm_poly_cv <- caret::train(default ~ .,
                       data = trainingSet %>% sample_frac(0.1,replace = F),
                       trControl =  twoClassCtrl,
                       method = "lssvmPoly")


fitted <- predict(svm_poly_cv, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")

saveRDS(model_log, "Saved Models/model_svm_poly_cv.rds")