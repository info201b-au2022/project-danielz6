#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rsconnect)
source("tabs/tab_panel_intro.R")
source("tabs/tab_panel_chart1.R")
source("tabs/tab_panel_chart2.R")
source("tabs/tab_panel_chart3.R")
source("tabs/tab_panel_summary.R")
source("tabs/tab_panel_report.R")

ui <- navbarPage(
  title = "Project Example",
  position = "fixed-top",

  # A simple header
  header = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("... Project Header... "),
    hr()
  ),

  # A simple footer
  footer = list(
    tags$style(type = "text/css", "body {padding-top: 70px;}"),
    hr(),
    HTML("... Project Footer ... "),
    hr()
  ),

  # The project introduction
  tab_panel_intro,
  library(shiny)
  #Introductory Page 
  ui <- fluidPage(
    titlePanel("Deviations and Inequalities in Global Water Quality"),
    
    mainPanel("Global Water Quality Analysis: Introduction"),
    h5("Anumita Basani (Anumitab@uw.edu), Diya Kumaran (Diyak2@uw.edu), 
                 Eddy Wong (Eddyw206@hotmail.com), Daniel Zhang (Danielz6@uw.edu)"),
    
    img(src = "rstudio.png", height = 140, width = 400),
    
    h1("Introduction"), 
    p("Our topic surrounds the issue of water quality in the United States and global. Drinking water quality varies in each place, depending on the condition of the water source it comes from and the treatment it receives before becoming available to the public. In the U.S., there are set standards such as the Safe Drinking Water Act, and Environmental Protection Agency (EPA) regulations that control the water quality and assure that it is safe to consume. The SDWA includes guidelines for drinking water quality, water testing schedules, and water testing methods. Many states enforce their own drinking water standards that aim to protect similar to the EPA's national standard."),
    
    h3("Problem Domain:"),
    p("Our project examines the US' water quality and systems in seeing what factors and aspects contribute to the water systems and sanitation and how that functions throughout the country. The data we look at spans various areas and the quality of water, that we can utilize to further examine what affects water sanitation in a certain region. Comparing the US to other countries allows us to examine what contributes to water sanitation and what policies and factors are in place in countries with great water health compared to lower quality water.
      The U.S.'s water quality is among the safest in the world, however, there are many possible sources of contamination, that can lead to health issues, including gastrointestinal illness, reproductive problems, and neurological disorders. Young children, pregnant women, and people with weaker immune systems are at risk for illness.

      Human Values:
      
      Public health and safety are essential to society and for human survival, aiming to improve our quality of life, helps children succeed, and reduces human suffering. Water sanitation is an issue that falls into the category of public health with a focus on community-wide prevention and protection. Clean water and accessibility to clean water are essential to human life, that is important to preserve and promote to the best of our society's ability.

      Stakeholders:
      
      Everyone is a stakeholder when it comes to a public health concern, especially drinking water. Since water is a necessity for survival, direct stakeholders to this issue include the general public, especially people living in regions that do not have efficient water systems and in areas that have a lower quality of water due to various factors. Indirect stakeholders to this issue are future generations that are reliant on high water quality to support their health and well-being.

      Harms and Benefits: 

      Possible benefits to high-quality water being available for everyone are that individual health is always kept as a priority and that populations across the globe are healthy and are able to maintain healthy lifestyles that keep the rest of society functioning. Moreover, some harms that may come from constructing better water systems and water quality are that it is expensive and may negatively impact the economy, as well as it different areas it may interfere with other environmental factors such as land or wildlife."),
    
    h3("Research Questions"),
    p("What is the United States water access ranking compared to other countries? 
    
      This is important because if we are able to understand the reasons for this then we can work towards changing that so we can drastically improve the water quality. The motivation for the question is that the presence of contaminants in cities around the U.S. has led to severe health issues for the people living there so determining the leading factors is essential.
 
      How do socioeconomic factors influence water quality in the U.S. and other countries? *EDIT
      
      The reason that this is important is because the social and economic aspects of this major health problem have contributed heavily to it so now that we identified the issues, it's easier to prevent them from influencing water quality which is what motivates this inquiry. 

      Why should we prioritize water quality as a serious environmental issue on a local and global scale? *EDIT
      
      This is important to explore because there are numerous other issues to focus on and the motivation for this is to understand the depth of this problem both locally and globally.
"),
    
    img(src = "rstudio.png", height = 140, width = 400),
    p("Caption")
  ),

  # The three charts
  tab_panel_chart1,
  tab_panel_chart2,
  tab_panel_chart3,

  # The project summary
  tab_panel_summary,
  page_panel <- tabPanel(
    "Key Takwaways", titlePanel("Major Takeaways"), 
  ),
  page_3__main_content <- mainPanel(
    h4("3 Takeaways"),
    p("1"),
    p("2"),
    p("3")
  )

  # The project report
  tab_panel_report
)
deployApp()
