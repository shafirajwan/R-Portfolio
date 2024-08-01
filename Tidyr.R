install.packages("dplyr")
library(dplyr)

#Install some data packages
installed.packages("nycflights13")
library(nycflights13)

head(flights)
colnames(flights)

filter(flights, month == 11, day == 3, carrier == "AA")
head(filter(flights, month == 11, day == 3, carrier == "AA"))

head(flights[flights$month == 1 & flights$day == 5 & flights$carrier == "AA",])

#Slice = allows to slice rows
slice(flights, 1:10)

head(arrange(flights, year, month, day, arr_time))

head(select(flights, carrier, arr_time))

head(rename(flights, airline_carrier = carrier, arrival_time = arr_time))

distinct(select(flights, carrier))

head(mutate(flights, new_col = arr_delay - dep_delay))

head(transmute(flights, new_col = arr_delay - dep_delay))

summarize(flights,avg_air_time = mean(air_time,na.rm = TRUE))
#na.rm = remove the missing values
summarize(flights, total_time = sum(air_time, na.rm = TRUE))

sample_n(flights, 10)
sample_frac(flights, .1)

#Pipe Operator for NESTING the code
install.packages("dplyr")
library(dplyr)

df <- mtcars

head(df)
#without nesting 
result <- arrange(sample_n(filter(df,mpg>20), size = 5), desc(mpg))
print(result)
#with nesting

result <- df %>%
  filter(mpg > 20) %>%
  sample_n(size = 5) %>%
  arrange(desc(mpg))

print(result)

a <- filter(df,mpg>20)
b <- sample_n(a,size = 5)
result <- arrange(b,desc(mpg))

print(result)

#Excercise
install.packages("dplyr")
library(dplyr)
head(mtcars)

filtered_mtcars <- mtcars %>%
  filter(mpg > 20, cyl == 6)
print(filtered_mtcars)


#Reorder the Data Frame by cyl first, then by descending wt.
sorted_mtcarts <- mtcars %>%
  arrange(cyl, desc(wt))
head(sorted_mtcarts)

#Select the columns mpg and hp
head(select(mtcars, mpg, hp))

select_mtcars <- mtcars %>%
  select(mpg,hp)
head(select_mtcars)

#Select the distinct values of the gear column.
distincting_mtcars <- mtcars %>%
  distinct(gear)
print(distincting_mtcars)

#Create a new column called "Performance" which is calculated by hp divided by wt.
colAdded_mtcars <- mtcars %>%
  mutate(performance = hp/wt)
head(colAdded_mtcars)
#option 2
colAdded_mtcars <- mutate(mtcars, performance = hp/wt)
head(colAdded_mtcars)

#Find the mean mpg value using dplyr.
summary_mtcars <- summarize(mtcars, avg_mpg = mean(mpg)) 
print(summary_mtcars)

#Use pipe operators to get the mean hp value for cars with 6 cylinders.
mean_hp_6cyl <- mtcars %>%
  filter(cyl == 6) %>%
  summarize(mean_hp = mean(hp))
print(mean_hp_6cyl)

#Using Tidyr

install.packages("tidyr")
library(tidyr)

install.packages("data.table")
library(data.table)

#create a dataframe to practice Gatehr ()
comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
print(df)

#here data frame is wide.
gather(df, Quarter, Revenue, Qtr1:Qtr4)

help(gather)

#option 2 (using pipe operatior)
df %>%
  gather(Quarter, Revenue, Qtr1:Qtr4)

#Create a dummy dataframe for practicing Spread()
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks

stocks_gathered <- stocks %>%
  gather(Stock, Price, X,Y,Z)
print(stocks_gathered)