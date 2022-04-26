

Data_preProcessing.R --  cleans raw data into a from that caret likes

Data_preProcessing_alt.R -- cleans raw data and adds variables

Global_Func.R -- source code for homemade functions

allPred_df.R -- complies the predictions of the testingSet from every model into a single dataframe

loadModels.R -- loads all models from "~/Saved Models" (I got lazy typing it out every time)

modelCompare.R -- complies the metrics from all the models into a dataframe and saves it into "~/Report Tables" (note: this function call models from environment, so it works for both model_* and model_AP_*)

variableImportancePlot.R -- creates the variable importance plots