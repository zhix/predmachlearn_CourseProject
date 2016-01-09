library(ggplot2)
library(caret)

# set.seed(123)
# cartFit1 <- train(classe~., method="rpart", data=trainData_train1)
# cartFit2 <- train(classe~., method="rpart", data=trainData_train2)
# cartFit3 <- train(classe~., method="rpart", data=trainData_train3)
# cartFit4 <- train(classe~., method="rpart", data=trainData_train4)
# cartFit5 <- train(classe~., method="rpart", data=trainData_train5)
#cartFit$finalModel
#print(cartFit, digit=3)
#rattle::fancyRpartPlot(cartFit$finalModel)
tableAccuracy <- data.frame(Accuracy=numeric())

predictions <- predict(cartFit1, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit2, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit3, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit4, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit5, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

colnames(tableAccuracy) <- "Accuracy"
tableAccuracy

cartFit1 <- train(classe~., method="rpart", 
                  preProcess=c("center","scale"), data=trainData_train1)
cartFit2 <- train(classe~., method="rpart", 
                  preProcess=c("center","scale"), data=trainData_train2)
cartFit3 <- train(classe~., method="rpart", 
                  preProcess=c("center","scale"), data=trainData_train3)
cartFit4 <- train(classe~., method="rpart", 
                  preProcess=c("center","scale"), data=trainData_train4)
cartFit5 <- train(classe~., method="rpart", 
                  preProcess=c("center","scale"), data=trainData_train5)

predictions <- predict(cartFit1, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit2, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit3, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit4, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

predictions <- predict(cartFit5, trainData_test)
tableAccuracy <- rbind(tableAccuracy, confusionMatrix(predictions, trainData_test$classe)$overall[1])

tableAccuracy <- cbind(tableAccuracy, tableAccuracy[c(6:10),])[c(1:5),]
colnames(tableAccuracy) <- c("Accuracy","Accuracy_NormalizedPreProcess")
tableAccuracy