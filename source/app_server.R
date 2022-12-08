#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

data <- "C:/Users/eddyw/Documents/Info 201/project-danielz6/data/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

x_values <- c("NZL", "DEU", "KOR", "FRA", "CAN", "JPN", "NOR", "USA", "HUN", "MNE", "PSE", "RUS", "COL", "ECU", "NIC", "PHL", "MEX", "PAK", "NGA", "ETH")

plot_water_access_by_country <- function() {
  bar_chart <- ggplot(water_access_by_country(Code), aes(x = Code, y = Safely_Managed_Water)) +
    geom_bar(stat = "identity", fill = "lightblue", color = "black") +
    scale_x_discrete(limits = x_values) +
    labs(x = "Country Code", y = "Percentage of Safely Managed Water (2020)", title = "Safely Managed Water Access by Country") +
    theme(panel.background = element_rect(fill = "gray"), panel.grid.major = element_line(color = "white"))
  return(bar_chart)
}

plot_water_access_by_country()

server <- function(input, output) {
  data_by_year <- reactive({
    wateraccessdata[wateraccessdata$Code %in% c('USA', "NOR", "PAK", "NGA", "NIC", "MNE", "RUS", "COL", "KOR", "PHL", "PSE", "MEX", "CAN", "FRA", "DEU", "JPN", "HUN", "ECU", "NZL", "ETH"), ] %>% 
      group_by(Code) %>% 
      filter(as.numeric(Year) == as.numeric(input$Year)) %>% 
      summarise(Safely_Managed_Water = sum(wat_sm)) %>% 
      return(Safely_Managed_Water)
  })
  output$plot_water_access_by_country <- renderPlot({
    bar_chart <- ggplot(data_by_year(), aes(x = Code, y = Safely_Managed_Water)) +
      geom_bar(stat = "identity", fill = "lightblue", color = "black") +
      scale_x_discrete(limits = x_values) +
      labs(x = "Country Code", y = "Percentage of Safely Managed Water", title = "Safely Managed Water Access by Country") +
      theme(panel.background = element_rect(fill = "gray"), panel.grid.major = element_line(color = "white"))
    return(bar_chart)
  })
}


