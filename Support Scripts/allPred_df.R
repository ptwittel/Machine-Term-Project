# allPred_df.R create a dataframe that contains all 
# of the prediction vectors from all models

allPred <- data.frame(test = testingSet$default,
                      knn = predict(knn_cv_up, testingSet),
                      log_reg = predict(log_up, testingSet),
                      RF = predict(rf_cv_up, testingSet),
                      XGB = predict(xgb_cv_up, testingSet),
                      SVM = predict(svm_cv, testingSet)) 



