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

predictData <- function (fit, data) {
    predicted <- predict(fit, newdata = data)
    predicted
}

rSquared <- function (actual, predicted) {
    value <- 1 - sum((actual - predicted) ^ 2) / sum((actual - mean(actual)) ^ 2)
    value
}

rootMeanSquaredError <- function (actual, predicted) {
    value <- sqrt(mean((predicted - actual) ^ 2))
    value
}
