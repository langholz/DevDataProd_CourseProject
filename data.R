# Removed due to shiny requiring the library load
# to be explicit instead of through a helper method
# source("./utils.R")
# enforceInstallAndLoadPackage("gdata")

library("gdata")

downloadDataIfNotPresent <- function (url, directory = NULL) {
    fileName <- basename(url)
    filePath <- ifelse(!is.null(directory), file.path(directory, fileName), paste0("./", fileName))
    if (!file.exists(filePath)) { download.file(url, filePath, method = "curl") }
    filePath
}

setupData <- function (url, directory) {
    dir.create(directory, showWarnings = F)
    filePath <- downloadDataIfNotPresent(url, directory)
    filePath
}

readData <- function (path) {
    dataFrame <- read.xls(filePath, sheet = 1, header = TRUE)
    dataFrame
}

renameDataColumns <- function (data) {
    names(data) <- c("Cement", "BlastFurnaceSlag", "FlyAsh",
                     "Water", "Superplasticizer", "CoarseAggregate",
                     "FineAggregate", "Age", "CompressiveStrength")
    data
}

loadData <- function (filePath) {
    data <- readData(filePath)
    data <- renameDataColumns(data)
    data
}

loadObject <- function (filePath) {
    data <- NULL
    load(filePath)
    data
}

saveObject <- function (filePath, data) {
    save(data, file = filePath)
}

persistModel <- function (model, rmse, rSq, name, directory = "./") {
    if (directory != "./") { dir.create(directory, showWarnings = F) }
    modelPath <- file.path(directory, paste0(name, ".RData"))
    modelPropertiesPath <- file.path(directory, paste0(name, "-prop.RData"))
    save(model, file = modelPath)
    save(rmse, rSq, file = modelPropertiesPath)
    modelPaths <- list(model = modelPath, properties = modelPropertiesPath)
    modelPaths
}

retrieveModel <- function (paths) {
    load(paths$model)
    load(paths$properties)
    modelInformation <- list(model = model, rmse = rmse, rSq = rSq)
    modelInformation
}
