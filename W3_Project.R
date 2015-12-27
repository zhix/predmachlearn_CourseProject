library(ggplot2)
library(caret)
set.seed(123)

## Data Loading and Processing
wd <- "C:/Users/User/Dropbox/Personal/Coursera/DataScience/8_PredictionMachineLearning/predmachlearn_CourseProject/"
#testFile <- paste(wd, "pml-testing.csv", sep="")
trainFile <- paste(wd, "pml-training.csv", sep="")
setwd(wd)

#testData <- read.table(testFile, na.strings=c("NA",""),
#                       header=TRUE, sep=",")

trainData <- read.table(trainFile, na.strings=c("NA",""),
                       header=TRUE, sep=",")
# 
# # verifying if the datasets have the same colnames
# # all.equal(colnames(trainData), colnames(testData))
# 
# # Count the number of non-NAs in each column.
nonNAs <- function(x) {
  as.vector(apply(x, 2, function(x) length(which(!is.na(x)))))
}
# 
# # Build vector of missing data or NA columns to drop.
colcounter <- nonNAs(trainData)
drops <- c()
for (count in 1:length(colcounter)) {
  if (colcounter[count] < nrow(trainData)) {
    drops <- c(drops, colnames(trainData)[count])
  }
}
# 
# # Drop NA data, then the first 7 columns as they're unnecessary for predicting.
trainData <- trainData[,!(names(trainData) %in% drops)]
trainData <- trainData[,8:length(colnames(trainData))]

# testData <- testData[,!(names(testData) %in% drops)]
# testData <- testData[,8:length(colnames(testData))]
# 
# ## Removing Zero Covariates (Features)
# ## if there is any nzv = TRUE, we have to throw out those variables
# nearZeroVar(trainData, saveMetrics=T)
# nearZeroVar(testData, saveMetrics=T)
# 
# # Show remaining columns.
# # colnames(df_training)
# 
# # Plot the distribution of trainData to make sure it's not disproportionately distributed
# classeTable <- rbind(table(trainData["classe"]), table(trainData["classe"])/sum(table(trainData["classe"]))*100)
# rownames(classeTable) <- c("Freq", "Percentage")
# classeTable <- as.data.frame(t(classeTable))
# 
# ggplot(aes(x=classe), 
#        data=trainData) + 
#   geom_bar() + 
#   ggtitle("Frequency of Classe") +
#   xlab("Classe") + 
#   ylab("Frequency")
# 
# ## Create k-fold partitions
inTrain <- createDataPartition(y=trainData$classe, p=0.75, list=F)
trainData_train <- trainData[inTrain,]
trainData_test <- trainData[-inTrain,]

folds <- createFolds(y=trainData_train$classe, k=10, list=T, returnTrain=F)
trainData_train1 <- trainData_train[folds[[1]],]
# trainData_train2 <- trainData_train[folds[[2]],]
# trainData_train3 <- trainData_train[folds[[3]],]
# trainData_train4 <- trainData_train[folds[[4]],]
# trainData_train5 <- trainData_train[folds[[5]],]

## Data Exploratory and Analysis
# Preprocessing with PCA
# to find the multivariate variables that are uncorrelated and explain as much variance as possible
# 
# prComp <- preProcess(trainData[,-53], method="pca", pcaComp=2, thresh=0.8)
# 
# prCompRotation <- prComp$rotation[order(abs(prComp$rotation[,1]), decreasing=T),]
# summary_prComp <- cbind(mean=prComp$mean, std=prComp$std)
# mFit <- train(classe~., method="glm", preProcess="pca",data=trainData)

## Prediction Model Building 
# Using CART method to find model fitting

# cartFit1 <- train(classe~., method="rpart", data=trainData_train1)
# #cartFit$finalModel
# #print(cartFit, digit=3)
# #rattle::fancyRpartPlot(cartFit$finalModel)
# predictions <- predict(cartFit, trainData_test)
# print(confusionMatrix(predictions, trainData_test$classe), digits=4)

