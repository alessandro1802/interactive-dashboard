library(shiny)
library(shinydashboard)
library(shinythemes)
library(ggplot2)
library(DT)

# vag.csv
vag <- read.csv(file = 'data/vag.csv')
vag$brand <- factor(vag$brand, levels = vag$brand)
vag$category <- factor(vag$category, levels = c("Volume", "Premium", "Sport"))

# audi.csv
audi <- read.csv(file = 'data/audi.csv')

shinyServer(function(input, output, session) {
      ### VAG barplot
      global <- reactiveValues(
        toHighlight = rep(FALSE, length(vag$brand)), 
        selectedBarDesc = "(select a Brand by clicking on its bar)"
      )
      
      observeEvent(eventExpr = input$barplot_click, {
        global$selectedBarDesc <- vag$description[round(input$barplot_click$x)]
        global$toHighlight <- vag$description %in% global$selectedBarDesc
      })
      
      output$barplot <- renderPlot({
        ggplot(data = vag, aes(x = brand,
                               y = price,
                               color = category,
                               fill = ifelse(global$toHighlight, yes = "yes", no = "no"))) +
          geom_bar(stat="identity", size = 0.6) +
          scale_y_continuous(breaks = append(seq(0, 80, by = 10), 5, 1)) +
          # colours
          scale_fill_manual(values = c("yes" = "#92c5de", "no" = "#d1e5f0" ), guide = "none" ) +
          scale_color_manual(values=c("#313695", "#fdae61", "#d73027")) +
          # titles
          # labs(title = "VAG revenue in 2021 by brand", x = "Brand", y = "Billion euros", color = "Category") +
          labs(x = "Brand", y = "Billion euros", color = "Category") +
          # theme
          theme_minimal() +
          # font sizes
          theme(axis.text = element_text(size = 14),
                axis.title = element_text(size = 18),
                plot.title = element_text(size = 22),
          # grid
                panel.grid.major.x = element_blank() ,
                panel.grid.major.y = element_line(size = .1, color = "black"), 
          # legend
                legend.title = element_text(size = 15, face = "bold"), 
                legend.text=element_text(size = 13), 
                legend.position="top") + 
          guides(color = guide_legend(override.aes = list(fill = "#d1e5f0")))
      })
      
      output$brandDescription <- renderText({ 
        paste(strong("Description: "), p(), global$selectedBarDesc)
      })
      
      ### Audi table
      output$audi <- DT::renderDataTable({
        DT::datatable({
          data <- audi
          if (input$audiModel != "All") {
            data <- data[data$model == input$audiModel,]
          }
          if (input$audiYear != "All") {
            data <- data[data$year == input$audiYear,]
          }
          data
        })
      })
      
      ### Test
      # generate bins based on input$bins from ui.R
      output$distPlot <- renderPlot({
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
  
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
      })

})
