file1 <- "C:/Users/diyak/Downloads/death-rates-unsafe-water.csv"
file2 <- "C:/Users/diyak/OneDrive/Documents/info201/assignments/project-danielz6/data/number-of-deaths-by-risk-factor.csv"

death_data <- read.csv(file1)

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

