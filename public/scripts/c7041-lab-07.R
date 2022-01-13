## HEADER ####
## Who: Ed
## What: c7041 Lab 07
## https://dsgarage.netlify.app/c7041-labs/07-anova/
## Last edited: 2021-12-21
####


## CONTENTS ####
## 00 Setup
## Problems


## 00 Setup ####

setwd(r'(D:\Dropbox\WORK\__Harper Adams stuff\HARPER courses\_C7041 EDA Exp Design and Analysis\2021\labs\data)')

library(openxlsx)

digits <- read.csv("cuckooeggs.csv")

Questions
## Q1 ####

# The European cuckoo does not look after its own eggs, but instead lays 
# them in the nests of birds of other species. Previous studies showed 
# that cuckoos sometimes have evolved to lay eggs that are colored similarly 
# to the host bird species. Is the same true of egg size? Do cuckoos 
# lay eggs similar in size to the size of the eggs of their hosts? The 
# data file "cuckooeggs.csv" contains data on the lengths of cuckoo eggs 
# laid in the nests of a variety of host species. Here we compare the 
# mean size of cuckoo eggs found in the nests of different host species.

# a. Plot a multiple histogram showing cuckoo egg lengths by host species.

# b. Calculate a table that shows the mean and standard deviation of 
# length of cuckoo eggs for each host species.

aggregate(x = digits$egg_length, 
          by = list(digits$host_species),
          FUN = function(x) c(mean = mean(x),
                              sd = sd(x)))

c. Look at the graph and the table. For these data, would ANOVA 
be a valid method to test for differences between host species in 
the lengths of cuckoo eggs in their nests?
  
  d. Use ANOVA to test for a difference between host species in the 
mean size of the cuckoo eggs in their nests. What is your conclusion?
  
  e. Assuming that ANOVA rejected the null hypotheses of no mean 
differences, use a Tukey-Kramer test to decide which pairs of host 
species are significantly different from each other in cuckoo egg 
mean length. What is your conclusion?