# Add comments to our code
# Script = input (our instructions go here)

2 + 2 # (Command + Enter = Mac; Ctrl + Enter = PC)
cos(pi) 

##
## Use hashtags to add comments to your script! 
## Use "USI_R-intro.html" as your guide, but type your code here! 
##
## Only comments have hashtags before them; code does not
##
## For example, here is where you could type some notes about Navigating RStudio

# the upper left pane is the script (input)
# the lower left pane is the console (output)
# upper right = global environment (where data are saved)
# lower right = plots, packages, help

# Variable Assignment
x = 5 * 10
x
52:567

(y = x / 1000)

# rm() will delete a single variable
rm(x)

# Data Types
class(x)
x
### Numeric


### Integer




##### Coercing (changing) data types


### Character
Evan = 44
Evan = 100
my_name = "Evan"
(my_name = Evan2)

my_name + my_name
x + y
paste(my_name, my_name)
### Logical 


### Factor


# Data Structures

### Vector

### Data Frame

# Load data from files

# Subsetting your data

### In one dimension `$`

### In two dimensions `[ , ]`

# Part 2

# Data summarization

# Visualization

# Statistical testingtest


# Define two numeric variables
# 1.
y = 21
y
# 2.
x = 99
x

# Define two text variables
# 1. 
game = "Blackjack"
game

# 2.
mack = "scholar"
mack

# vector = an organized group of the SAME type of data!
# 1, 2, 400, 5678
c()
vec1 = c(1, 2, 400, 5678)
vec1

# square brackets refer to an index (position) of a vector
vec1[3]
vec1[1]
vec1[5]

vec1
vec2 = c(4, 5)
vec2
vec1 * vec2

# define three vectors EACH  with length 5
# 1. numeric
num1 = c(1, 3, 5, 7, 9)
num1
# 2. numeric
num2 = c(100, 200, 300, 400, 500)
num2
# 3. text/character/string
char1 = c("one", "two", "three", "four", "five")
char1
class(char1)

# make a data frame from num1, num2, and char1
myData = data.frame(num1, num2, char1)
myData # "tabular" data

str(myData)
class(myData)

# use $ to access just a single column!
myData
hist(myData$num1, col = "turquoise", main = "COOL!")

summary(myData)

# save your work
write.csv(myData, file = "myData.csv")

# figure out your working directory with
getwd()

# import data! 
# two step process
# 1. set your working directory
# 2. read.csv()
gap = read.csv("gapminder-FiveYearData.csv")
hist(gap$lifeExp, col = "pink")
