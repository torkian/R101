2 + 2  # Basic math; Mac: cmd -enter; PC: ctrl-r

1:100  # Prints numbers 1 to 100 across several lines

print("Hello World!")  # Prints "Hello World" in console

# Variables
x <- 1:5  # Put the numbers 1-5 in the variable x
x  # Displays the values in x
y <- c(6, 7, 8, 9, 10)  # Puts the numbers 6-10 in y
y  # Displays y
x + y  # Adds corresponding elements in x and y
x * 2  # Multiplies each element in x by 2
x * y

x <- 0:10  # Assigns number 0 through 10 to x
x  # Prints contents of x in console

y <- c(5, 4, 1, 6, 7, 2, 2, 3, 2, 8)  # Assigns values to y
y  # Prints y to console

ls()  # List objects

# CSV FILES
# R converts missing to "NA"
# Don't have to specify delimiters for missing data
# because CSV means "comma separated values"
# "header = T" means the first line is a header
# This first one will not work because of the backslashes
sn.csv <- read.csv("C:\Users\RCI\Desktop\social_network.csv", header = T)
# Need to either double up the backslashes...
sn.csv <- read.csv("C:\\Users\\RCI\\Desktop\\social_network.csv", header = T)
# Or replace with forward slashes
sn.csv <- read.csv("C:/Users/RCI/Desktop/social_network.csv", header = T)
sn.csv <- read.csv("~/social_network.csv", header = T)
str(sn.csv)

# SPSS FILES
# Saved as .csv in SPSS
sn.spss.csv <- read.csv("~\social_network_spss.csv", header = T)
str(sn.spss.csv)

# Using package "foreign"
# Gets warnings but no errors
install.packages("foreign")
library(foreign)
sn.spss.f <- read.spss("C:\\Users\\Barton Poulson\\Desktop\\social_network.sav", to.data.frame=T, use.value.labels=T)
str(sn.spss.f)
# Lists of packages
# Opens CRAN Task Views in browser
browseURL("http://cran.r-project.org/web/views/")
# Opens "Available CRAN Packages By Name" (from UCLA mirror)
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html")
library()  # Brings up editor list of available packages
search()  # Shows packages that are currently active

# To install and use packages
# Can use Tools > Install Packages
# Can use Packages window
# Or can use scripts

# Downloads package from CRAN and installs in R
install.packages("psych")
# Make package available; preferred for loading in scripts
library("psych")
# Preferred for loading in functions and packages
require("psych")
# Brings up documentation in editor window
library(help = "psych") 

# Vignettes
# Brings up list of vignettes (examples) in editor window
vignette(package = "psych")  
# Open web page with hyperlinks for vignette PDFs etc.
browseVignettes(package = "psych")  
vignette()  # Brings up list of all vignettes
browseVignettes()  # HTML for all vignettes

# Update packages
# In RStudio, Tools > Check for Package Updates
update.packages()  # Checks for updates; do periodically

# Removing packages
# By default, all installed packages are removed when R quits
# Can also manually uncheck in Packages window
# Or can use this code
detach("package:psych", unload=TRUE)# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)

# R doesn't create bar charts directly from the categorical
# variables; instead, we must first create a table that
# has the frequencies for each level of the variable.
# The "table" function is able to create this table from
# the variable, which we specify as sn$Site. That is, we
# first give the name of the data frame, then $, then the 
# name of the variable. (Following Google's style guide,
# it is better to state explictly the data frame than to
# use the shortcut function "attach," which can lead to
# confusion.)

site.freq <- table(sn$Site)  # Creates table from Site

barplot(site.freq)  # Creates barplot in new window
? barplot  # For more information on customizing graph

# To put the bars in descending order, add "order":
barplot(site.freq[order(site.freq, decreasing = T)])

# Draw the bars horizontally (but turn off decreasing)
barplot(site.freq[order(site.freq)], horiz = T)

