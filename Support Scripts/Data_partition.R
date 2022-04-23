# this function creates and writes Training and Validation dataFrames, 70:30 split,
# this file also cleans the data frame for working with caret

set.seed(3188055)
df <- load_data("Raw Data/final_train.csv") 

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

write_csv(trainingSet, "Clean Data/part_train.csv")

## Testing Data Set

testing <- df[-sample,] 

dummieModel <- dummyVars("default ~ .", data = testing)
testingSetX <- as.data.frame(predict(dummieModel, newdata = testing))

scaleModel <- preProcess(testingSetX, method = c("center", "scale"))       ## MAKE SURE THAT MATCHES THIS
testingSetX <- predict(scaleModel, newdata = testingSetX)

testingSet <- cbind(testing$default, testingSetX)
names(testingSet) <- names(trainingSet)

write_csv(testingSet, "Clean Data/part_validate.csv")

rm(dummieModel, scaleModel, 
   trainingSetX, training,
   testingSetX, testing,
   sample, df)
