# Support Vector Machine

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             sampling = "up",
                             verboseIter = TRUE)

svm_poly_cv <- caret::train(default ~ .,
                            data = trainingSet,
                            trControl =  twoClassCtrl,
                            method = "svmPoly")


saveRDS(model_log, "Saved Models/model_svm_poly_cv.rds")