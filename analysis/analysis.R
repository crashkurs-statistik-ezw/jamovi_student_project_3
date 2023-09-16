library(tidyverse)

# Gereinigter Datensatz laden ---------------------------------------------
data <- read_csv("data/clean/motivation_cleaned_r.csv") 



# Deskriptive Statistik ---------------------------------------------------
jmv::descriptives(
  formula = final_test ~ practice_type,
  data = data,
  median = FALSE,
  min = FALSE,
  max = FALSE)



# Histogram ---------------------------------------------------------------
jmv::descriptives(
  formula = final_test ~ practice_type,
  data = data,
  hist = TRUE,
  n = FALSE,
  missing = FALSE,
  mean = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)

ggplot(data, aes(x = final_test)) +
  geom_histogram(binwidth = 5, fill = "gray", color = "black") +
  labs(title = "Histogramm der final_test Variable (Binwidth = 5)",
       x = "Final Test Score",
       y = "Anzahl") +
  facet_wrap(~ practice_type) +  # Facettierung nach practice_type
  theme_minimal()



# Balkendiagram -----------------------------------------------------------
jmv::descriptives(
  data = data,
  vars = practice_type,
  bar = TRUE,
  n = FALSE,
  missing = FALSE,
  mean = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)

ggplot(data, aes(x = as.factor(practice_type))) +
  geom_bar(fill = "gray", color = "black") +
  labs(title = "Balkendiagramm für practice_type",
       x = "Practice Type Corrected",
       y = "Häufigkeit") +
  theme_minimal()

ggplot(data, aes(x = as.factor(practice_type), y = final_test)) +
  geom_bar(stat = "summary", fun = "mean", fill = "gray", color = "black") +
  labs(title = "Balkendiagramm für practice_type (Mittelwert von final_test)",
       x = "Practice Type Corrected",
       y = "Mittelwert von final_test") +
  theme_minimal()


# Boxplot -----------------------------------------------------------------
jmv::descriptives(
  formula = final_test ~ practice_type,
  data = data,
  box = TRUE,
  n = FALSE,
  missing = FALSE,
  mean = FALSE,
  median = FALSE,
  sd = FALSE,
  min = FALSE,
  max = FALSE)

ggplot(data, aes(x = as.factor(practice_type), y = final_test)) +
  geom_boxplot(fill = "gray", color = "black") +
  labs(title = "Boxplot von final_test nach practice_type",
       x = "Practice Type Corrected",
       y = "Final Test Score") +
  theme_minimal()

