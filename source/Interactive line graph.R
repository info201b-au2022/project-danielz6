# This chart compares the trend in deaths from unsafe drinking water in the United States and Australia, 
# starting from the year 200. In viewing the trend in data, we are able to see the change in deaths 
# for each country, and we can observe that the United States has seen a large decline in the death rate
# from 2000-2020, whereas Australia has seen a steep increase. Comparatively, these two countries 
# have a similar economic standing and similar infrastructure in the way that water systems and sanitation is 
#implemented. This leads to us knowing that there are other factors that are an influence to access
# to safe water, even with countries that would be categorized as similar.

library(tidyverse)
file <- "/Users/danielzhang/Documents/info201/Projects/Untitled/project-danielz6/data/data/death-rates-unsafe-water.csv"
death_data <- read.csv(file)
View(death_data)

country_names <- c(unique(death_data$Entity))



df2 <- death_data %>%
  filter(Entity == Input$country1 | Entity == Input$country2) %>%
filter(as.numeric(Year) > 1999) %>%
  select(3,4)

df3 <- death_data %>%
  filter(Entity == Input$country1) %>%
filter(as.numeric(Year) > 1999) %>%
  select(3,4)


View(df2)
usa <- death_data %>%
  filter(Entity == "United States") %>%
  filter(as.numeric(Year) > 1999) %>%
  select (3,4)

#View(usa)

aus <- death_data %>%
  filter(Entity == "Australia")  %>%
  filter(as.numeric(Year) > 1999) %>%
  select (3,4)

#view(aus)
plot <-function() {
  
  ggplot(df2, aes(x = after_stat(year), y = Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.)) +
         geom_point(size = 0.8, alpha = 0.09) +
         geom_smooth(size = 2) +
         theme_minimal() + labs(title = "Jail Population Distribution in the U.S. By State (1970-2018)", x = "Year", y = "Total Jail Population") +
         labs(caption = "This plot shows the differences between the total jail population in each state.")
}
plot()

plot(usa$Year, usa$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,type = "o",col = "red", xlab = "Years", ylab = "Death Rate", 
     main = "Death Rate Trends [2000 - 2019]",
     ylim=c(0.02,0.15))

lines(aus$Year, aus$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., type = "o", col = "blue")

#legend(x=topright,y=0.92, legend=c("Equation 1", "Equation 2"), fill = c("blue","red"))
legend( x= "topleft", y=0.92,
        legend=c("Australia","United States"),
        col=c("blue", "red"),
        pch=c("-","-", "-", "-"))
