# tab_panel_chart3

library(shiny)
source("app_server.R")
tab_panel_chart3 <-tabPanel(
    "Chart 3",
    p("This is chart 3."),
    h4("Chart 1"),
    p("This bar chart analyzes the percentage of countries' population that has safely managed water access."),
    sidebarPanel(
    selectInput("country1", 
      "Select Country:", choices = country_names, selected = "United States"),
    selectInput("country2",
                "Select Country:", choices = country_names, selected = "Australia"),
),
mainPanel(
    plot_water_deaths()
)

)
