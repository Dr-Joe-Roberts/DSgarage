## HEADER ####
## Who: Ed
## What: c7041 Lab 09
## https://dsgarage.netlify.app/c7041-labs/06-two-group-tests/
## Last edited: 2020-06-10
####


## CONTENTS ####
## 00 Setup
## Problems


## 00 Setup ####

setwd(r'(D:\Dropbox\WORK\__Harper Adams stuff\HARPER courses\_C7041 EDA Exp Design and Analysis\2021\labs\data)')

library(openxlsx)

mam <- read.csv("biogeogMammals.csv")
table(mam$status)
