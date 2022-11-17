# The global access to drinking water are visualized in this data table. There are different levels of standards for their 
# facilities; Safely Managed, Basic, Limited, Unimproved, and No access (Surface Water Only).
# Shown in the columns are the percentage of the globe's data on their access to a drinking water facility. 
# Starting from 2020 back to 2000, data is presented in five-year intervals. This data table is important in visualizing the 
# improvement of global access to drinking water facilities over the past ~two decades.

library(dplyr)
library(tidyverse)
data <- "C:/Users/eddyw/Documents/Info 201/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

avg_for_all_2020 <- wateraccessdata %>% 
  drop_na() %>% 
  filter(Year == 2020) %>%
  group_by(Code) %>%
  summarise(avg_sm = mean(wat_sm), avg_bas = mean(wat_bas_minus_sm), avg_lim = mean(wat_lim), avg_unimp = mean(wat_unimp), avg_no_access = mean(wat_sur))

data_table <- table(avg_for_all_2020$Code)
