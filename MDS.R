library(dplyr)
dfData <- readr::read_csv("CleanData.csv")

dfMDS <- dfData %>% 
  mutate(Fatality = ifelse(BikeInjury == "K: Killed", 1, -1)
         , NoInjury = ifelse(BikeInjury == "O: No Injury", 1, -1)
         , BikeAlcohol = ifelse(BikeAlcohol == "Yes", 1, -1)
         , FacingTraffic = ifelse(BikeDirection == "FacingTraffic", 1, -1)
         , Intersection = ifelse(Crash_Loc == "Intersection", 1, -1)
         , Residential = ifelse(Developmen == "Residential", 1, -1)
         , DriverAlcohol = ifelse(DriverAlcohol == "Yes", 1, -1)) %>% 
  select(Fatality, NoInjury, BikeAlcohol, FacingTraffic, Intersection, Residential, DriverAlcohol)

PlotMDS <- function(df){
  matMDS <- t(as.matrix(df))
  
  matCovar <- matMDS %*% t(matMDS)
  matDist <- dist(matCovar)
  
  mdsAccident <- cmdscale(matDist)
  plot(mdsAccident, type = 'n')
  text(mdsAccident, rownames(matMDS))
  
}

dfMDS %>% PlotMDS()
dfMDS %>% select(-Intersection, -Residential) %>% PlotMDS
