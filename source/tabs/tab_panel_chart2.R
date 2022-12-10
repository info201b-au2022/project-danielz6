# tab_panel_chart2

library(shiny)
library(dplyr)

tab_panel_chart2 <-tabPanel(
    "Death Rate Comparison by Country",
    titlePanel("Death Rate from Water Quality by Country"),
    sidebarPanel(
      input_year_chart2 <- selectInput(
        inputId = "chart2_country_input",
        label = "Select Year",
        choices = c('Afghanistan', 'Canada', 'African Region (WHO)', 'Brazil'),
        selected = "Canada"),
    ),
    mainPanel(
      plotOutput("plot_death_rates"),
      p("The chart below compares the range of death rates between countries and regions that are similar and vastly different in socioeconomic standing, overall infrastructure, and access to clean and safe water. Specifically, this chart consistently compares the US to Canada, Africa, Brazil, and Afghanistan, which is helpful in examining where the US stands in comparison to different areas, and what factors are contributing to a higher or lower death rate in the various regions."),
      
    )
)
