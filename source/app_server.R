#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

server <- function(input, output) {
  data_by_year <- reactive({
    wateraccessdata %>% 
      filter(year == input$Year)
  })
  output$plot_water_access_by_country <- renderPlot({
    bar_chart <- ggplot(data_by_year(), aes(x = Code, y = Safely_Managed_Water)) +
      geom_bar(stat = "identity", fill = "lightblue", color = "black") +
      scale_x_discrete(limits = x_values) +
      labs(x = "Country Code", y = "Percentage of Safely Managed Water", title = "Safely Managed Water Access by Country") +
      theme(panel.background = element_rect(fill = "gray"), panel.grid.major = element_line(color = "white"))
    return(bar_chart)
  })
    # TBD
}


