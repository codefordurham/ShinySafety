library(dplyr)

download <- FALSE

if (download){

  strDownload <- "CrashData.csv.gz"  
  bikeSafetyURL <- "https://github.com/BikeSafety/BikeSafety/blob/master/data/North_Carolina_Bicycle_Crash_Data.csv.gz?raw=true"
  download.file(bikeSafetyURL, strDownload, mode="wb")
  rawData <- read.csv(gzfile(strDownload), stringsAsFactors = FALSE)
  unlink(strDownload)
  rawData %>% write.csv("RawData.csv", row.names = FALSE)

} else {
  
  rawData <- read.csv("RawData.csv", stringsAsFactors = FALSE)
  
}

cleanData <- rawData %>% 
  rename(Ambulance = AmbulanceR
         , BikeAgeGroup = BikeAge_Gr
         , BikeAge = Bike_Age
         , BikeAlcohol = Bike_Alc_D
         , BikeDirection = Bike_Dir
         , BikeInjury = Bike_Injur
         , BikePosition = Bike_Pos
         , BikeRace = Bike_Race
         , BikeGender = Bike_Sex
         , CrashMonth = Crash_Mont
         , CrashTime = Crash_Time
         , CrashDate = Crash_Date
         , CrashHour = Crash_Hour
         , DriverAlcohol = Drvr_Alc_D) %>% 
  mutate(CrashDate = lubridate::parse_date_time(CrashDate, "mdy I:M!:S! p")
         , CrashDate = as.Date(CrashDate)
         , CrashTime = lubridate::parse_date_time(CrashTime, "%H:%M"))

lubridate::year(cleanData$CrashTime) <- 2007

cleanData %>% write.csv("CleanData.csv", row.names = FALSE)
