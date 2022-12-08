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

data <- "https://raw.githubusercontent.com/info201b-au2022/project-danielz6/main/data/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

x_values <- c("NZL", "DEU", "KOR", "FRA", "CAN", "JPN", "NOR", "USA", "HUN", "MNE", "PSE", "RUS", "COL", "ECU", "NIC", "PHL", "MEX", "PAK", "NGA", "ETH")

water_access_by_country <- function(Code) {
  water_access <- wateraccessdata[wateraccessdata$Code %in% c('USA', "NOR", "PAK", "NGA", "NIC", "MNE", "RUS", "COL", "KOR", "PHL", "PSE", "MEX", "CAN", "FRA", "DEU", "JPN", "HUN", "ECU", "NZL", "ETH"), ] %>% 
    filter(Year == "2020") %>% 
    group_by(Code) %>% 
    summarise(Safely_Managed_Water = sum(wat_sm)) %>% 
    return(Safely_Managed_Water)
}

plot_water_access_by_country <- function() {
  bar_chart <- ggplot(water_access_by_country(Code), aes(x = Code, y = Safely_Managed_Water)) +
    geom_bar(stat = "identity", fill = "lightblue", color = "black") +
    scale_x_discrete(limits = x_values) +
    labs(x = "Country Code", y = "Percentage of Safely Managed Water (2020)", title = "Safely Managed Water Access by Country") +
    theme(panel.background = element_rect(fill = "gray"), panel.grid.major = element_line(color = "white"))
  return(bar_chart)
}

plot_water_access_by_country()

plot_water_deaths <- function() {
  plot(df2$Year, df2$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,type = "o",col = "red", xlab = "Years", ylab = "Death Rate",
       main = "Death Rate Trends [2000 - 2019]",
       ylim=c(0.02,0.15),
       xlim = c(2000,2019))


  lines(df3$Year, df3$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., type = "o", col = "blue")

  #legend(x=topright,y=0.92, legend=c("Equation 1", "Equation 2"), fill = c("blue","red"))
  legend( x= "topleft", y=0.92,
          legend=c("Australia","United States"),
          col=c("blue", "red"),
          pch=c("-","-", "-", "-"))

}
plot_water_deaths()

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





##  output$distPlot <- renderPlotly({
 #   x <- ggplot +
 #     geom_col(mapping = aes(x = year, y = .data[[input$data]]),
 #              color = input$color)
    
    
  





