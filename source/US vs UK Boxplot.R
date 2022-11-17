file <- "C:/Users/diyak/OneDrive/Documents/info201/assignments/project-danielz6/data/death-rates-unsafe-water.csv"

death_data <- read.csv(file)

uk <- death_data %>%
  filter(Entity == "United States") %>%
  select (1,4)

usa <- death_data %>%
  filter(Entity == "United Kingdom") %>%
  select (1,4)

boxplot(uk$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,
        usa$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., 
        ylim = range(0.01:2),
        ylab = "Death Range",
        names=c("US", "UK"))
        title(main = "Death Rates from Unsafe Water Sources")
        
# #This chart displays the comparison of death rates between the US, and the UK, that are both considered to be ranked 
# highly in terms of socioeconomical standing. This chart shows the range of death rates, which we can observe to be fairly 
 # low in these two countries.
# From that, we can see that countries that are considered wealthier, and are 
 #economically stronger appear to have lower death rate ranges. 
# By comparing two countries that have a similar death range and are at a 
  #similar global economic standing, we are able to conclude that 
  #countries having a higher socioeconomical standing tend to have better water systems and sanitation. 
#This is  resulting in a lower range of deaths from unsafe drinking water. 
