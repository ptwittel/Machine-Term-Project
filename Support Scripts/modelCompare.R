# modelCompare.R

cm_knn <- regConfusionMatrix(model_knn)
cm_log_reg <- regConfusionMatrix(model_log_reg)
cm_RF <- regConfusionMatrix(model_RF_cv)
cm_SVM <- regConfusionMatrix(model_SVM_cv)
cm_XGB <- regConfusionMatrix(model_XGB_cv)

cm_matrix <- cbind(cm_knn$byClass, cm_log_reg$byClass, 
      cm_RF$byClass, cm_SVM$byClass, cm_XGB$byClass) %>% t() 
  
rownames(cm_matrix) <- c("knn","log_reg","RF","SVM", "XGB")


LogLoss_val <- c(calLogLoss(model_knn),
                 calLogLoss(model_log_reg),
                 calLogLoss(model_RF_cv),
                 calLogLoss(model_SVM_cv),
                 calLogLoss(model_XGB_cv))


modelMetrics_df <- data.frame(cm_matrix) %>% 
  mutate(LogLoss = LogLoss_val)


write_csv(modelsCM, "modelStats.csv")
