#==============
# libs
library(shiny)
library(dplyr)
library(ggplot2)

#=================
# UI widgets
source("MakeWidgets.R")
source("MDS.R")

shinyUI(fluidPage(
    
    titlePanel("Bike Safety Durham"),
    
    fluidRow(
      column(width = 2 
             
             , checkboxGroupInput("chkDriverAlcohol", label = h4("Driver Alcohol"), 
                         choices = as.list(strDriverAlcohol),
                         selected = strDriverAlcohol)
      
            , checkboxGroupInput("chkBikeInjury", label = h4("Bike Injury"), 
                               choices = as.list(strBikeInjury),
                               selected = strBikeInjury)
      ), # Row 1, Column 1
    
    column(width = 10
           , plotOutput("pltDateTime"
                        , dblclick = "pltDateTime_dblclick"
                        , brush = brushOpts(id = "pltDateTime_brush", resetOnNew = TRUE)
                        )
      ) # Row 1, Column 2
    ), # End Row 1
    
    fluidRow(
      column(width = 2
             , h2("Multi-dimensional Scaling")
             , checkboxGroupInput("chkMDS", label = h4("MDS dimensions")
                                  , choices = as.list(strMDS)
                                  , selected = strMDS)
             )
      , column(width = 10
               , plotOutput("pltMDS"))
    )
    
  ) # End fluidPage
  
) # End ShinyUI
