library(dplyr)
library(data.table)
dplyr::starwars
data("starwars",package = "dplyr")
 starwars_dt=as.data.table(starwars)
 starwars_dt[
  +     species=="Human", 
  +     mean(height, na.rm=T), 
  +     by = gender]
 starwars_dt[height>190 & species=='Human']
 setorder(starwars_dt, birth_year, na.last = TRUE)
 starwars_dt[1:5, name:birth_year]
 starwars_dt[1:2, c(1:3, 10)]
 starwars_dt[1:2, .(name, height, mass, homeworld)]
 starwars_dt[, !c("name", "height")]
 starwars_dt[1:2, .(alias = name, crib = homeworld)]
 starwars_dt[, mean(height, na.rm=T)]
 starwars_dt[, mean_height := mean(height, na.rm=T)] %>%
   +     .[1:5, .(name, height, mean_height)]
 starwars_dt[, .N]
 starwars_dt[, .(mean_height = mean(height, na.rm=T)), by = .(species, homeworld)] %>%
   +     head(4)
 starwars_dt[, 
             +             .(mean(height, na.rm=T), mean(mass, na.rm=T), mean(birth_year, na.rm=T)), 
             +             by = species]
 starwars_dt[, 
             +             lapply(.SD, mean, na.rm=T),
             +             .SDcols = c("height", "mass", "birth_year"),
             +             by = species] %>% 
   +     head(2)
 