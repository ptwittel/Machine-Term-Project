# Least Square Support Vector Machine

twoClassCtrl <- trainControl(method = "repeatedcv",
                             number = 10,
                             repeats = 5)

svm_cv <- caret::train(default ~ .,
                       data = trainingSet,
                       trControl =  twoClassCtrl,
                       method = "svmLinear")

svm_cv

fitted <- predict(svm_cv, testingSet)

confusionMatrix(reference = testingSet$default, data = fitted, 
                mode = "everything", positive = "Pos")

saveRDS(svm_cv, "Saved Models/model_svm_cv.rds")
