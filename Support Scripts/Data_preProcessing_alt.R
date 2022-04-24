# this function creates and writes Training and Validation dataFrames, 70:30 split,
# this file also cleans the data frame for working with caret

set.seed(3188055)
df <- load_data("Data Raw/final_train.csv") %>% 
  crossRow_bill() %>% 
  crossRow_pay() %>% 
  calculate_balance()

df$default <- recode_factor(df$default, "1" = "Pos", "0" = "Neg") 

sample <- caret::createDataPartition(df$default, p = 0.75, list = FALSE)

### Traing Data set

training <- df[sample, ] 

dummieModel <- dummyVars(default ~ ., data = training)
trainingSetX <- as.data.frame(predict(dummieModel, newdata = training))

scaleModel <- preProcess(trainingSetX, method = c("center", "scale"))      ## MAKE SURE THIS MATCHES THAT
trainingSetX <- predict(scaleModel, newdata = trainingSetX)


trainingSet <- cbind(training$default, trainingSetX)
names(trainingSet)[1] <- "default"

write_csv(trainingSet, "Data Clean/part_train.csv")

## Testing Data Set

testing <- df[-sample,] 

dummieModel <- dummyVars("default ~ .", data = testing)
testingSetX <- as.data.frame(predict(dummieModel, newdata = testing))

scaleModel <- preProcess(testingSetX, method = c("center", "scale"))       ## MAKE SURE THAT MATCHES THIS
testingSetX <- predict(scaleModel, newdata = testingSetX)

testingSet <- cbind(testing$default, testingSetX)
names(testingSet) <- names(trainingSet)

write_csv(testingSet, "Data Clean/part_validate.csv")

### COMPITISION DATA
comp <- load_data("Data Raw/final_compete.csv") %>% 
  crossRow_bill() %>% 
  crossRow_pay() %>% 
  calculate_balance()

dummieModel <- dummyVars("~ .", data = comp)
compSet <- as.data.frame(predict(dummieModel, newdata = comp))

scaleModel <- preProcess(compSet, method = c("center", "scale")) 
compSet <- predict(scaleModel, newdata = compSet)

write_csv(compSet, "Data Clean/comp_data.csv")

## REMOVE UN-USED VARIABLES AND DF

rm(dummieModel, scaleModel, 
   trainingSetX, training,
   testingSetX, testing,
   sample, df, comp)
