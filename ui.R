#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    # Theme
    theme = shinytheme("journal"),
    # Application title
    titlePanel("Title"),
    # Tab panels
    tabsetPanel(
      # Tab 1
      tabPanel("tab 1", 
               sliderInput("bins", 
                           "Number of bins:", 
                           min = 1, 
                           max = 50, 
                           value = 30),
               plotOutput("distPlot"),
      ),
      # Tab 2
      tabPanel("tab 2",
               "contents"
      ),
      # Tab 3
      tabPanel("tab 3",
               "contents"
      )
    )
  )
)