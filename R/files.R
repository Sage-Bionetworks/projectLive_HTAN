create_files_rds <- function(){
  syn <- create_synapse_login()
  files <-
    projectlive.modules::get_synapse_tbl(
      syn,
      "syn20446927",
      columns = c(
        "id",
        "name",
        "type",
        "benefactorId",
        "allowedTeam",
        "fileFormat",
        "Component",
        "createdOn"
      )
    ) %>%
    projectlive.modules::format_date_columns() %>%
    dplyr::mutate(
      "allowedTeam" = as.character(allowedTeam),
      "fileFormat" = as.character(fileFormat)
    ) %>% 
    dplyr::select(-c("createdOn", "ROW_ID", "ROW_VERSION", "ROW_ETAG"))
  
  saveRDS(files, "files.RDS")
  store_file_in_synapse(
    "files.RDS",
    "syn25783061"
  )
}



  
  