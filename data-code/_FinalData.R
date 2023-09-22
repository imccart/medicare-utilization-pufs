# Meta --------------------------------------------------------------------

## Author:        Ian McCarthy
## Date Created:  9/24/2022
## Date Edited:   9/23/2022


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate)


# Import data -------------------------------------------------------------

step <- 0
for (i in 2012:2012) {
  step <- step+1
  medicare.puf <- read_delim(paste0("data/input/utilization-payment-puf/",i,"/Medicare_Provider_Util_Payment_PUF_CY",i,".txt")) %>%
    mutate(year=i) %>%
    rename_with(tolower)
  
  if (step==1) {
    final.puf <- medicare.puf
  } else {
    final.puf <- bind_rows(final.puf, medicare.puf)
  }
}
  
# Clean data --------------------------------------------------------------


# Save final data ---------------------------------------------------------


write_tsv(final.data,'data/output/Physician_Utilization_Data.txt')