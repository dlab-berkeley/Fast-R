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






# Load the "gapminder-FiveYearData.csv" data
# 1. Remember to first set your working directory to the Fast-R folder you downloaded
#    Session --> Set Working Directory --> Choose Directory
# 2. Save it in a variable named gap (remember to use the read.csv function!)

# check you working directory
getwd()
dir()

x = 5

gap = read.csv("gapminder-FiveYearData.csv")
gap

# subset our data
str(gap)
class(gap)
gap$lifeExp
# Histogram - used for one numeric/integer variable
hist(gap$lifeExp, col = "purple", 
     main = "Histogram of Life Expectancy",
     xlab = "Life expectancy (years)",
     ylab = "Frequency",
     las = 1)

# Scatterplot - used for TWO numeric/integer variables
plot(x = gap$lifeExp, y = gap$gdpPercap,
     xlab = "Life expectancy (years)",
     ylab = "GDP per capita ($)", 
     col = gap$continent)

# Scatterplot - the ggplot2 way
install.packages("ggplot2")
library(ggplot2)
?ggplot
# You need three things to make a ggplot
# 1. data
# 2. "aes"thetics - define x and y coordinates, colors, shapes, etc.
# 3. geoms - how to represent your data? points, bars, lines, etc.
ggplot(data = gap, aes(x = lifeExp, y = gdpPercap, color = continent, shape = continent)) + 
  geom_point(size = 3, alpha = 0.75) + 
  ggtitle("Life expectancy versus GDP per capita income") + 
  xlab("Life expectancy (years)") + 
  ylab("GDP per capita ($)") + 
  theme_classic() + 
  theme(legend.position = "bottom")
  
# Boxplot - used when you have one categorical variable and one numeric/integer
ggplot(data = gap, aes(x = continent, y = lifeExp)) +
  geom_boxplot(fill = "red")

# summarize your data as well! 
gap$continent
table(gap$continent)
prop.table(table(gap$continent))

table(gap$year, gap$continent)
table(gap$continent, gap$year)

summary(gap)
summary(gap$lifeExp)
boxplot(gap$lifeExp, las = 1)
mean(c(1,2,3,4,100))
median(c(1,2,3,4,100))

# Challenge! 
# 1. Create a histogram of population from gap
hist(gap$pop, col = "darkgreen", xlab = "Number of people")
# 2. Create a boxplot of population by continent
boxplot(gap$pop ~ gap$continent)
ggplot(data = gap, aes(x = continent, y = pop)) + geom_boxplot()
# 3. Create a scatterplot of population versus lifeExp
ggplot(gap, aes(x = lifeExp, y = pop, color = continent)) +
  geom_point()
# 4. Create a density curve of lifeExp - how do you figure out how to do this?
ggplot(gap, aes(x = lifeExp, fill = continent)) + 
  geom_density(alpha = 0.25) #+ 
  #facet_wrap(~continent)
# here is some good help: http://www.sthda.com/english/wiki/ggplot2-essentials

library(ggplot2)
ggplot(data = gap, aes(x = lifeExp, y = gdpPercap, color = continent, shape = continent)) + 
  geom_point(size = 3, alpha = 0.75) + 
  ggtitle("Life expectancy versus GDP per capita income") + 
  xlab("Life expectancy (years)") + 
  ylab("GDP per capita ($)") + 
  theme_classic() + 
  theme(legend.position = "bottom") + 
  #facet_grid(~continent)
  facet_wrap(~continent)

# fit a linear regression
# Can we use gdpPerap to predict lifeExp?
?lm
# Y ~ X 

# FIRST STEP! Check for correlation
?cor.test
cor.test(gap$lifeExp, gap$gdpPercap)

# now, fit the regression
gap_lm = lm(gap$lifeExp ~ gap$gdpPercap)
gap_lm
summary(gap_lm)
