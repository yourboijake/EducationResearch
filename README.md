## Summary:
There exists substantial debate about the role that spending on education impacts the ability of student to succeed. While some argue that increased spending is an important way to improve educational outcomes, others argue that spending is not an effective tool, and that educational institutions should pursue other strategies to help their students.
The topic of spending in education has become a significant component of the public policy debate regarding education policy, and must be addressed. In order to understand the potential for increased spending to improve performance, we must assess school performance on the basis of spending, and see if increased spending leads to better student outcomes. This will allow us to identify whether or not increasing spending is a worthy public policy goal.

## Data Gathering and Preparation:
The dataset used for this research project comes from [this resource](https://www.kaggle.com/noriuk/us-education-datasets-unification-project), a Kaggle dataset compiled from data provided by the National Center for Education Statistics, the US Census Bureau, and the NAEP National Report card.
The dataset provides information regarding spending, student enrollment, and student test scores in reading and math for all US states from 1992 to 2015. In total, the dataset contains 1,715 observations across 25 fields, for a total of 42,825 data points.
Firstly, I dropped observations with missing values, which removed all observations prior to 2003, as these observations had some missing data points. I then generated spending per student datafields to allow for comparisons across states.
This yielded the dataset that I used for the hypothesis testing and linear regression analysis. Summary statistics and data visualizations for this dataset are shown in the figures folder. For images showing the distribution of student performance and spending per student, see figures 1-6.

## Hypothesis Testing and Linear Regression:
To evaluate whether or not increased spending improves student test performance, I began by asking a simpler question: do schools with higher spending per student outperform schools with lower spending per student? To answer this question, I split the dataset into two subgroups: observations with spending levels below the mean, and observations with spending levels above the mean, then tested the hypothesis that those above the mean have better test outcomes across the following four categories: 4th Grade reading scores, 4th Grade math scores, 8th Grade reading scores, and 8th Grade math scores. 
In each of these tests, the higher-spending schools had better test scores than lower spending scores, with p values well below the threshold of 0.05.

To move on to the more complicated question of what role spending plays in determining student outcomes, I ran several linear regressions, using spending as an independent variable and test scores as a dependent variable. Each regression shows a very modest positive coefficient for


## Conclusions:
Several conclusions can be derived from these analyses:
* High-spending schools outperform low-spending schools
* The relationship between spending and performance follows a concave parabola, meaning that moderately high spending schools outperform both low spending and very high spending schools
* School spending accounts for very little of the variance in student outcomes
* Because student outcomes tend to have only a weak relationship with spending, increased spending is unlikely to be the optimal policy for improving student performance
