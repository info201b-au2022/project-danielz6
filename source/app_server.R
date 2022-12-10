library(shiny)
library(ggplot2)
library(dplyr)
data <- "https://raw.githubusercontent.com/info201b-au2022/project-danielz6/main/data/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

file <- "../data/death-rates-unsafe-water.csv"
death_data <- read.csv(file)

water_access_by_country <- function(Code) {
  water_access <- wateraccessdata[wateraccessdata$Code %in% c('USA', "NOR", "PAK", "NGA", "NIC", "MNE", "RUS", "COL", "KOR", "PHL", "PSE", "MEX", "CAN", "FRA", "DEU", "JPN", "HUN", "ECU", "NZL", "ETH"), ] %>% 
    filter(Year == "2020") %>% 
    group_by(Code) %>% 
    summarise(Safely_Managed_Water = sum(wat_sm)) %>% 
    return(Safely_Managed_Water)
}

x_values <- c("NZL", "DEU", "KOR", "FRA", "CAN", "JPN", "NOR", "USA", "HUN", "MNE", "PSE", "RUS", "COL", "ECU", "NIC", "PHL", "MEX", "PAK", "NGA", "ETH")

plot_water_access_by_country <- function() {
  bar_chart <- ggplot(water_access_by_country(Code), aes(x = Code, y = Safely_Managed_Water)) +
    geom_bar(stat = "identity", fill = "lightblue", color = "black") +
    scale_x_discrete(limits = x_values) +
    labs(x = "Country Code", y = "Percentage of Safely Managed Water (2020)", title = "Safely Managed Water Access by Country") +
    theme(panel.background = element_rect(fill = "gray"), panel.grid.major = element_line(color = "white"))
  return(bar_chart)
}

plot_water_access_by_country()

server <- function(input, output) {
  data_by_year <- reactive({
    wateraccessdata[wateraccessdata$Code %in% c('USA', "NOR", "PAK", "NGA", "NIC", "MNE", "RUS", "COL", "KOR", "PHL", "PSE", "MEX", "CAN", "FRA", "DEU", "JPN", "HUN", "ECU", "NZL", "ETH"), ] %>%
      group_by(Code) %>%
      filter(as.numeric(Year) == as.numeric(input$Year)) %>%
      summarise(Safely_Managed_Water = sum(wat_sm)) %>%
      return(Safely_Managed_Water)
  })
  output$plot_water_access_by_country <- renderPlot({
    bar_chart <- ggplot(data_by_year(), aes(x = Code, y = Safely_Managed_Water)) +
      geom_bar(stat = "identity", fill = "lightblue", color = "black") +
      scale_x_discrete(limits = x_values) +
      labs(x = "Country Code", y = "Percentage of Safely Managed Water", title = "Safely Managed Water Access by Country") +
      theme(panel.background = element_rect(fill = "gray"), panel.grid.major = element_line(color = "white"))
    return(bar_chart)
  })
  output$plot_water_deaths <- renderPlot({
    df2 <- death_data %>%
      filter(Entity %in% c(input$country_input,input$country_input2)) %>%
      filter(as.numeric(Year) > 1999) %>%
      select(1,3,4)

    chart3_page <- ggplot(df2, aes(x=Year, y=Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., group=Entity)) +
      geom_line()+
      ylab("Deaths Rate)")+
      xlab("Year")+
      ggtitle("Death Rate from Water Quality")
    return(chart3_page)

  })
  output$plot_death_rates <- renderPlot({
    us <- death_data %>%
      filter(Entity == "United States") %>%
      select (1,4)
    
    cd <- death_data %>%
      filter(Entity == input$chart2_country_input) %>%
      select (1,4)
    
    chart2_page <- boxplot(us$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,
            cd$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., 
            ylab = "Death (Rate)",
            main = "Death Rate from Water Quality Between Countries",
            names=c("US", input$country_input))

    return(chart2_page)
    
  })}