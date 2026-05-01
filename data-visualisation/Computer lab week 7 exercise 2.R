#  Exercise 2. More ANOVA examples 

#  Read in the data

snails <- read.csv("Snails1.csv", stringsAsFactors = TRUE)

#  We have placed sea snails in a climate controlled environment.
#  The research question is to understand how changes in water temperature
#  impact the amount of time snails spend active in a 12 hour window.

#  From the str() and summary() and head() commands we can see that there are two columns 
#  of data.  We have a character (string) variable "Treatment" that has four levels
#  The levels are different water temperatures. "14 degree C" etc.
#  For each temperature there are 30 observations. 

str(snails)
#  What issue do you see?
#  can you edit the read in code to make Treatment a factor?

summary(snails)
head(snails)

#  Previously we looked at the group means and group variances (sd) using the Pivot table
#  function.  The Pivot tabel in Excel is a really useful function for this work. 
#  Yoou can also do this directly in R using the 'tapply' command.

with(snails,tapply(Active.time,Treatment, mean))
with(snails,tapply(Active.time,Treatment, sd))

#  The first step in the analysis is to create a boxplot.
#  Note again how the boxplot command differs from boxplots that you saw in earlier labs

boxplot(Active.time~Treatment, data = snails)

#  Depending on your plot window size you may not see all the group labels
#  If you use the option to copy the figure to the clipboard you will see
#  that you can adjust the size so that all labels can be seen

#  The time active is in minutes per 12 hours. 
#  (i)   add a y-axis label to your plot to say 'time active (mins)'
#  (ii)  add a title to say 'sea snail temperature experiment'
#  (iii) make the box width slighly thinner (boxwex)
#  (iv)  fill the boxes with the colour grey

#  Based on the plot (i)  do you think the group variances are equal?
#                    (ii) do you think the group means are equal?

#  What are the null and alternate hypothesis for the test of equal group variances?

#  Conduct the Bartlett test for equal group variances

with(snails, bartlett.test(Active.time~Treatment))

#  The p-value (1.693e-06) is less than 0.05, therefore we reject the null of 
#  equal variance across the groups.

#  Note that for small p-values we typically just report p-value < 0.001 rather 
#  than p-value = 1.693e-06 


#  We now conduct our ANOVA test.

#  What are the null and alternate hypothesis for the ANOVA test?

#  Implement the test using the one.way function, and unequal variance

with(snails,oneway.test(Active.time~Treatment, var.equal=FALSE ))

#  The p-value is < 0.001, therefore we reject the null hypothesis that the 
#  the group means are all the same.

#  For the pairwise t-tests, we also set pooled.sd to FALSE to reflect that  
#  we have unequal group variances 

with(snails,pairwise.t.test(Active.time,Treatment, pool.sd=FALSE))

#  From the results table we conclude:

#  14 degrees is different to 18 degrees (p-value <0.001)
#  14 degrees is different to 22 degrees (p-value <0.001)
#  14 degrees is not different to 26 degrees (p-value = 0.9)

#  18 degrees is different to 22 degrees (p-value <0.001)
#  18 degrees is different to 26 degrees (p-value <0.001)

#  22 degrees is different to 26 degrees (p-value <0.001)


#############################################################
#
#                         .----.   @   @
#                        / .-"-.`.  \v/
#                        | | '\ \ \_/ )... bloop!
#                      ,-\ `-.' /.'  /
#                     '---`----'----'
#
################################################################
