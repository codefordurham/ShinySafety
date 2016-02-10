
library(shiny)

shinyUI(
  pageWithSidebar(
  
    headerPanel("Bike Safety Durham"),
    
    sidebarPanel(
      
      checkboxGroupInput("chkDriverAlcohol", label = h3("Driver Alcohol"), 
                         choices = list("Missing", "No", "Yes"),
                         selected = c("Missing", "No", "Yes"))
    ),
    
    mainPanel(
      plotOutput("pltDateTime")
    )
  
  ) # End Page
  
) # End ShinyUI
