library(ggplot2)
library(caret)
library(randomForest)

## Load testData

## Predict testData
tablePredic <- data.frame(rep("", 20), stringAsFactors=TRUE)

tablePredic[,1] <- predict(rfFit1, testData)
tablePredic[,2] <- predict(rfFit2, testData)
tablePredic[,3] <- predict(rfFit3, testData)
tablePredic[,4] <- predict(rfFit4, testData)
tablePredic[,5] <- predict(rfFit5, testData)
tablePredic[,6] <- testData$problem_id

colnames(tablePredic) <- c("Fit1","Fit2","Fit3","Fit4","Fit5","Problem_id")
tablePredic

## Sumbit the answer
answers = tablePredic[,1] ##Answer in the vector format

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(answers)
