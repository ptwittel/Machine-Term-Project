# Least Square Support Vector Machine

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 5,
                             repeats = 3,
                             sampling = "up",
                             verboseIter = TRUE)

svm_cv <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  twoClassCtrl,
                       method = "svmLinear")


saveRDS(svm_cv, "Saved Models/model_svm_AV_cv.rds")
