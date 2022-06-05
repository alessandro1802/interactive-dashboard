library(shiny)
library(shinydashboard)
library(shinythemes)

shinyUI(
  fluidPage(
    # Theme
    theme = shinytheme("journal"),
    # Application title
    titlePanel(
      div(
        "Volkswagen Group observations and statistics",
        # Logo
        img(src="logo1.png", 
              align = "right", 
              width="20%", 
              height="20%", 
              style="vertical-align: top;"
        )
      )
    ),
    # Tab panels
    tabsetPanel(
      # Tab 1
      tabPanel("About",
               p("This page is about Volkswagen Group."),
               p("
                 The Volkswagen Group sells passenger cars under the Audi, Bentley, Cupra, Lamborghini, Porsche, SEAT, Škoda and Volkswagen brands; motorcycles under the Ducati name;
                 light commercial vehicles under the Volkswagen Commercial Vehicles brand; and heavy commercial vehicles via the marques of listed subsidiary Traton 
                 (IC Bus, International, MAN, Scania and Volkswagen Caminhões e Ônibus). It is divided into two primary divisions—the Automotive Division and the 
                 Financial Services Division—and as of 2008, it had about 342 subsidiary companies. Volkswagen also has two major joint ventures in China, FAW-Volkswagen and SAIC Volkswagen. 
                 The company has operations in roughly 150 countries, and it has 100 production facilities across 27 countries.
                 "), 
               p("
                 From the late 1970s to 1992, the acronym V.A.G. was used by Volkswagen AG as a brand for group-wide activities, such as distribution and leasing. Contrary to popular belief, 
                 'V.A.G.' had no official meaning, and was never the formal name of the Volkswagen Group. 
                 "),
               p("You can find here interesting facts, statistics and comparisons of different car models."), 
               p(a("Source: Wikipedea page of Volkswagen Group", 
                   href="https://en.wikipedia.org/wiki/Volkswagen_Group"), 
                 align = "center")
      ),
      
      # Tab 2
      tabPanel("VAG",
               p("
                  The Volkswagen Group (Volkswagen Aktiengesellschaft) focuses on producing automobiles, commercial vehicles, engines, motorcycles, and turbo-machinery.
                  The company, which is publicly listed on the Frankfurt Stock Exchange (under the stock ticker symbol ‘VOW’), is based in Wolfsburg, Germany.
                  It is one of the world’s leading producers of motor vehicles (along with General Motors and Toyota). It is currently the second largest automaker in the world, after Toyota.
                  In July 2014, it pushed GM into third place. Analysts believe the company will take the number 1 spot within the next 18 months.
                  The group sells its vehicles in 153 countries and has a total of 106 production plants across Europe, the Americas, Asia and Africa.
                  Volkswagen claims that its team of 572,800 employees produces approximately 39,350 vehicles on a regular weekday.
                 "),
               p("
                  The plot below shows VAG revenue in 2021 by brand. 
                  Clicking on a particular bar displays the information about the manufacturer.
                 "),
               p(), 
               fluidRow(
                 column(8,
                        plotOutput("barplot", click = "barplot_click")
                 ),
                 column(4,
                        htmlOutput("brandDescription")
                 )
               )
      ),
      
      # Tab 3
      tabPanel("tab",
               "contents"
      ), 
      
      # Tab 4
      tabPanel("tab",
               "contents"
      ), 
      
      # Tab 5
      tabPanel("tab",
               "contents"
      ), 
      
      # Tab 6
      tabPanel("tab",
               "contents"
      ), 
      
      # Tab 7
      tabPanel("Test",
               sliderInput("bins",
                           "Number of bins:",
                           min = 1,
                           max = 50,
                           value = 30),
               plotOutput("distPlot")
      )
      
    )
  )
)