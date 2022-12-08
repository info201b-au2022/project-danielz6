# #This chart compares 5 different countries across the globe, and shows how they rank in terms of death count
# from unsafe drinking water sources. Each country has different economical systems and policies that 
# dictate the way water systems and sanitiation is executed and accessible. 
# From the chart we are able to see that countries such as Africa, have a high number of deaths
# in comparison to the US or UK, which is caused by multiple factors such as economical stability
# and infrastructure barriers that make it harder for water sanitation and systems to be implemented there. 

file <- "/Users/danielzhang/Documents/info201/Projects/Untitled/project-danielz6/data/death-rates-unsafe-water.csv"

death_data <- read.csv(file)
View(death_data)
total_deaths_by_country <- death_data %>%
  group_by(Entity) %>%
  summarise( Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate. = sum(Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.)) %>%
  #  filter(grepl('Afghanistan|Africa|United States|Unites Kingdom|Mexico', Entity, fixed = TRUE))  
  filter(Entity %in% c("Afghanistan","African Region (WHO)","United States","United Kingdom","Mexico"))

View(total_deaths_by_country)
barplot(total_deaths_by_country$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,
        names=c("Afghanistan","African Region (WHO)","United States","Unites Kingdom","Mexico"),
        las = 2,
        ylab = "Total Deaths By Country",
        main = "Cumulative sum of deaths by death betwen 1990 - 2019")
