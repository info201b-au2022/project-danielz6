#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(rsconnect)
source("tabs/tab_panel_intro.R")
source("tabs/tab_panel_chart1.R")
source("tabs/tab_panel_chart2.R")
source("tabs/tab_panel_chart3.R")
source("tabs/tab_panel_summary.R")
source("tabs/tab_panel_report.R")

# ui <- navbarPage(
#   title = "Project Example",
#   position = "fixed-top",

  # # A simple header
  # header = list(
  #   tags$style(type = "text/css", "body {padding-top: 70px;}"),
  #   hr(),
  #   HTML("... Project Header... "),
  #   hr()
  # ),
  # 
  # # A simple footer
  # footer = list(
  #   tags$style(type = "text/css", "body {padding-top: 70px;}"),
  #   hr(),
  #   HTML("... Project Footer ... "),
  #   hr()
  # ),

  #Introductory Page 
  page1_main_content <- mainPanel(
    titlePanel("Deviations and Inequalities in Global Water Quality"),
    
    h5("Anumita Basani (Anumitab@uw.edu), Diya Kumaran (Diyak2@uw.edu), Eddy Wong (Eddyw206@hotmail.com), Daniel Zhang (Danielz6@uw.edu)"),
    
    img(src = "https://www.ifpri.org/sites/default/files/styles/large/public/Blog/global-water-quality_1.jpg?itok=iHbwD3Um", height = 400, width = 600),
    
    h1("Introduction"), 
    p("Our topic surrounds the issue of water quality in the United States and global. Drinking water quality varies in each place, depending on the condition of the water source it comes from and the treatment it receives before becoming available to the public. In the U.S., there are set standards such as the Safe Drinking Water Act, and Environmental Protection Agency (EPA) regulations that control the water quality and assure that it is safe to consume. The SDWA includes guidelines for drinking water quality, water testing schedules, and water testing methods. Many states enforce their own drinking water standards that aim to protect similar to the EPA's national standard."),
    
    h3("Problem Domain:"),
    p("Our project examines the US' water quality and systems in seeing what factors and aspects contribute to the water systems and sanitation and how that functions throughout the country. The data we look at spans various areas and the quality of water, that we can utilize to further examine what affects water sanitation in a certain region. Comparing the US to other countries allows us to examine what contributes to water sanitation and what policies and factors are in place in countries with great water health compared to lower quality water.
      The U.S.'s water quality is among the safest in the world, however, there are many possible sources of contamination, that can lead to health issues, including gastrointestinal illness, reproductive problems, and neurological disorders. Young children, pregnant women, and people with weaker immune systems are at risk for illness."),
    p("Human Values:"),
    p("Public health and safety are essential to society and for human survival, aiming to improve our quality of life, helps children succeed, and reduces human suffering. Water sanitation is an issue that falls into the category of public health with a focus on community-wide prevention and protection. Clean water and accessibility to clean water are essential to human life, that is important to preserve and promote to the best of our society's ability."),
    p("Stakeholders:"),
    p("Everyone is a stakeholder when it comes to a public health concern, especially drinking water. Since water is a necessity for survival, direct stakeholders to this issue include the general public, especially people living in regions that do not have efficient water systems and in areas that have a lower quality of water due to various factors. Indirect stakeholders to this issue are future generations that are reliant on high water quality to support their health and well-being."),
    p("Harms and Benefits:"),
    p("Possible benefits to high-quality water being available for everyone are that individual health is always kept as a priority and that populations across the globe are healthy and are able to maintain healthy lifestyles that keep the rest of society functioning. Moreover, some harms that may come from constructing better water systems and water quality are that it is expensive and may negatively impact the economy, as well as it different areas it may interfere with other environmental factors such as land or wildlife."),
    h3("Research Questions"),
    p("What is the United States water access ranking compared to other countries? 
      This is important because if we are able to understand the reasons for this then we can work towards changing that so we can drastically improve the water quality throughout the country. The motivation for the question is that the presence of contaminants in cities around the U.S. has led to severe health issues for the people living there so determining the leading factors is essential.
 
      How does the US water ranking compare to Canadas? 

      The reason that this is important as through comparing the US to another country that is close in geographic location and similar in socioeconomical structures, we are able to analyze the water health and further identify what is contributing to each country’s ranking and potentially create solutions to prevent those identified factors from influencing poor water quality.

      What is the overall trend in deaths from poor water quality over the years?

      This is important to explore because it examines a major impact of poorer water quality and sanitation systems, and emphasizes the need for reformed water quality standards, or other solutions that minimize the high counts of death from this issue. The motivation for this is to understand the depth of this problem both locally and globally.
"),
    
    img(src = "https://thehill.com/wp-content/uploads/sites/2/2021/04/ca_water_pollution_environment.jpg?w=1280&h=720&crop=1", height = 400, width = 600),
    p("Caption")
  )
#Intro tab label appears  
page1_sidebar_content <- sidebarPanel(
)
page1_panel <- tabPanel(
  "Introduction", 
  page1_main_content
  )
  
  # The three charts
  # tab_panel_chart1,
  # tab_panel_chart2,
  # tab_panel_chart3,

tab_panel_chart1 <- sidebarPanel(
)
  chart_tab_1 <- mainPanel(
    h4("Chart 1"),
    p("This bar chart analyzes the percentage of countries' population that has safely managed water access."),
    selectInput("Year", "Select year:", choices = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"), selected = "2020"),
    plotOutput("plot_water_access_by_country")
  )
  chart_panel_1 <- tabPanel(
    "Safely Managed Water Access Bar Chart", titlePanel("Chart"),
    chart_tab_1
  )
  

# The project summary
page2_sidebar_content <- sidebarPanel(
)
  page_2__main_content <- mainPanel(
    h4("3 Takeaways"),
    p("The US stands higher compared to most countries; however it is not the highest globally, and it is important to know that factors such geographic location, proximity to massive water bodies, and the infrastructure system and set up of a particular region all contribute to ranking of a country in this context."),
    p("Though progress has been made to provide safe drinking water and sanitation to people throughout the world, billions of people still lack access to these services every day.” Many countries face challenges in providing strong sanitation practices and infrastructures for their populations. Improved water supply and sanitation, and better management of water resources, can boost countries' economic growth and can contribute greatly to poverty reduction
"),
    p("Water sanitation is an issue that falls into the category of public health with a focus on community-wide protection. It influences our health at an individual level, community level, and societal level, and is a huge determinant of population health and we should advocate for more stable and stronger policies, standards, and systems that improve the quality of water globally.")
  )  
  page2_panel <- tabPanel(
    "Key Takeaways", titlePanel("Summary of Research"),
    page_2__main_content
    )
#Intro and Summary displays on app  
  ui <- navbarPage(
    "",
    page1_panel,
    chart_panel_1,
    page2_panel

 )
  

#   # The project report
#   tab_panel_report
# )
# deployApp()
  
  
  
