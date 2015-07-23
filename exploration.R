source("./data.R")
source("./train.R")
source("./predict.R")

dataPath <- "./data"
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/concrete/compressive/Concrete_Data.xls"
filePath <- setupData(url, dataPath)
data <- loadData(filePath)

partitionedData <- partitionData(data)
nnetFit <- trainDataAsNNet(partitionedData$train)
predictedTestData <- predictData(nnetFit, partitionedData$test)
rmse <- rootMeanSquaredError(partitionedData$test$CompressiveStrength, predictedTestData)
rSq <- rSquared(partitionedData$test$CompressiveStrength, predictedTestData)

plotnet(nnetFit)
garson(nnetFit)
lekprofile(nnetFit)

paths <- persistModel(nnetFit, rmse, rSq, "nnet", directory = "./models")
modelInformation <- retrieveModel(paths)
