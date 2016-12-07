library(readr)
library(tidyr)
library(lubridate)
library(dplyr)

###################################################################################################
# Read coupon_list_processed.csv
coupon_list_processed <- read.csv("C:/Users/gvenk/Desktop/data/Coupon Purchase Prediction/coupon_list_processed.csv", header = T)
head(coupon_list_processed)
str(coupon_list_processed)
summary(coupon_list_processed)

# Fix VALIDPERIOD error where valid should be VALIDEND minus VALIDFROM plus one!
coupon_list_processed$validperiod <- coupon_list_processed$validperiod + 1


# Convert the usable_date columns to factor
coupon_list_processed[,13] <- as.factor(coupon_list_processed[,13])
coupon_list_processed[,14] <- as.factor(coupon_list_processed[,14])
coupon_list_processed[,15] <- as.factor(coupon_list_processed[,15])
coupon_list_processed[,16] <- as.factor(coupon_list_processed[,16])
coupon_list_processed[,17] <- as.factor(coupon_list_processed[,17])
coupon_list_processed[,18] <- as.factor(coupon_list_processed[,18])
coupon_list_processed[,19] <- as.factor(coupon_list_processed[,19])
coupon_list_processed[,20] <- as.factor(coupon_list_processed[,20])
coupon_list_processed[,21] <- as.factor(coupon_list_processed[,21])


str(coupon_list_processed)

# Convert the relevant  columns to date format
coupon_list_processed[,7] <- ymd_hms(coupon_list_processed[,7])
coupon_list_processed[,8] <- ymd_hms(coupon_list_processed[,8])
coupon_list_processed[,10] <- ymd(coupon_list_processed[,10])
coupon_list_processed[,11] <- ymd(coupon_list_processed[,11])
str(coupon_list_processed)
head(coupon_list_processed)

# There are several missing values in usable_date columns. Assuming all
# missing values to mean that coupon is usable for all days.

for(i in 13:21) {
  na_index <- which(is.na(coupon_list_processed[,i]))
  coupon_list_processed[,i][na_index] <- 1
}
summary(coupon_list_processed)

###################################################################################################
# Read user_list.csv
user_list <- read.csv("C:/Users/gvenk/Desktop/data/Coupon Purchase Prediction/user_list.csv", header = T, na.strings = c("","NA"))
head(user_list)
str(user_list)
summary(user_list)

user_list$REG_DATE <- ymd_hms(user_list$REG_DATE)
user_list$WITHDRAW_DATE <- ymd_hms(user_list$WITHDRAW_DATE)

###################################################################################################
# Read coupon_visit.csv
coupon_visit <- read.csv("C:/Users/gvenk/Desktop/data/Coupon Purchase Prediction/coupon_visit_train.csv", header = T, na.strings = "")

summary(coupon_visit)
coupon_visit$I_DATE <- ymd_hms(coupon_visit$I_DATE)

