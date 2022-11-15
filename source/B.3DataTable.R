# The global access to drinking water are visualized in this data table. There are different levels of standards for their 
# facilities; Safely Managed, Basic, Limited, Unimproved, and No access (Surface Water Only).
# Shown in the columns are the percentage of the globe's data on their access to a drinking water facility. 
# Starting from 2020 back to 2000, data is presented in five-year intervals. This data table is important in visualizing the 
# improvement of global access to drinking water facilities over the past ~two decades.

library(dplyr)
library(tidyverse)
data <- "C:/Users/eddyw/Documents/Info 201/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

lowest_sm_facilities <- wateraccessdata %>%
  group_by(Entity) %>%
  filter(Year == max(Year)) %>%
  filter(wat_sm == min(wat_sm)) %>%
  pull(Entity, wat_sm)

round(prop.table(table(wateraccessdata$wat_sm)), 2)
