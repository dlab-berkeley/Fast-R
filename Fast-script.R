# Navigating RStudio
## By default, this script will open in the upper left pane of RStudio. Open a new script by clicking File --> New File --> R Script

## 1. Script: this is your input and is easily savable
## 2. Console: output appears here and functions as a nice scratch space
## 3. Global Environment: saved variables will appear here
## 4. Misc: navigate your file system, plots, install packages, view help

# Variable Assignment
## We save data in R's memory by storing them in placeholders called "variables", which can be called and manipulated. 

x <- 5  # assign the variable
x       # print it to your console

y <- log(2.4)
y

z <- x / cos(y)
z

# Functions and arguments
## Functions: perform actions on things
## Arguments: the "things"

# Data types
## The class() function checks the class ("type") of a variable. There are five basic types for data, listed below.

## 1. Numeric type - 64-bit floating point numbers (decimals); the default for all numbers in R, even numbers that look like integers:
class(x)

## 2. Integer - whole numbers, positive and negative (including zero). Use the as.integer() function to convert it:
x_int <- as.integer(x)
x_int
class(x_int)

## 3. Character - character string data; always wrapped in quotations:
x_char <- as.character(x)
x_char
class(x_char)

## 4. Logical - TRUE and FALSE only; used for logical testing, data subsetting, and turning function parameters "on" and "off"

"Berkeley" == "berkeley" # equivalent to (remember, R is case sensitive)
8 != 7 # not equivalent to
3 > 2 # greater than
9 <= 9 # less than/equal to

mean(c(1, 5, 7, NA, 8)) # NA is missing value

## Using the help files:
?mean

mean(c(1, 5, 7, NA, 8), na.rm = TRUE)

## 5. Factor - synonymous with categorical type (can be nominal or ordinal)

## Deleting variables
### First, view the variables saved in your global environment:
ls()

### Delete x
rm(x)

ls() # x has been removed

### You can also wipe your Global Environment clean by clicking the broom on your "Environment" tab in the upper-right pane of your RStudio session.

# Data structures
## Vector: an ordered group of the SAME type of data. These will be the columns/variables in your data frames and spreadsheets.
Name <- c("Max", "Tito", "Bella", "Tessa", "Milley")
Name
class(Name)

Age <- c(5, 9, 12, 2, 6)
Age
class(Age)

# Indexing: means to refer to part of a data scructure by position. R is a one-indexed language and begins counting at the number 1. 

## If we want to extract the third name from the Name vector, we could type:
Name[3]

## If we want to extract the second, third, and fourth names: 
Name[2:4]

# Data Frame: an ordered group of EQUAL-LENGTH vectors!
animals <- data.frame(Name, Age)
animals
class(animals)

# Import data
## There are many different ways to import data into R, which can handle data of virtually every format. We will stick with .csv (comma-separated values) files for now. 

## The easiest way to import data is to: 
## 1. Click the "Import Dataset" button at the top of your "Environment" tab in the upper-right pane of RStudio
## 2. Then click "From Text (base)..."
## 3. Navigate your file system to the "Fast-R" folder you downloaded/cloned earlier
## 4. Select "gapminder.FiveYearData.csv", and a dialog box appears
## 5. Rename the "Name" field to gap and click "Import". 
## You should now see the dataset in its entirety pop up in a new tab. This is done by using the View() function.

str(gap) # displays the compact structure of the data frame
head(gap) # shows the first six rows by default
dim(gap) # show row x col dimensions 
nrow(gap) # print number of rows
ncol(gap) # display number of columns
colnames(gap) # display column names
rownames(gap) # display row names
summary(gap) # produce six-number summary statistics
table(gap$continent) # tabulate frequencies for factor/categorical data.

# Subseting in one dimension
## Use the dollar sign to extract just one column from a data frame. First, just type gap$ and press the tab key - the names of the columns will appear as a vector! 

## To extract just the lifeExp column, we could type
gap$lifeExp

## This is useful because we can immediately plug it into something else:
?hist
hist(gap$lifeExp) # e.g., a histogram

?cor.test
cor.test(gap$lifeExp, gap$gdpPercap) # Pearson correlation

# Subsetting in two dimensions with bracket notation
## Extracting a single column is good, but slicing rows and columns might be better. Remember how we indexed a vector earlier? We wil do the same thing here, but will type the name of the dataset followed by square brackets separated by a comma. Like this:

