enforceInstallAndLoadPackage <- function (package) {
    if (!(package %in% rownames(installed.packages())) ) {
        install.packages(package, repos = "http://cran.rstudio.com/")
    }
    
    library(package, character.only = TRUE)
}

