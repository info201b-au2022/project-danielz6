# tab_panel_chart2

library(shiny)

tab_panel_chart2 <-tabPanel(
    "Death Rate Comparison by Country",
    titlePanel("Death Rate from Unsafe Water Quality: United States vs. Canada"),

    mainPanel(
      plotOutput("plot_death_rates"),
      p("The chart below compares the death rates between the US and Canada which both possess a high socioeconomic standing."),
      
    )
)
