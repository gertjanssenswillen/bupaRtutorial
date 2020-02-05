

library(purrr)
library(dplyr)

list.files("data-raw") %>% str_subset("prep", negate = T) -> files

library(stringr)

for (file in files) {
    name <- str_remove(str_remove(file, "tutorial_"), ".RDS")
    data <- readRDS(paste0("data-raw/", file))
    assign(name, data)

}
usethis::use_data(bpi2014, overwrite = T, compress = "xz")
usethis::use_data(claims, overwrite = T, compress = "xz")
usethis::use_data(eating_patterns, overwrite = T, compress = "xz")
usethis::use_data(emergency, overwrite = T, compress = "xz")
usethis::use_data(human_resources, overwrite = T, compress = "xz")
usethis::use_data(order_to_cash, overwrite = T, compress = "xz")
usethis::use_data(phone_repair, overwrite = T, compress = "xz")
usethis::use_data(daily_living, overwrite = T, compress = "xz")
