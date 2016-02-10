
library(shiny)
library(dplyr)
library(ggplot2)

source("MakeWidgets.R")

shinyUI(
  pageWithSidebar(
  
    headerPanel("Bike Safety Durham"),
    
    sidebarPanel(
      
        checkboxGroupInput("chkDriverAlcohol", label = h4("Driver Alcohol"), 
                         choices = as.list(strDriverAlcohol),
                         selected = strDriverAlcohol)
      
      , checkboxGroupInput("chkBikeInjury", label = h4("Bike Injury"), 
                         choices = as.list(strBikeInjury),
                         selected = strBikeInjury)
    ),
    
    mainPanel(
      plotOutput("pltDateTime")
    )
  
  ) # End Page
  
) # End ShinyUI
