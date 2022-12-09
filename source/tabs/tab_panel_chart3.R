# tab_panel_chart3

library(shiny)
source("app_server.R")
tab_panel_chart3 <-tabPanel(
    "Chart 3",
    titlePanel("Chart 1"),
    p("This bar chart analyzes the percentage of countries' population that has safely managed water access."),
    sidebarPanel(
      input_year_chart3 <- selectInput(
        inputId = "country_input",
        label = "Select Country 1",
        choices = country_names,
        selected = "United States"),
      
      input_year_chart3b <- selectInput(
        inputId = "country_input2",
        label = "Select Country 2",
        choices = country_names,
        selected = "Australia")

),
mainPanel(
  plotOutput("plot_water_deaths")
#    plot_water_deaths()
)

)

