# This chart compares the trend in deaths from unsafe drinking water in the United States and Australia, 
# starting from the year 200. In viewing the trend in data, we are able to see the change in deaths 
# for each country, and we can observe that the United States has seen a large decline in the death rate
# from 2000-2020, whereas Australia has seen a steep increase. Comparatively, these two countries 
# have a similar economic standing and similar infrastructure in the way that water systems and sanitation is 
#implemented. This leads to us knowing that there are other factors that are an influence to access
# to safe water, even with countries that would be categorized as similar.

file <- "C:/Users/diyak/OneDrive/Documents/info201/assignments/project-danielz6/data/death-rates-unsafe-water.csv"
death_data <- read.csv(file)

filter(Entity == "United States") %>%
  filter(as.numeric(Year) > 1999) %>%
  select (3,4)

view(usa)

aus <- death_data %>%
  filter(Entity == "Australia")  %>%
  filter(as.numeric(Year) > 1999) %>%
  select (3,4)

view(aus)

plot(usa$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate.,type = "o",col = "red", xlab = "Years", ylab = "Death Rate", 
     main = "Death Rate Trends [2000 - 2019]",
     ylim=c(0.02,0.15))

lines(aus$Deaths...Cause..All.causes...Risk..Unsafe.water.source...Sex..Both...Age..Age.standardized..Rate., type = "o", col = "blue")

#legend(x=topright,y=0.92, legend=c("Equation 1", "Equation 2"), fill = c("blue","red"))
legend( x= "topleft", y=0.92,
        legend=c("Australia","United States"),
        col=c("blue", "red"),
        pch=c("-","-", "-", "-"))