# Make Facebook blue and all others gray by specifying a
# vector with named colors for gray and RGB for Facebook blue
# fbba = "Facebook blue/ascending" for horizontal bars
# And now breaking code across lines for clarity
fbba <- c(rep("gray", 5),
          rgb(59, 89, 152, maxColorValue = 255))
          
barplot(site.freq[order(site.freq)], 
        horiz = T, 
        col = fbba)

# Turn off borders with "border = NA"
# Add title with "main" with "\n" to break line
# Add subtitle with "sub"
barplot(site.freq[order(site.freq)],
        horiz = T,         # Horizontal
        col = fbba,        # Use colors "fbba"
        border = NA,       # No borders
        xlim = c(0, 100),  # Scale from 0-100
        main = "Preferred Social Networking Site\nA Survey of 202 Users",
        xlab = "Number of Users")
        
# Immense amount of control available through
# "par {graphics}"

# RStudio gives option of saving as image file in
# several formats and it's easier to change sizes



# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)

# Make a histogram of Age using the defaults
hist(sn$Age)

# Add title, colors, etc.
hist(sn$Age,
     #border = NA,
     col = "beige", # Or use: col = colors() [18]
     main = "Ages of Respondents\nSocial Networking Survey of 202 Users",
     xlab = "Age of Respondents")
     
# By the way, a chart of R's color palette can be found at
# http://research.stowers-institute.org/efg/R/Color/Chart/
# including a downloadable PDF version. This chart uses
# numbers for colors instead of names. To get the names, use
colors() [18]  # Which will output [1] "beige"
colors()[c(552, 254, 26)]  # Gives [1] "red" "green" "blue" 



# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)

# Make boxplots of Age and Times using the defaults
boxplot(sn$Age)

# Add title, colors, etc.
boxplot(sn$Age,
        col = "beige",
        notch = T,
        horizontal = T,
        main = "Ages of Respondents\nSocial Networking Survey of 202 Users",
        xlab = "Age of Respondents")

# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)

table(sn$Site)  # Creates frequency table in alphabetical order
site.freq <- table(sn$Site)  # Saves table
site.freq  # Print table

site.freq <- site.freq[order(site.freq, decreasing = T)] # Sorts by frequency, saves table
site.freq  # Print table

prop.table(site.freq)  # Give proportions of total
round(prop.table(site.freq), 2)  # Give proportions w/2 decimal places


# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)
summary(sn$Age)  # Summary for one variable
summary(sn)      # Summary for entire table (inc. categories)

# Tukey's five-number summary: minimum, lower-hinge
#     (i.e., first quartile), median, upper-hinge
#     (i.e., third quartile), maximum
# Doesn't print labels
fivenum(sn$Age)

# Alternate descriptive statistics
# Gives n, mean, standard deviation, median, trimmed mean
#   (10% by default),median absolute deviation from median
#   (MAD), min, max, range, skew, kurtosis, and
#   standard error.
# Options for listwise deletion of missing data, methods of 
#   calculating median/skew/kurtosis, amount of trimming, etc.
# Note: Converts categories to sequential numbers and does
#   stats; can be useful in certain situations; marks with *
install.packages("psych")
library("psych")
describe(sn)


# Use dataset "social_network.csv" which records the
# gender and age of 202 online survey respondents
# along with their preferred social networking site
# and an estimate of how many times they log in
# per week.

# Create data frame "sn" from CSV file w/headers
sn <- read.csv("social_network.csv", header = T)

# Install and load "psych" package for descriptives
install.packages("psych")
library("psych")

# Original variable Times
hist(sn$Times)
describe(sn$Times)

# z-scores
# Use built-in function "scale"
times.z <- scale(sn$Times)
hist(times.z)
describe(times.z)

# log
times.ln0 <- log(sn$Times)
hist(times.ln0)
describe(times.ln0)
# Add one to avoid undefined logs for 0 times
times.ln1 <- log(sn$Times + 1)
hist(times.ln1)
describe(times.ln1)

