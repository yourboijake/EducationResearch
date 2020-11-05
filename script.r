#import dplyr to load data, employ mutate and filter functions
install.packages("dplyr")
library("dplyr")
View(states_all)

#remove missing data
data <- na.omit(states_all)
View(data)

#add Spending per student as a column to allow state-by-state comparison
data <- mutate(data, SPEND_PerStud = TOTAL_EXPENDITURE/ENROLL, 
               SUPPORT_PerStud = SUPPORT_SERVICES_EXPENDITURE/ENROLL)
View(data)

#import ggplot to observe data distribution
library("ggplot2")
ggplot(data = data) + geom_histogram(mapping = aes(x = AVG_MATH_4_SCORE), bins = 30)
ggplot(data = data) + geom_histogram(mapping = aes(x = AVG_READING_4_SCORE), bins = 30)
ggplot(data = data) + geom_histogram(mapping = aes(x = AVG_MATH_8_SCORE), bins = 30)
ggplot(data = data) + geom_histogram(mapping = aes(x = AVG_READING_8_SCORE), bins = 30)

#plot the math and reading scores to get a sense of distribution
boxplot(data[["AVG_MATH_4_SCORE"]], data[["AVG_READING_4_SCORE"]],data[["AVG_MATH_8_SCORE"]], 
        data[["AVG_READING_8_SCORE"]], horizontal = TRUE, 
        names = c("Ma4", "Re4", "Ma8", "Re8"))

#find mean SPEND_PerStud value to separate dataset into high-spend and low-spend states
avg_spend <- mean(data[["SPEND_PerStud"]])
high_spend <- filter(data, SPEND_PerStud > avg_spend)
low_spend <- filter(data, SPEND_PerStud <= avg_spend)
View(high_spend)
View(low_spend)

#one-sided t tests to see if  states with higher spending have better test scores
t.test(high_spend[["AVG_MATH_4_SCORE"]], low_spend[["AVG_MATH_4_SCORE"]], alternative = "greater")
t.test(high_spend[["AVG_MATH_8_SCORE"]], low_spend[["AVG_MATH_8_SCORE"]], alternative = "greater")
t.test(high_spend[["AVG_READING_4_SCORE"]], low_spend[["AVG_READING_4_SCORE"]], alternative = "greater")
t.test(high_spend[["AVG_READING_8_SCORE"]], low_spend[["AVG_READING_8_SCORE"]], alternative = "greater")


data <- mutate(data, lnMA4 = log(AVG_MATH_4_SCORE), lnMA8 = log(AVG_MATH_8_SCORE), 
               lnRE4 = log(AVG_READING_4_SCORE), lnRE8 = log(AVG_READING_8_SCORE),
               lnSPEND = log(SPEND_PerStud))

#use scatterplot to visualize relationship
ggplot(data = data) + geom_jitter(mapping = aes(x = SPEND_PerStud, y = AVG_MATH_4_SCORE))
ggplot(data = data) + geom_jitter(mapping = aes(x = SPEND_PerStud, y = AVG_MATH_8_SCORE))
ggplot(data = data) + geom_jitter(mapping = aes(x = SPEND_PerStud, y = AVG_READING_4_SCORE))
ggplot(data = data) + geom_jitter(mapping = aes(x = SPEND_PerStud, y = AVG_READING_8_SCORE))

#regression analysis to explore relationship between spending and test scores
lmodel <- lm(data[["AVG_MATH_4_SCORE"]] ~ data[["SPEND_PerStud"]])
summary(lmodel)
lmodel <- lm(data[["AVG_MATH_8_SCORE"]] ~ data[["SPEND_PerStud"]])
summary(lmodel)
lmodel <- lm(data[["AVG_READING_4_SCORE"]] ~ data[["SPEND_PerStud"]])
summary(lmodel)
lmodel <- lm(data[["AVG_READING_8_SCORE"]] ~ data[["SPEND_PerStud"]])
summary(lmodel)
