# Removed due to shiny requiring the library load
# to be explicit instead of through a helper method
# source("./utils.R")
# enforceInstallAndLoadPackage("caret")
# enforceInstallAndLoadPackage("nnet")
# enforceInstallAndLoadPackage("e1071")
# enforceInstallAndLoadPackage("doParallel")
# enforceInstallAndLoadPackage("parallel")
# enforceInstallAndLoadPackage("NeuralNetTools")

library("caret")
library("nnet")
library("e1071")
library("doParallel")
library("parallel")
library("NeuralNetTools")

partitionData <- function (data) {
    trainIndex <- createDataPartition(data$CompressiveStrength, p = 0.75, list = F)
    partitionedData <- list(train = data[trainIndex, ], test = data[-trainIndex, ])
    partitionedData
}

trainDataAsNNet <- function (data) {
    clusterCores <- max(1, detectCores() - 1)
    cluster <- makeCluster(clusterCores)
    registerDoParallel(cluster)
    trControl <- trainControl(method = "cv", number = 10) 
    tuneGrid <- expand.grid(.decay = 10 ^ seq(-4, 0, 0.5), .size = 1:15)
    nnetFit <- train(CompressiveStrength ~ .,
                     data = data,
                     preProcess = "range",
                     method = "nnet",
                     maxit = 5000,
                     trControl = trControl,
                     tuneGrid = tuneGrid,
                     linout = 1,
                     trace = F)
    stopCluster(cluster)
    nnetFit
}
