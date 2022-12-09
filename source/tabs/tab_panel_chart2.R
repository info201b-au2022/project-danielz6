# tab_panel_chart2

library(shiny)

tab_panel_chart2 <-tabPanel(
    "Chart 2",
    titlePanel("Chart 2"),

    mainPanel(
      plotOutput("plot_death_rates"),
      p("The chart below compares the death rates between the US and Canada which both possess a high socioeconomic standing."),
      
    )
)
