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
source("/Users/danielzhang/Documents/info201/Projects/Untitled/project-danielz6/source/tabs/tab_panel_chart3.R")
data <- "https://raw.githubusercontent.com/info201b-au2022/project-danielz6/main/data/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

file <- "/Users/danielzhang/Documents/info201/Projects/Untitled/project-danielz6/data/death-rates-unsafe-water.csv"
death_data <- read.csv(file)

water_access_by_country <- function(Code) {
  water_access <- wateraccessdata[wateraccessdata$Code %in% c('USA', "NOR", "PAK", "NGA", "NIC", "MNE", "RUS", "COL", "KOR", "PHL", "PSE", "MEX", "CAN", "FRA", "DEU", "JPN", "HUN", "ECU", "NZL", "ETH"), ] %>% 
    filter(Year == "2020") %>% 
    group_by(Code) %>% 
    summarise(Safely_Managed_Water = sum(wat_sm)) %>% 
    return(Safely_Managed_Water)
}

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

country_names <- death_data %>%
  filter(Entity == unique(death_data$Entity)) %>%
  select(Entity)

#selectInput("country1",
##            "Select Country:", choices = country_names, selected = "United States"),
#selectInput("country2",
#            "Select Country:", choices = country_names, selected = "Australia"),

input_year_chart3 <- selectInput(
  inputId = "country_input",
  label = "Select Country 1",
  choices = country_names,
  selected = "United States")



input_year_chart3
input_year_chart3b <- selectInput(
  inputId = "country_input2",
  label = "Select Country 2",
  choices = country_names,
  selected = "Australia")

df2 <- death_data %>%
  filter(Entity == input_year_chart3) %>%
filter(as.numeric(Year) > 1999) %>%
  select(3,4)
View(df2)
df3 <- death_data %>%
  filter(Entity == input_year_chart3b) %>%
filter(as.numeric(Year) > 1999) %>%
  select(3,4)
View(df3)
plot <-function() {
  
  ggplot(df2, aes(x = after_stat(year), y = Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.)) +
    geom_point(size = 0.8, alpha = 0.09) +
    geom_smooth(size = 2) +
    theme_minimal() + labs(title = "Jail Population Distribution in the U.S. By State (1970-2018)", x = "Year", y = "Total Jail Population") +
    labs(caption = "This plot shows the differences between the total jail population in each state.")
}

plot()
plot_water_deaths <- function() {
  plot(df2$Year, df2$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,type = "o",col = "red", xlab = "Years", ylab = "Death Rate",
       main = "Death Rate Trends [2000 - 2019]",
       ylim=c(0.02,0.15),
       xlim = c(2000,2019))


  lines(df3$Year, df3$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., type = "o", col = "blue")

  #legend(x=topright,y=0.92, legend=c("Equation 1", "Equation 2"), fill = c("blue","red"))
  legend( x= "topleft", y=0.92,
          legend=c("input_year_chart3","input_year_chart3b"),
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
