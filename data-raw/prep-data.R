

library(purrr)
library(dplyr)

list.files("data-raw") -> files

library(stringr)

for (file in files) {
    name <- str_remove(str_remove(file, "tutorial_"), ".RDS")
    data <- readRDS(paste0("data-raw/", file))
    assign(name, data)

}
devtools::use_data(bpi2014, overwrite = T, compress = "xz")
devtools::use_data(claims, overwrite = T, compress = "xz")
devtools::use_data(eating_patterns, overwrite = T, compress = "xz")
devtools::use_data(emergency, overwrite = T, compress = "xz")
devtools::use_data(human_resources, overwrite = T, compress = "xz")
devtools::use_data(order_to_cash, overwrite = T, compress = "xz")
devtools::use_data(phone_repair, overwrite = T, compress = "xz")
