## HEADER ####
## Who: Ed
## What: c7041 Lab 06
## https://dsgarage.netlify.app/c7041-labs/06-two-group-tests/
## Last edited: 2020-06-10
####


## CONTENTS ####
## 00 Setup
## Problems


## 00 Setup ####

setwd(r'(D:\Dropbox\WORK\__Harper Adams stuff\HARPER courses\_C7041 EDA Exp Design and Analysis\2021\labs\data)')

library(openxlsx)

digits <- read.xlsx("humanDigits.xlsx")

# 4 The ratio of the lengths of your second and fourth fingers 
# varies in humans (second digit and 4th digit, we will refer 
# to the lengths as 2D and 4D). The 2D:4D ratio 
# is influenced by the amount of testosterone that a human is 
# exposed to as a fetus during the period of gestation improtant 
# for finger growth and development. As such, we might predict 
# there to be a difference between males and females in the 2D:4D 
# ratio. Use these data to calculate the 2D:4D ratio (index 
# finger length divided by ring finger length) on the right 
# hands. The data come from Lolli et al. 2017 and are available 
# in the data file "humanDigits.xlsx". The dataset is in tidy 
# format, including a data dictionary.

# a. Make an appropriate graph to show the relationship between 
# sex and 2D:4D ratio of the right hand.

dig_rt <- digits[which(digits$hand == 'right'),]
dig_rt$ratio <- dig_rt$`2D.mm`/dig_rt$`4D.mm`

ggplot(dig_rt, aes(x = sex, y = ratio)) + 
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(position = position_jitter(0.15), cex = 1) + 
  theme_classic()

# b. Test for a difference in the mean 2D:4D ratio between 
# men and women.

library(car)
leveneTest(ratio~sex, data = dig_rt)
t.test(ratio~sex, data = dig_rt)

# c. What is the magnitude of the difference? Compute the 
# 95% confidence interval for the difference in means.

# 95 percent confidence interval:
#   -0.018811108 -0.004061492