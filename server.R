
shinyServer(function(input, output) {

  output$pltDateTime <- renderPlot({
    
    if (!is.null(input$chkDriverAlcohol)) {
      
      dfPlotData <- dfData %>% 
        filter(DriverAlcohol %in% input$chkDriverAlcohol) %>% 
        filter(BikeInjury %in% input$chkBikeInjury)
        
        plt <- ggplot(dfPlotData, aes(CrashDate, CrashTime, colour = DriverAlcohol, shape = BikeInjury)) + geom_point()
        plt <- plt + scale_x_date(date_breaks = "1 year", date_labels = "%Y")
        plt <- plt + scale_y_datetime(date_breaks = "2 hours", date_labels = "%H:%M")
        plt
    }
     
    
  })
  
})
