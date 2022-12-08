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
server2 <- function(input, output) {
  
  
  plot(.data[[input$data]], usa$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,type = "o",col = "red", xlab = "Years", ylab = "Death Rate", 
       main = "Death Rate Trends [2000 - 2019]",
       ylim=c(0.02,0.15))
  
  lines(.data[[input$data2]], aus$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., type = "o", col = "blue")
  
  legend( x= "topleft", y=0.92,
          legend=c("Australia","United States"),
          col=c("blue", "red"),
          pch=c("-","-", "-", "-"))
  
  
##  output$distPlot <- renderPlotly({
 #   x <- ggplot +
 #     geom_col(mapping = aes(x = year, y = .data[[input$data]]),
 #              color = input$color)
    
    
  }





