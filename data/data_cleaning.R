library(tidyverse)
library(haven)
library(assertr)
library(janitor)

raw_data <- read_sav("data/raw/motivation_data.sav")

raw_data_cleaned <- raw_data |> 
  clean_names() |> 
  rename(
    id = subj_id,
    time_free_choice = time_free_choice_period,
    retrieval_cycle1 = retrieval_practice_cycle1,
    retrieval_cycle2 = retrieval_practice_cycle2
  ) |> 
  select(id, practice_type, interest_foreign_lang,
         interest_swedish,
         number_languages, time_free_choice,
         retrieval_cycle1, retrieval_cycle2, final_test) |>
  mutate(
    practice_type = as.character(practice_type)
  ) |> 
  mutate(
    practice_type = case_when(
      practice_type == 1 ~ "retrieval",
      practice_type == 2 ~ "restudy",
      TRUE ~ practice_type
    )
  ) |> 
  dplyr::filter(!is.na(number_languages))


write_csv(raw_data_cleaned, "data/clean/motivation_cleaned_r.csv")