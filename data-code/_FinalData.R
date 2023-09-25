# Meta --------------------------------------------------------------------

## Author:        Ian McCarthy
## Date Created:  9/24/2022
## Date Edited:   9/22/2023


# Preliminaries -----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, ggplot2, dplyr, lubridate)


# Import data -------------------------------------------------------------

final.puf <- tibble()
for (i in 2012:2018) {
  medicare.puf <- read_delim(paste0("data/input/",i,"/Medicare_Provider_Util_Payment_PUF_CY",i,".txt")) %>%
    mutate(year=i) %>%
    rename_with(tolower) %>%
    select(npi, hcpcs_code, place_of_service, bene_unique_cnt, line_srvc_cnt,
            bene_day_srvc_cnt, starts_with("average"), starts_with("stdev"), year) %>%
    mutate(npi=as.numeric(npi))

  final.puf <- bind_rows(final.puf, medicare.puf)
}

for (i in 2019:2020) {
  medicare.puf <- read_csv(paste0("data/input/",i,"/Medicare_Physician_Other_Practitioners_by_Provider_and_Service_",i,".csv")) %>%
    mutate(year=i) %>%
    rename_with(tolower) %>%
    select(npi=rndrng_npi, hcpcs_code=hcpcs_cd, place_of_service=place_of_srvc, bene_unique_cnt=tot_benes, 
          line_srvc_cnt=tot_srvcs, bene_day_srvc_cnt=tot_bene_day_srvcs, 
          average_medicare_allowed_amt=avg_mdcr_alowd_amt,
          averge_submitted_chrg_amt=avg_sbmtd_chrg,
          average_medicare_payment_amt=avg_mdcr_pymt_amt,
          year)

  final.puf <- bind_rows(final.puf, medicare.puf)
}


# Save final data ---------------------------------------------------------

write_csv(final.puf,'data/output/physician-utilization-puf.csv')