# tab_panel_chart3

library(shiny)
library(dplyr)

file <- "../data/death-rates-unsafe-water.csv"
death_data <- read.csv(file)

country_names <- death_data %>%
  filter(Entity == unique(death_data$Entity)) %>%
  select(Entity)

tab_panel_chart3 <-tabPanel(
    "Global Death Rate Comparison",
    titlePanel("Death Rate from Unsafe Water Quality: Global"),
    sidebarPanel(
      input_year_chart3 <- selectInput(
        inputId = "country_input",
        label = "Select Country 1",
        choices = country_names,
        selected = "Afghanistan"),
      
      input_year_chart3b <- selectInput(
        inputId = "country_input2",
        label = "Select Country 2",
        choices = country_names,
        selected = "Bolivia")

),
mainPanel(
  plotOutput("plot_water_deaths"),
  p("This chart compares the death rate amongst the majority of regions and countries globally and reveals the trend in the death rate from poor water quality. It takes two countries and compares the trend in death rate, which is important in understanding how different parts of the world are impacted by the access to safe water, and what countries are having a high death rate; emphasizing the need for policies and practices that can help decrease the death rate."),
  
)

)

