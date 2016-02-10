
library(shiny)

shinyServer(function(input, output) {

  dfData <- read.csv("CleanData.csv")
  
  output$pltDateTime <- renderPlot({
    
    if (!is.null(input$chkDriverAlcohol)) {
      
      dfPlotData <- dfData %>% 
        filter(DriverAlcohol %in% input$chkDriverAlcohol)
        
        plt <- ggplot(dfPlotData, aes(CrashDate, CrashHour, colour = DriverAlcohol)) + geom_point()
        plt
    }
     
    
  })
  
})
