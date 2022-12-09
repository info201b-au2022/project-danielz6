# tab_panel_chart3

library(shiny)
source("app_server.R")
tab_panel_chart3 <-tabPanel(
    "Chart 3",
    p("This is chart 3."),
    h4("Chart 1"),
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
      
      
  #  selectInput("country1", 
 #     "Select Country:", choices = country_names, selected = "United States"),
#    selectInput("country2",
 #               "Select Country:", choices = country_names, selected = "Australia"),
),
mainPanel(
  plot()
#    plot_water_deaths()
)

)

