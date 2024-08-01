# Installing and Loading Dplyr 

install.packages("dplyr")
library(dplyr)

#Data frame
df <- data.frame(
  id = 1:5,
  name = c("Alice", "Bob", "Charlie", "Dylon", "Ethan"),
  age = c( 23,35,45,29, 34),
  score = c(85,92, 88, 90, 91)
)

print(df)

#Selecting Colums
df_selected <- select(df,name, score)
print(df_selected)