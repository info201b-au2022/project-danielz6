# tab_panel_chart1

library(shiny)

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    selectInput("Year", "Select year:", choices = c("2015", "2016", "2017", "2018", "2019", "2020"), selected = "2020"),
    plotOutput("plot_water_access_by_country"),
)

