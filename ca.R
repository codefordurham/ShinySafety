library(dplyr)
library(ggplot2)

dfData <- readr::read_csv("CleanData.csv")

injuryGender <- table(dfData$BikeInjury, dfData$BikeGender)
injuryGender

cMat <- injuryGender / sum(injuryGender)
cMat

library(ca)
data("smoke")
ca(smoke)

# dfSmall <- dfData %>% 
#   select(BikeInjury, BikeGender, Locality, Light_Cond, Rd_Class)
# 
# dfInjuryGender <- dfSmall %>% 
#   group_by(BikeGender, BikeInjury) %>% 
#   summarise(Count = n())
# 
# mojo <- ggplot(dfInjuryGender, aes(BikeGender, BikeInjury, fill = Count)) + geom_tile()
# mojo
# 
# dfInjuryGender <- dfSmall %>% 
#   mutate(GenderPos = as.factor(BikeGender)
#          , InjuryPos = as.factor(BikeInjury)
#          , GenderPos = as.integer(GenderPos)
#          , InjuryPos = as.integer(InjuryPos))
# dfInjuryGender$IncidentNum <- seq(1, nrow(dfInjuryGender))
# 
# dfDistance <- dist(dfInjuryGender[, c("GenderPos", "InjuryPos")], method = "manhattan")
# 
# dfInjuryGenderLocality <- dfSmall %>% 
#   mutate(GenderPos = as.factor(BikeGender)
#          , InjuryPos = as.factor(BikeInjury)
#          , LocalityPos = as.factor(Locality)
#          , GenderPos = as.integer(GenderPos)
#          , InjuryPos = as.integer(InjuryPos)
#          , Local = as.integer(LocalityPos))
# 
# moreDist <- dist(dfInjuryGenderLocality[, c("GenderPos", "InjuryPos", "LocalityPos")], method = "manhattan")
