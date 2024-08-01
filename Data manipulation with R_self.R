### Data Manipulation

#Install & Load Dplyr
install.packages("dplyr")
library(dplyr)

# create a dummy data frame
df <- data.frame(
  id = 1:5,
  name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  age = c(23, 35, 45, 29, 34),
  score = c(85, 92, 88, 90, 91)
)

print(df)

#Selecting Columns
df_selected <- select(df, name, score)
print(df_selected)

#Filtering Rows
df_filtered <- filter(df, age >30)
print(df_filtered)

# mutate () for adding or transforming column
df_mutated <- mutate(df, age_in_10_years = age + 30)
print(df_mutated)

#Arrangeing Rows Arrange ()
df_arranged <- arrange(df, desc(score))
print(df_arranged)

#Summarizing Data
df_summary <- summarize(df, avg_score = mean(score), avg_age = mean(age))
print(df_summary)

#Grouping and Summarizing
df_grouped_summary <- df %>%
  group_by(age) %>%
  summarize(avg_score = mean(score))

print(df_grouped_summary)

# Pipe operator 
df_combined <- df %>%
  select(name,score) %>%
  filter(score >85) %>%
  arrange(desc(score))

print(df_combined)

#JOIN data frame
# right_join(), inner_join(), full_join()

df1 <- data.frame(
  id = 1:3,
  name = c("Alice", "Bob", "charlie")
)

df2 <- data.frame(
  id = 1:3,
  score = (c(85,92,88))
)

#pivoting Data: pivot_longer(), pivot_wider()

library(tidyr)

df_wide <- data.frame(
  id = 1:3,
  time1 = c(10,15,20),
  time2 = c(25,30,35)
)
print(df_wide)

df_long <- df_wide %>%
  pivot_longer(cols = starts_with("time"), names_to = "time", values_to = "value")
  print(df_long)

#Handling Missing Values: na.omit(), replace_na()
  
df_with_na <- data.frame(
  id = 1:5,
  score = c(85, NA, 88, 90, NA)
)

df_no_na <- na.omit(df_with_na)

print(df_no_na)

df_replaced_na <- df_with_na %>%
  replace_na(list(score = 0))
print(df_replaced_na)

#Combining operation
df_clean <- df %>%
  filter(age > 25) %>%
  mutate(age_group = ifelse(age>40, "Older", "Younger")) %>%
  group_by(age_group) %>%
  summarize(avg_score = mean(score), count = n()) %>%
  arrange(desc(avg_score))

print(df_clean)
