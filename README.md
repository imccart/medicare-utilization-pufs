# Medicare Provider Utilization and Payment Data, Public Use Files
This repository provides the necessary code and links to download and organize the publicly available data on hospital and physician services. CMS provides several different datasets with information on utilization and payments. For example, data are available on post-acute care providers, inpatient hospitals, physicians, and Part D prescribers. Data are also available at different levels of granularity, with some data at the provider level, some at the level of geography and service, and some at the level of provider and service. 

For more information on these datasets, see the CMS link [here](https://data.cms.gov/provider-summary-by-type-of-service). Unless otherwise noted, this repository works with the most granular version of the data available. In the case of physician services, this means I'm working with the data by provider and service. 

## Physicians & Other Practitioners
The raw data for utilization and payments to physicians, by service area, are available [here](https://data.cms.gov/provider-summary-by-type-of-service/medicare-physician-other-practitioners/medicare-physician-other-practitioners-by-geography-and-service). For now, this repository works with these data from 2012 through 2020.

The raw data are organized by year in the 'data/input' folder, with a subset of variables extracted and saved in the 'data/output' directory. Note that since these data include counts of services by physician NPI for every HCPCS code, the data are very large with over 10 million observations in a given year. It may be useful to limit the data in each year to a subset of HCPCS codes.
