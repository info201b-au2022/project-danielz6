# tab_panel_chart2

library(shiny)
library(dplyr)

# country_names <- death_data %>%
#   filter(Entity %in% c('Afghanistan', "Canada", 'African Region (WHO)', 'Brazil')) %>%
#   select(Entity)
# view(country_names)
#country_names <- death_data[death_data$Entity %in% c('Afghanistan', "Canada", 'African Region (WHO)', 'Brazil')]

tab_panel_chart2 <-tabPanel(
    "Death Rate Comparison by Country",
    titlePanel("Death Rate from Unsafe Water Quality: Country"),
    sidebarPanel(
      input_year_chart2 <- selectInput(
        inputId = "country_input",
        label = "Select Year",
        choices = c('Afghanistan', 'Canada', 'African Region (WHO)', 'Brazil'),
        selected = "Canada"),
    ),
    mainPanel(
      plotOutput("plot_death_rates"),
      p("The chart below compares the death rates between the US and Canada which both possess a high socioeconomic standing."),
      
    )
)
