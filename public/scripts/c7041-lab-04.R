## HEADER ####
## Who: Ed
## What: c7041 Lab 04
## Last edited: 2020-06-10
####


## CONTENTS ####
## 00 Setup
## Problems


## 00 Setup ####

setwd(r'(D:\Dropbox\WORK\__Harper Adams stuff\HARPER courses\_C7041 EDA Exp Design and Analysis\2021\labs\data)')


titanicData <- read.csv("titanic.csv" )
sex_survive_table <- table(titanicData$sex, titanicData$survive)
sex_survive_table

# manual
sex_survive_table_direct <- data.frame(no=c(156,708),
                                       yes=c(307,142), 
                                       row.names=c("female","male"))

mosaicplot(sex_survive_table)

mosaicplot(sex_survive_table, 
           color = c("darkred", "gold"), 
           xlab = "Sex", 
           ylab = "Survival")


sex_survive_fisher <- fisher.test(sex_survive_table)
sex_survive_fisher

sex_survive_fisher$estimate

sex_survive_fisher$conf.int

chisq.test(sex_survive_table)$expected

chisq.test(sex_survive_table, correct=FALSE)

fisher.test(sex_survive_table)

## Problems ####

# On April 18, 1940, most of the participants at a church 
# supper in Oswego County, NY, developed gastroenteritis 
# (a.k.a. food poisoning). In what has become a classic of 
# epidemiology, researchers interviewed most of the people 
# at the supper to discover which dishes they ate (CDC-EIS 2003). 
# Their answers are in the file “oswego.csv”. In this file, the 
# variable “ill” records whether that person got sick (Y for yes, N for no), 
# and there are also columns for whether each person ate the baked ham, 
# spinach, mashed potatoes, etc., for a total of 14 foods and drinks.

# a. Load the data set into R from the .csv file.

data <- read.csv('oswego.csv')

# b. Using table() and chisq.test()$expected, calculate the 
# expected values for a χ2 contingency test of the relationship 
# between fruit salad and illness. 

fs_ct <- table(data[ ,'fruit_salad'])
chisq.test(fs_ct)$expected

# Would it be legitimate to 
# use a χ2 contingency analysis to test this association? 

#A Yes

#   Why or why not? 

#A  because all expected values are > 5

#   What test would be best to use?

#A chi-squared contingency is fine

# c. You want to know which food is most strongly associated 
# with illness. For the sake of simplicity, let’s imagine 
# that we have ruled out all the other foods except for 
# spinach, baked ham, vanilla ice cream and chocolate ice 
# cream. Use fisher.test() to calculate an odds ratio for 
# the illness for each these foods. Which is the most likely 
# vehicle of the disease?

fruit <- table(data[ ,'fruit_salad'])
spinach <- table(data[,'spinach'])
ham <- table(data[,'baked_ham'])
vanilla <- table(data[,'vanilla_ice_cream'])
chocolate <- table(data[,'chocolate_ice_cream'])

mytab <-rbind(fruit, spinach, ham, chocolate, vanilla)

mosaicplot(mytab, 
           color = c("green4", "red"), 
           xlab = "Food", 
           ylab = "Get sick?")


# just icecream no difference
mytab <- rbind(vanilla, fruit)
fisher.test(mytab)


# icecream vs spinach
mytab <- rbind(vanilla, spinach)
fisher.test(mytab)


mosaicplot(mytab, 
           color = c("green4", "red"), 
           xlab = "Food", 
           ylab = "Get sick?")



# d. Using the food you think is the likely vehicle, 
# what is the 95% confidence interval of the odds ratio for illness?

# e. For the food you decided in part c is the most likely 
# vehicle, draw a mosaic plot to illustrate how many people 
# got sick as a function of whether they ate this food.

# (Researchers later determined that the person who had 
#   prepared the specific food that was associated with 
#   the gastroenteritis had a Staphylococcus infection, 
#   including a lesion on her hand [omg gross!]. The food 
#   in question had been left to sit overnight at room temperature,
#   which allowed the Staphylococcus to grow to dangerous numbers 
#   before the supper.)