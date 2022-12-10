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

  #Introductory Page 
  page1_main_content <- mainPanel(
    titlePanel("Deviations and Inequalities in Global Water Quality"),
    
    h5("Diya Kumaran, Eddy Wong, Daniel Zhang, Anumita Basani"),
    
    img(src = "https://www.ifpri.org/sites/default/files/styles/large/public/Blog/global-water-quality_1.jpg?itok=iHbwD3Um", height = 400, width = 600),
    
    h1("Introduction"), 
    p("Our topic surrounds the issue of water quality in the United States and globally, using data primarily from WHO/UNICEF Joint Monitoring Programme (JMP) for Water Supply and Sanitation and the University of Oxford research website titled 'Our World In Data.' Drinking water quality varies in each place, depending on the condition of the water source it comes from and the treatment it receives before becoming available to the public. In the U.S., there are set standards such as the Safe Drinking Water Act, and Environmental Protection Agency (EPA) regulations that control the water quality and assure that it is safe to consume. The SDWA includes guidelines for drinking water quality, water testing schedules, and water testing methods. Many states enforce their own drinking water standards that aim to protect similar to the EPA's national standard."),
    
    h2("Problem Domain:"),
    
    p("Our project examines the US' water quality and systems, as well as other countries, in seeing what factors and aspects contribute to the water systems and sanitation and how that functions throughout the country. The data we look at spans various areas and the quality of water, that we can utilize to further examine what affects water sanitation in a certain region. Comparing the US to other countries allows us to examine what contributes to water sanitation and what policies and factors are in place in countries with great water health compared to lower quality water.
      The U.S.'s water quality is among the safest in the world, however, there are many possible sources of contamination, that can lead to health issues, including gastrointestinal illness, reproductive problems, and neurological disorders. Young children, pregnant women, and people with weaker immune systems are at risk for illness."),
    p("Human Values:"),
    
    p("Public health and safety are essential to society and for human survival, aiming to improve our quality of life, helps children succeed, and reduces human suffering. Water sanitation is an issue that falls into the category of public health with a focus on community-wide prevention and protection. Clean water and accessibility to clean water are essential to human life, that is important to preserve and promote to the best of our society's ability."),
    p("Stakeholders:"),
    
    p("Everyone is a stakeholder when it comes to a public health concern, especially drinking water. Since water is a necessity for survival, direct stakeholders to this issue include the general public, especially people living in regions that do not have efficient water systems and in areas that have a lower quality of water due to various factors. Indirect stakeholders to this issue are future generations that are reliant on high water quality to support their health and well-being."),
   
     p("Harms and Benefits:"),
    
    p("Possible benefits to high-quality water being available for everyone are that individual health is always kept as a priority and that populations across the globe are healthy and are able to maintain healthy lifestyles that keep the rest of society functioning. Moreover, some harms that may come from constructing better water systems and water quality are that it is expensive and may negatively impact the economy, as well as it different areas it may interfere with other environmental factors such as land or wildlife."),
    
    h2("Research Questions"),
    
    p("What is the United States water access ranking compared to other countries?"), 
    
    
    p("How does the death rate from unsafe drinking water compare between the US and Canada?"),
      
    
    p("What are the overall trends in death rate from poor water quality between various countries globally?")

  )
#Intro tab label appears  
page1_sidebar_content <- sidebarPanel(
)
page1_panel <- tabPanel(
  "Introduction", 
  page1_main_content
  )

#Chart 1 below
tab_panel_chart1 <- sidebarPanel(
)
  chart_tab_1 <- mainPanel(
    selectInput("Year", "Select Year:", choices = c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020"), selected = "2020"),
    plotOutput("plot_water_access_by_country"),
    p("This bar chart analyzes the percentage of countries' population that has safely managed water access.")
  )
  chart_panel_1 <- tabPanel(
    "Global Safely Managed Water Access", titlePanel("Safely Managed Water Access Percentage by Country"),
    chart_tab_1
  )
  

# The project summary panel 
page2_sidebar_content <- sidebarPanel(
)
  page_2__main_content <- mainPanel(
    h1("Major Takeaways"),
    
    img(src = "https://thehill.com/wp-content/uploads/sites/2/2021/04/ca_water_pollution_environment.jpg?w=1280&h=720&crop=1", height = 400, width = 600),
    
    h2("1"),
    
    p("The US stands higher compared to most countries; however it is not the highest globally, and it is important to know that factors such geographic location, proximity to massive water bodies, and the infrastructure system and set up of a particular region all contribute to ranking of a country in this context."),
    
    h2("2"),
    
    p("Though progress has been made to provide safe drinking water and sanitation to people throughout the world, billions of people still lack access to these services every day.” Many countries face challenges in providing strong sanitation practices and infrastructures for their populations. Improved water supply and sanitation, and better management of water resources, can boost countries' economic growth and can contribute greatly to poverty reduction
"),
    h2("3"), 
    
    p("Water sanitation is an issue that falls into the category of public health with a focus on community-wide protection. It influences our health at an individual level, community level, and societal level, and is a huge determinant of population health and we should advocate for more stable and stronger policies, standards, and systems that improve the quality of water globally.")
  )  
  page2_panel <- tabPanel(
    "Key Takeaways", titlePanel("Summary of Research"),
    page_2__main_content
    )
#Panels display on app  
  ui <- navbarPage(
    "",
    page1_panel,
    chart_panel_1,
    tab_panel_chart2,
    tab_panel_chart3, 
    page2_panel

 )