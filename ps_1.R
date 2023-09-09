#### STATS 506 PS 1
### PROBLEM 1 - WINE DATA
## a) Import the data into a data.frame in R. Use the information in the “wine.names” 
## file to give appropriate column names. (Note: Downloading and unzipping the file can take 
## place outside of your submitted document, but importing the file should be in the submission.)
# Load data ---------------------------
wine_data <-read.csv("/Users/dereklief/Desktop/MAIN FOLDER/Classes and Other/STATS 506/PS 1/stats506_ps1/wine/wine.data.csv", header = FALSE)
# Rename columns ---------------------------
wine_data <- setNames(wine_data, c("wine_type",
                                   "alcohol",
                                   "malic_acid",
                                   "ash",
                                   "alcalinity_of_ash",
                                   "magnesium",
                                   "total_phenols",
                                   "flavanoids",
                                   "nonflavanoid_phenols",
                                   "proanthocyanins",
                                   "color_intensity",
                                   "hue",
                                   "OD280",
                                   "proline"))

## b) The data contains information on three different classes of wine. Ensure that the 
## number of wines within each class is correct as reported in “wine.names”. 
table(wine_data$wine_type)

## c) Use the data to answer the following questions:
## 1. The wine with the highest alcohol content belongs to which class?
max(wine_data$alcohol) # check what the max is
row_max <- wine_data[which.max(wine_data$alcohol),] # extract the row with the max
select(row_max, wine_type, alcohol)
remove(row_max)
# ANSWER: the wine with the highest alcohol content belongs to class 1

## 2. The wine with the lowest alcohol content belongs to which class?
min(wine_data$alcohol) # check what the min is
row_min <- wine_data[which.min(wine_data$alcohol),] # extract the row with the max
select(row_min, wine_type, alcohol)
remove(row_min)
# ANSWER: the wine with the lowest alcohol content belongs to class 2

## 3. German beers have, on average, 114 mg/l of magnesium. How many of 
## these wines have higher levels of magnesium than that? (You may assume that the magnesium 
## reported in the data is in the same units.)
q1_c <- filter(wine_data, magnesium>114)
remove(q1_c)
# ANSWER: 26
## 4. Within each class, how many wines have higher levels of magnesium than average German beer?
class_1 <- filter(wine_data, wine_type==1)
class_2 <- filter(wine_data, wine_type==2)
class_3 <- filter(wine_data, wine_type==3)

q1_d_1 <- filter(class_1, magnesium>114)
q1_d_2 <- filter(class_2, magnesium>114)
q1_d_3 <- filter(class_3, magnesium>114)

# ANSWER: class 1: 15; class 2: 6; class 3: 5
remove(class_1, class_2, class_3, q1_d_1, q1_d_2, q1_d_3)

### PROBLEM 2 - PERFECT POWERS
## a) Write a function “isPerfectPower” to identify whether a given integer is a perfect power 
## for a given power. Do not use any existing functions to check this; do so with arithmetic.
# first, let's write a test function to see if you get the gist:
test_function <- function(a, b){
  c = a + b
  return (c)
}

test_function(2, 3)
# second, now, let's get down to our our "isPerfectPower" function:
# try for 10 lines of code 
isPerfectPower <- function(result_number, power_number){
  for (x in 2:result_number){
    result <- x**power_number #Q2: can I use the **?
    if (result == result_number){
      output_list <- list(isPerfect = TRUE, root = x)
      output_list$isPerfect
      output_list$root
      return(output_list) # Q2: it stops here if I find the perfect root right?
    } 
  }
  output_list$isPerfect
  output_list$root
  output_list <- list(isPerfect = FALSE, root = NA)
  return(output_list)    
}

isPerfectPower <- function(result_number, power_number){
  x <- exp((log(result_number))/(power_number))
  if(x %% 1 < 0.0000000000000001) {
  y <- x**(power_number)
  diff_test <- result_number - y
  if(diff_test<0.0000000000000001) {
    output_list <- list(isPerfect = TRUE, root = x)
    output_list
  } else{
    output_list <- list(isPerfect = FALSE, root = NA)
    output_list
  }} else{
      output_list <- list(isPerfect = FALSE, root = NA)
      output_list
  }
  }
isPerfectPower(result_number = 125, power_number = 3)

x <- exp((log(25))/(2))

5 %% 1 
x %% 1
## b) Demonstrate your function works. Do so by writing another function “findRootPower” 
## which calls your first function, using a loop to identify both the root and power. 
## Your function should identify the lowest power for which the input is perfect 
# I should think using the true in the for loop 
findRootPower <- function(result_integer){
  for (i in 2:result_integer){
    isPerfectPower(result_integer, i)
  }
}
