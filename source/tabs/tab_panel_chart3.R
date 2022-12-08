# tab_panel_chart3

library(shiny)
source("app_server.R")
tab_panel_chart3 <-tabPanel(
    "Chart 3",
    p("This is chart 3."),
    h4("Chart 1"),
    p("This bar chart analyzes the percentage of countries' population that has safely managed water access."),
    selectInput("country1", 
      "Select Country:", choices = country_names, selected = "United States"),
    selectInput("country2",
                "Select Country:", choices = country_names, selected = "Australia"),
    plot(df2$Year, df2$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,type = "o",col = "red", xlab = "Years", ylab = "Death Rate", 
         main = "Death Rate Trends [2000 - 2019]",
         ylim=c(0.02,0.15)),
         xlim=c(0.02,0.15),
    
    lines(df3$Year, df3$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., type = "o", col = "blue"),
    
    #legend(x=topright,y=0.92, legend=c("Equation 1", "Equation 2"), fill = c("blue","red"))
    legend( x= "topleft", y=0.92,
            legend=c("Australia","United States"),
            col=c("blue", "red"),
            pch=c("-","-", "-", "-"))
    
)

