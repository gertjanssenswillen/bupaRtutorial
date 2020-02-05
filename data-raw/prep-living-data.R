
read_csv("G://My Drive/My UH/Datasets/eventdata/dailyliving/data/activitylog_uci_detailed_labour.csv") %>%
    mutate(type = "labour") -> labour
read_csv("G://My Drive/My UH/Datasets/eventdata/dailyliving/data/activitylog_uci_detailed_weekends.csv") %>%
    mutate(type = "weekend") -> weekend

bind_rows(labour, weekend) %>%
    janitor::clean_names() %>%
    select(-concept_name,-variant:-case_creator, -lifecycle_transition) %>%
    bupaR::convert_timestamps(columns = c("start_timestamp", "complete_timestamp")) %>%
    mutate(resource = NA) %>%
    bupaR::activities_to_eventlog("case_id","activity", "resource", timestamps = c("start_timestamp","complete_timestamp")) %>%
    mutate(lifecycle_id = stringr::str_remove_all(lifecycle_id, "_timestamp")) %>%
    filter_activity(c("Start","End"), reverse = T) %>%
    saveRDS("data-raw/tutorial_daily_living.RDS")