## gap[rows, cols]

## If we just want rows 5 thru 9 and columns 2 thru 4 we could type:
gap_small <- gap[5:9, 2:4]
gap_small

## ... but for discontinuous subsets we need to use c(). If we want rows 5 thru 9 and 17 along with columns 2 thru 4 and 6, we could type: 
gap_small2 <- gap[c(5:9, 17), c(2:4, 6)]
gap_small2 

# Do we have the proper rows and columns?
colnames(gap)

# Visualization
## Use data visualizations to communicate potentially complex phenomena in easy to understand ways. 

## Base graphics - these graphical funcions come with the base installation of R

### Histogram: illustrate the distribution of one continuous (i.e., numeric or integer) variable:

### Default rendering:
hist(gap$lifeExp)

### Customizations
hist(gap$lifeExp, # data to be plotted
     col = "skyblue", # bar color
     main = "Life Expectancy", # title
     xlab = "Years", # x-axis label
     ylab = "Count", # y-axis label
     xlim = c(20, 90), # x-axis limits
     ylim = c(0,400), # y-axis limits
     las = 1) # Label Axis Style

### Boxplots: display distribution of a continuous variable, but parsed by a factor (think of the tilde as meaning "by"). The other graphical parameters apply here as well:
boxplot(gap$lifeExp ~ gap$continent)

### Scatterplot: display the distributions of two continuous variables - one on the x-axis and one on the y-axis:
plot(x = gap$lifeExp, 
     y = gap$gdpPercap)

## ggplot2
### Base plotting is good, but the ggplot2 way is better! Manipulating margins, legends, and point colors can be cumbersome. Thankfully, ggplot2 helps us produce publication ready figures more efficiently. 

### First, install the ggplot2 package. This physically downloads the files to your computer from CRAN: 
install.packages("ggplot2")

### ... however, your current R session does not know they are there. Second, import the ggplot2 files into your current session:
library(ggplot2)

### Test that your installation and import was successful by checking the help files:
?ggplot2

### You need three things to create a ggplot:
#### 1. data
#### 2. `aes`thetics (define coordinate system, map colors to points, etc.)
#### 3. `geom_`s (how should the data actually be represented? Points, bars, lines, etc.)

#### Add a new layer between each ggplot layer with the plus symbol +
#### `theme` can be used to change non-data customizations

### Produce the base layer:
ggplot(gap, aes(x = lifeExp, y = gdpPercap))

### Add points by adding a new layer:
ggplot(gap, aes(x = lifeExp, y = gdpPercap)) + 
  geom_point()

### Color each point by its corresponding continent by editing `aes()`:
ggplot(gap, aes(x = lifeExp, y = gdpPercap,
                color = continent)) + 
  geom_point()

### Remove the gray background:
ggplot(gap, aes(x = lifeExp, y = gdpPercap,
                color = continent)) + 
  geom_point() + 
  theme_bw()

### Export:
#### Click "Export" --> "Save as PDF", change the dimensions and name your file. Then, open this image up in your PDF viewer (default is "Preview" on Mac"), and click "File" --> "Export" and select "TIFF" in the "Format" dropdown menu. Select "JPEG" from the "Compression" menu and set your preferred resolution before clicking save. 

# Statistical testing
## Perhaps we are interested in seeing if a relationships exist between lifeExp and continent, gdpPercap and continent, and lifeExp and gdpPercap?
## How do we know if our results are any good? 
## DISCLAIMER: We are just showing you how statistical testing works in R. There are many assumptions and conditions that must be considered before considering significance testing in your work. Are we violating any assumptions here and how do we find out? 

### One way ANOVA (compare mean variance for two or more samples):
?aov
aov_life <- aov(gap$lifeExp ~ gap$continent)
summary(aov_life)
TukeyHSD(aov_life)

aov_gdp <- aov(gap$gdpPercap ~ gap$continent)
summary(aov_gdp)
TukeyHSD(aov_gdp)

### Pearson correlation (check for linear correlation between variables):
cor.test(gap$lifeExp, gap$gdpPercap)

### Fit a linear model - can we use gdpPercap to predict lifeExp? )
?lm
lm_gap <- lm(gap$lifeExp ~ gap$gdpPercap)
summary(lm_gap)
