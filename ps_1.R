#### STATS 506 PS 1
### PROBLEM 1 - WINE DATA
## a) Import the data into a data.frame in R. Use the information in the “wine.names” 
## file to give appropriate column names. (Note: Downloading and unzipping the file can take 
## place outside of your submitted document, but importing the file should be in the submission.)
# Load data ---------------------------
wine_data <-read.csv("/Users/dereklief/Desktop/MAIN FOLDER/Classes and Other/STATS 506/PS 1/stats506_ps1/wine/wine.data.csv", skip = 1, header = FALSE)
wine_names <-read.csv("/Users/dereklief/Desktop/MAIN FOLDER/Classes and Other/STATS 506/PS 1/stats506_ps1/wine/wine.names.csv", skip = 1, header = FALSE)
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
