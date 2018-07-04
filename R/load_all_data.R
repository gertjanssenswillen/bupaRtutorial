


#' Load all event log data for tutorial
#' @importFrom utils data
#' @export
#'
load_all_data <- function() {
    data("bpi2014")
    data("claims")
    data("eating_patterns")
    data("emergency")
    data("human_resources")
    data("order_to_cash")
    data("phone_repair")
    eventdataR::hospital
    eventdataR::hospital_billing
    eventdataR::patients
    eventdataR::sepsis
    eventdataR::traffic_fines
    message("Data loaded into workspace")
    return()
}
