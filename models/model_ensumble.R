## Ensumble Model evaluation

source("Support Scripts/allPred_df.R")

allPred_binary <- allPred %>% 
  transmute(test = ifelse(test == "Pos", 1, 0),
            knn = ifelse(knn == "Pos", 1, 0),
            log_reg = ifelse(log_reg == "Pos", 1, 0),
            RF = ifelse(RF == "Pos", 1, 0),
            XGB = ifelse(XGB == "Pos", 1, 0),
            SVM = ifelse(SVM == "Pos", 1, 0))

# Ensumble Model creating, average between all models
allPred_binary <- allPred_binary %>% 
  rowwise() %>% 
  mutate(ensumble = ifelse(knn + log_reg + RF + XGB + SVM > 3, 1, 0),
         ensumble_reduced = ifelse(log_reg + XGB + SVM > 2, 1, 0))

confusionMatrix(reference = testingSet$default,
                data = as.factor(ifelse(allPred_binary$ensumble == 1, "Pos", "Neg")),
                positive = "Pos")

confusionMatrix(reference = testingSet$default,
                data = as.factor(ifelse(allPred_binary$ensumble_reduced == 1, "Pos", "Neg")),
                positive = "Pos")
