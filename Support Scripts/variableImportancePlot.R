

plot(varImp(model_knn), main = "Default Variable Importance (KNN with added Predictors)")
plot(varImp(model_log_reg), main = "Default Variable Importance (Logistical Regression with added Predictors)")
plot(varImp(model_RF_cv), main = "Default Variable Importance (Random Forest with added Predictors)")
plot(varImp(model_SVM_cv), main = "Default Variable Importance (Support Vector Machine with added Predictors)")
plot(varImp(model_XGB_cv), main = "Default Variable Importance (Extreme Gradient Boosting with added Predictors)")
