
read_csv("G://My Drive/My UH/Rworkspace/eventdata/dailyliving/data/activitylog_uci_detailed_labour.csv") %>%
    mutate(type = "labour") -> labour
read_csv("G://My Drive/My UH/Rworkspace/eventdata/dailyliving/data/activitylog_uci_detailed_weekends.csv") %>%
    mutate(type = "weekend") -> weekend

bind_rows(labour, weekend) %>%
    janitor::clean_names() %>%
    select(-concept_name,-variant:-case_creator, -lifecycle_transition) %>%
    bupaR::convert_timestamps(columns = c("start_timestamp", "complete_timestamp"), format = ymd_hms) %>%
    mutate(resource = NA) %>%
    rename(start = start_timestamp, complete = complete_timestamp) %>%
    bupaR::activitylog("case_id","activity", "resource", timestamps = c("start","complete")) %>%
    filter_activity(c("Start","End"), reverse = T) %>%
    to_eventlog() %>%
    saveRDS("data-raw/tutorial_daily_living.RDS")