# Ranking
times.rank <- rank(sn$Times)
hist(times.rank)
describe(times.rank)
# ties.method = c("average", "first", "random", "max", "min")
times.rankr <- rank(sn$Times, ties.method = "random")
hist(times.rankr)
describe(times.rankr)

# Dichotomizing
# Use wisely and purposefully!
time.gt1 <- ifelse(sn$Times > 1, 1, 0)
time.gt1

# Computing new variables

# Create variable n1 with 1 million random normal values
n1 <- rnorm(1000000)
hist(n1)

# Create variable n2 with 1 million random normal values
n2 <- rnorm(1000000)
hist(n2)

# Average scores across two variables
n.add <- n1 + n2
hist(n.add)

# Multiple scores across two variables
n.mult <- n1 * n2
hist(n.mult)

# Install and load "psych" package to get kurtosis
install.packages("psych")
library("psych")

# Calculate kurtosis for each distribution
kurtosi(n1)
kurtosi(n2)
kurtosi(n.add)
kurtosi(n.mult)

# Load data file about Google searches by state
google <- read.csv("google_correlate.csv", header = T)
names(google)
str(google)

# Does interest in data visualization vary by region?
# Split data by region, create new data frame
viz.reg.dist <- split(google$data_viz, google$region)

# Draw boxplots by region
boxplot(viz.reg.dist, col = "lavender")

# To draw barplot with means
viz.reg.mean <- sapply(viz.reg.dist, mean)
# Run next two together (or sequentially)
barplot(viz.reg.mean,
        col = "beige",
        main = "Average Google Search Share of\n\"Data Visualization\" by Region of US")
abline(h = 0)

# Install and load "psych" package to print means, etc.
install.packages("psych")
library("psych")
describeBy(google$data_viz, google$region)


# Load data file about Google searches by state
google <- read.csv("google_correlate.csv", header = T)
names(google)
str(google)

# Is there an association between the percentage of people
# in a state with college degrees and interest in
# data visualization?
plot(google$degree, google$data_viz)
# Add title, labels, change circles to points
plot(google$degree, google$data_viz,
     main = "Interest in Data Visualization Searches\nby Percent of Population with College Degrees",
     xlab = "Population with College Degrees",
     ylab = "Searches for \"Data Visualization\"",
     pch = 20,
     col = "grey")
# Add fit lines
# Linear regression line (y ~ x) 
abline(lm(google$data_viz ~ google$degree), col="red")
# Lowess smoother line (x, y)
lines(lowess(google$degree, google$data_viz), col="blue")


# Load data file about Google searches by state
google <- read.csv("google_correlate.csv", header = T)
names(google)

# Basic Scatterplot Matrix
pairs(~data_viz + degree + facebook + nba,
      data = google, 
      pch = 20,
      main = "Simple Scatterplot Matrix")

# Use "Pairs Plot" from "psych" package
install.packages("psych")
library("psych")
pairs.panels(google[c(3, 7, 4, 5)], gap = 0)

# Load data file about Google searches by state
google <- read.csv("google_correlate.csv", header = T)
names(google)

# Basic Scatterplot Matrix
pairs(~data_viz + degree + facebook + nba,
      data = google, 
      pch = 20,
      main = "Simple Scatterplot Matrix")

# Use "Pairs Plot" from "psych" package
install.packages("psych")
library("psych")
pairs.panels(google[c(3, 7, 4, 5)], gap = 0)  

# Load data file about Google searches by state
google <- read.csv("google_correlate.csv", header = T)
names(google)

# Spinning 3D scatterplot
# Install and load rgl package
#install.packages("rgl")
#library("rgl")
#plot3d(google$data_viz,  # x variable
#       google$degree,    # y variable
#       google$facebook,  # z variable
#       xlab = "data_viz",
#       ylab = "degree",
#       zlab = "facebook",
#       col  = "red", 
#       size = 3)

install.packages("plot3D")
library("plot3D")
data(iris)
head(iris)
# x, y and z coordinates
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width
scatter3D(x, y, z, clab = c("Sepal", "Width (cm)"))
