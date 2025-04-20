# Load necessary libraries
library(DBI)
library(RPostgres)
library(dplyr)
library(ggplot2)


# Connect to PostgreSQL
con <- dbConnect(
  RPostgres::Postgres(),
  dbname = "emr_project",
  host = "localhost",
  port = 5432,
  user = "postgres",
  password = "rahuldb"
)

# Load the fct_readmissions table
df <- dbGetQuery(con, "SELECT * FROM fct_readmissions")

# Clean the data
df_clean <- df %>%
  filter(age > -200 & age < 120) %>%
  filter(!is.na(readmitted_flag) & !is.na(age) & !is.na(total_visits))

# Duplicate rows to simulate more data
df_clean <- df_clean[rep(1:10, each = 10), ]  # Now you'll have 100 rows

# Assign TRUE/FALSE for testing
df_clean$readmitted_flag <- rep(c(TRUE, FALSE), length.out = nrow(df_clean))

# Train logistic regression model
model <- glm(readmitted_flag ~ age + total_visits, data = df_clean, family = "binomial")
summary(model)


# Load ggplot2

df_clean$total_visits <- as.numeric(df_clean$total_visits)


# Plot 1: Readmissions by Age
ggplot(df_clean, aes(x = age, fill = factor(readmitted_flag))) +
  geom_histogram(bins = 20, position = "dodge") +
  labs(title = "Readmission Distribution by Age", fill = "Readmitted") +
  theme_minimal()

# Plot 2: Readmissions by Visit Count
ggplot(df_clean, aes(x = total_visits, fill = factor(readmitted_flag))) +
  geom_bar(position = "dodge") +
  labs(title = "Readmissions by Number of Visits", fill = "Readmitted") +
  theme_minimal()

write.csv(df_clean, "D:/Patient_EMR/fct_readmissions_output.csv", row.names = FALSE)

