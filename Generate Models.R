
## Loading Relevent sources/ libraries
library(tidyverse)
library(caret)

source("Support Scripts/Global_Func.R")


# loading data
source("Support Scripts/Data_preProcessing.R")
set.seed(817525159)

## Run models, saves results in Environment and ~/Saved Models
(source("models/model_knn_cv_up.R"))
(source("models/model_log_up.R"))
(source("models/model_RF_cv_up.R"))
(source("models/model_xgb_cv_up.R"))
(source("models/model_svm_cv_up.R"))


# Loading Added Predictors data
source("Support Scripts/Data_preProcessing_alt.R")
set.seed(817525159)

## Runs model on Added Predictor data, saves results in Environment and ~/Saved Models
(source("models/model_knn_AP_cv_up.R"))
(source("models/model_log_AP_up.R"))
(source("models/model_RF_AP_cv_up.R"))
(source("models/model_xgb_AP_cv_up.R"))
(source("models/model_svm_AP_cv_up.R"))
