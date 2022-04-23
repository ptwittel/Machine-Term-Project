
## Loading Relevent sources/ libraries
library(tidyverse)
library(caret)

source("Support Scripts/Data_Processing_Func.R")
source("Support Scripts/Data_partition.R")

## Pre-Launch procedures
set.seed(817525159)

trainingSet <- trainingSet %>% sample_frac(0.25) ## For debugging perposes

## Run models, saves results in Evironment and ~/Saved Models
(source("models/model_knn_cv_up.R"))
(source("models/model_log_up.R"))
(source("models/model_RF_cv_up.R"))
(source("models/model_xgb_cv_up.R"))
(source("models/model_svm_poly_cv.R"))

