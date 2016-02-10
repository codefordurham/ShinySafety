library(dplyr)

download <- TRUE

strDownload <- "CrashData.csv.gz"

if (download){
  
  bikeSafetyURL <- "https://github.com/BikeSafety/BikeSafety/blob/master/data/North_Carolina_Bicycle_Crash_Data.csv.gz?raw=true"
  download.file(bikeSafetyURL, strDownload)
  rawData <- read.csv(gzfile(strDownload), stringsAsFactors = FALSE)
  unlink(strDownload)
  rawData %>% write.csv("RawData.csv", row.names = FALSE)

} else {
  
  rawData <- read.csv("RawData.csv", stringsAsFactors = FALSE)
  
}

cleanData <- rawData %>% 
  rename(CrashMonth = Crash_Mont
         , CrashTime = Crash_Time
         , CrashDate = Crash_Date
         , CrashHour = Crash_Hour
         , DriverAlcohol = Drvr_Alc_D
         , BikeAlcohol = Bike_Alc_D) %>% 
  mutate(CrashDate = lubridate::parse_date_time(CrashDate, "mdy I:M!:S! p"))

cleanData %>% write.csv("CleanData.csv", row.names = FALSE)
