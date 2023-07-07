#Simulate rent data for 5000 households in each of the three US West coast states.

library(dplyr)

#simulate skeyewd data
or_distribution <- rbeta(5000, 2, 5)
ca_distribution <- rbeta(5000, 3, 5)
wa_distribution <- rbeta(5000, 2.5, 5)

#these medians are from worldpopulationreview.com (May 2022 data)
or_med <- 1173
ca_med <- 1586
wa_med <- 1337

#scale the simulated data to match the state medians
oregon <- or_distribution * (or_med / median(or_distribution))
california <- ca_distribution * (ca_med / median(ca_distribution))
washington <- wa_distribution * (wa_med / median(wa_distribution))

#create a dataframe
rent_data <- data.frame(state = c(rep("OR", length(oregon)), rep("CA", length(california)), rep("WA", length(washington))),
                        rent = c(oregon, california, washington)) %>% 
                  mutate(rent = round(rent, 0))

#save as RDS
saveRDS(rent_data, "US_west_rent.rds")

