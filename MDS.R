library(dplyr)
library(ggfortify)

GetMDS <- function(df){
  
  matMDS <- t(as.matrix(df))
  
  matCovar <- matMDS %*% t(matMDS)
  matDist <- dist(matCovar)
  
  mds <- cmdscale(matDist, eig = TRUE)
  
  mds
}

PlotMDS <- function(mdsObj){
  
  plot(mdsObj, type = 'n')
  text(mdsObj, rownames(matMDS))
  
}

#=========
# load the data if needed
if (is.null(dfData)){
  dfData <- readr::read_csv("CleanData.csv")
}

dfMDS <- dfData %>% 
  mutate(Fatality = ifelse(BikeInjury == "K: Killed", 1, -1)
         , NoInjury = ifelse(BikeInjury == "O: No Injury", 1, -1)
         , BikeAlcohol = ifelse(BikeAlcohol == "Yes", 1, -1)
         , FacingTraffic = ifelse(BikeDirection == "FacingTraffic", 1, -1)
         , Intersection = ifelse(Crash_Loc == "Intersection", 1, -1)
         , Residential = ifelse(Developmen == "Residential", 1, -1)
         , DriverAlcohol = ifelse(DriverAlcohol == "Yes", 1, -1)) %>% 
  select(Fatality, NoInjury, BikeAlcohol, FacingTraffic, Intersection, Residential, DriverAlcohol)

strMDS <- names(dfMDS)

# dfMDS %>% PlotMDS()
# dfMDS %>% select(-Intersection, -Residential) %>% PlotMDS
