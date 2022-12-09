# tab_panel_chart2

library(shiny)

tab_panel_chart2 <-tabPanel(
    "Chart 2",
    p("This is chart 2.")
    h4("Chart 2")
    p("The chart below compares the death rates between the US and Canada which both possess a high socioeconomic standing.")
    
    death_data <- read.csv(file)

uk <- death_data %>%
  filter(Entity == "United States") %>%
  select (1,4)

usa <- death_data %>%
  filter(Entity == "Canada") %>%
  select (1,4)

boxplot(uk$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,
        usa$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., 
        ylim = range(0.01:2),
        ylab = "Death Range",
        names=c("US", "Canada"))
        title(main = "Death Rates from Unsafe Water Sources")
)
