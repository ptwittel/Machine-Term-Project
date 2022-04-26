
## Loading Relevent sources/ libraries
library(tidyverse)
library(caret)

source("Support Scripts/Global_Func.R")
source("Support Scripts/Data_preProcessing.R")

## Pre-Launch procedures
set.seed(817525159)

# trainingSet <- trainingSet %>% sample_frac(0.01) ## for small model runs and debugging

## Run models, saves results in Environment and ~/Saved Models
(source("models/model_knn_cv_up.R"))
(source("models/model_log_up.R"))
(source("models/model_RF_cv_up.R"))
(source("models/model_xgb_cv_up.R"))
(source("models/model_svm_cv_up.R"))
#(source("models/model_svm_poly_cv.R")) HORRABLLY INEFFIENCT COMPUTATIONAL REQUIRMENT!!!
#(source("models/model_svm_rad_up.R")) #For an additional run for funzes


## Runs model on Added Predictor data, saves results in Environment and ~/Saved Models
source("Support Scripts/Data_preProcessing_alt.R")

set.seed(817525159)

(source("models/model_knn_AP_cv_up.R"))
(source("models/model_log_AP_up.R"))
(source("models/model_RF_AP_cv_up.R"))
(source("models/model_xgb_AP_cv_up.R"))
(source("models/model_svm_AP_cv_up.R"))
