# The global access to drinking water are visualized in this data table. There are different levels of standards for their 
# facilities; Safely Managed, Basic, Limited, Unimproved, and No access (Surface Water Only).
# Shown in the columns are the percentage of the globe's data on their access to a drinking water facility. 
# This data table is important in visualizing the most current year (2020) of
# the data set of global access to drinking water facilities.

library(dplyr)
library(tidyverse)
data <- "C:/Users/eddyw/Documents/Info 201/project-danielz6/data/access-drinking-water-stacked.csv"
wateraccessdata <- read.csv(data)

USA_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "USA") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

UGA_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "UGA") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

NZL_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "NZL") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

MEX_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "MEX") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

CAN_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "CAN") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

GBR_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "GBR") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

PRK_2020 <- wateraccessdata %>%
  drop_na() %>%
  group_by(Code) %>%
  filter(Code == "PRK") %>% 
  filter(Year == 2020) %>%
  summarise(Safely_Managed = sum(wat_sm), Basic = sum(wat_bas_minus_sm), Limited = sum(wat_lim), Unimproved = sum(wat_unimp), No_Access = sum(wat_sur))

data_table_2020 <- rbind(NZL_2020, GBR_2020, CAN_2020, USA_2020, PRK_2020, MEX_2020, UGA_2020)
colnames(data_table_2020)[1] <- "Country"
view(data_table_2020)
