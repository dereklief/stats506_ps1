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
######## ADD ROXYGEN DOCUMENTATION HERE ########
test_function <- function(a, b){
  c = a + b
  return (c)
}

test_function(2, 3)
# second, now, let's get down to our our "isPerfectPower" function:

#' A function to identify whether a given integer is a perfect power for a given power
#' 
#' @param c the resulting integer from the operation
#' @param b the given power
#' @return a list of length 2 with the first entry a logical for whether c is a perfect 
#' power for the given power and the second entry the root of the input
#' @examples 
#' isPerfectPower(4,2)
#' isPerfectPower(1073741824,10)
isPerfectPower <- function(c, b){
  a <- exp((log(c))/(b))
  closest_int <- round(a)
  a_comp <- a - closest_int
  if(a_comp < 0.00000000000001 && a_comp > -0.00000000000001){
    output_list <- list(isPerfect = TRUE, root = a)
    return(output_list)
  }
  output_list <- list(isPerfect = FALSE, root = NA)
  return(output_list)  
}


## b) Demonstrate your function works. Do so by writing another function “findRootPower” 
## which calls your first function, using a loop to identify both the root and power. 
## Your function should identify the lowest power for which the input is perfect 
# I should think using the true in the for loop 
######## ADD ROXYGEN DOCUMENTATION HERE ########
findRootPower <- function(result_integer){
  for(i in 2:result_integer){
    y <- isPerfectPower(result_integer, i)
    test_Perfect <- y$isPerfect
    test_Root <- y$root
    if(test_Perfect==TRUE){
      return(print(paste0(result_integer, " = ", test_Root,"^", i )))
    }
  }
  print("The input is not a perfect power.")
}

## Use this new function to identify whether each of the following is a perfect power, 
## and if so what its root and power is.
findRootPower(27)
#"27 = 3^3"
findRootPower(13060694016)
"13060694016 = 6^13"
#"27 = 3^3"
findRootPower(7776)
#"7776 = 6^5"
findRootPower(170859375)
#"170859375 = 15^7"
findRootPower(58247422)
# TO DO
#"27 = 3^3"
findRootPower(94143178827)
# TO DO
#"27 = 3^3"

### PROBLEM 3 - ChatGPT
## a) Put the following prompt into ChatGPT (or your favorite other LLM) and copy its 
## output (both the code it produces as well as any text it generates) into your submission. 
## (If a non-ChatGPT LLM produces nonsense results, try ChatGPT. If that is still producing 
## nonsense, let me know. Blockquotes might be useful for displaying this inside your Quarto 
## document.)

# Below is the output generated:


```
# Function to identify the name of a poker hand
identify_poker_hand <- function(suits, ranks) {
  if (length(unique(suits)) == 1 && max(ranks) - min(ranks) == 4) {
    return("Straight Flush")
  }
  
  if (length(table(ranks)) == 2) {
    if (max(table(ranks)) == 4) {
      return("Four of a Kind")
    } else {
      return("Full House")
    }
  }
  
  if (length(unique(suits)) == 1) {
    return("Flush")
  }
  
  if (max(ranks) - min(ranks) == 4) {
    return("Straight")
  }
  
  if (length(table(ranks)) == 3) {
    if (max(table(ranks)) == 3) {
      return("Three of a Kind")
    } else {
      return("Two Pair")
    }
  }
  
  if (length(table(ranks)) == 4) {
    return("One Pair")
  }
  
  return("High Card")
}

# Function to simulate dealing a round of poker
deal_poker_round <- function(num_players) {
  # Create a deck of cards
  ranks <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace")
  suits <- c("Hearts", "Diamonds", "Clubs", "Spades")
  deck <- expand.grid(Rank = ranks, Suit = suits)
  
  # Shuffle the deck
  deck <- deck[sample(nrow(deck)), ]
  
  # Deal 5 cards to each player
  players <- list()
  for (i in 1:num_players) {
    player_hand <- deck[((i - 1) * 5 + 1):(i * 5), ]
    players[[i]] <- player_hand
    cat("Player", i, "Hand:\n")
    print(player_hand)
    hand_name <- identify_poker_hand(player_hand$Suit, player_hand$Rank)
    cat("Hand Name:", hand_name, "\n\n")
  }
}

# Example usage:
set.seed(123)  # Set a seed for reproducibility
deal_poker_round(4)  # Simulate a round of poker with 4 players
```
