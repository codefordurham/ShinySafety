
shinyServer(function(input, output) {

  ranges <- reactiveValues(x = NULL, y = NULL)
  
  output$pltDateTime <- renderPlot({
    
    if (!is.null(input$chkDriverAlcohol)) {
      
      dfPlotData <- dfData %>% 
        filter(DriverAlcohol %in% input$chkDriverAlcohol) %>% 
        filter(BikeInjury %in% input$chkBikeInjury)
        
        plt <- ggplot(dfPlotData, aes(CrashDate, CrashTime, colour = DriverAlcohol, shape = BikeInjury)) + geom_point()
        plt <- plt + coord_cartesian(xlim = ranges$x, ylim = ranges$y)
        plt <- plt + scale_x_date(date_breaks = "1 year", date_labels = "%Y")
        plt <- plt + scale_y_datetime(date_breaks = "2 hours", date_labels = "%H:%M")
        plt
    }

  })

  observeEvent(input$pltDateTime_dblclick, {
    brush <- input$pltDateTime_brush
    if (!is.null(brush)) {
      ranges$x <- c(brush$xmin, brush$xmax)
      ranges$y <- c(brush$ymin, brush$ymax)
      ranges$x <- as.Date(ranges$x, origin = "1970-01-01")
      ranges$y <- as.POSIXct(ranges$y, origin = "1970-01-01")
    } else {
      ranges$x <- NULL
      ranges$y <- NULL
    }
  })
  
  output$pltMDS <- renderPlot({
    selectedMDS <- intersect(names(dfMDS), input$chkMDS)
    # selectedMDS <- intersect(names(dfMDS), strMDS)
    print(selectedMDS)
    dfPlotMDS <- dfMDS[, selectedMDS]
    myMds <- GetMDS(dfPlotMDS)
    autoplot(myMds, label = TRUE)
    
  })
  
})
