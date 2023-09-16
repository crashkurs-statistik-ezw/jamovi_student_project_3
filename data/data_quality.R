library(assertr)
library(tidyverse)

# Gereinigter Datensatz laden ---------------------------------------------
dframe <- read_csv("data/clean/motivation_cleaned_r.csv") 


# Daten einsehen ----------------------------------------------------------
glimpse(dframe)
view(dframe)


# Data Quality Checks ausführen -------------------------------------------
dframe |> 
  verify(has_only_names("id", "practice_type",
                        "interest_foreign_lang", "interest_swedish",
                        "number_languages", "time_free_choice",
                        "retrieval_cycle1", "retrieval_cycle2", 
                        "final_test")) |> 
  assert(within_bounds(1, 5), interest_foreign_lang) |>
  assert(within_bounds(1, 5), interest_swedish) |>
  assert(in_set("retrieval", "restudy"), practice_type) |> 
  assert(within_bounds(0, 100), retrieval_cycle1, retrieval_cycle2, final_test) |>
  verify(number_languages > 0) |> 
  verify(time_free_choice >= 0)
 