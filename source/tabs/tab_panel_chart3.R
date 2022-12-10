# tab_panel_chart3

library(shiny)
library(dplyr)


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
  p("This bar chart analyzes the percentage of countries' population that has died from unsafe water."),
  
)

)

