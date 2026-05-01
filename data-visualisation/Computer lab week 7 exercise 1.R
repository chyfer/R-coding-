#  Exercise 1. ANOVA and multiple comparisons 

#  When we have multiple groups we start with an ANOVA test, and then move on to 
#  a 'family' of formal t-tests on the individual groups.

#  The fish1 data file contains measurements on the weight at harvest for three 
#  different strains of Tilapia.  The strains are under consideration as part
#  of an aquaculture project to decrease the pressure on wild fish stocks.

#  The three Tilapia strains are all new strains that have been developed as part 
#  of an industry funded fish breeding program.  The researcher is interested in 
#  identifying which of the  strains has the highest average yield (weight). The fish  
#  strain with the highest average yield will then be used in a large scale trial.

#  Read in the data and have a look at what you have:

fish <- read.csv("fish1.csv", stringsAsFactors = T)

str(fish)   

#  The summary tells us we have a factor variable "Strain" with 3 levels.
#  The three levels of the factor are our three fish varieties A, B, and C.
#  Note: if your variable shows up as a 'character' variable, you can run the command
#       fish$Strain <- as.factor(fish$Strain)
#  to turn it into a factor variable

#  We also have matching values in the weight column of the data.
#  The values in the weight column record the yield in kg per fish.

# We can see the data is in long format from:

head(fish)

#  Our boxplot formula plots the data in the result column grouped by treatment (our three varieties) 
#  Note that the formula is different to when we had several individual columns of data!
#  Which bit is different from the earlier boxplot command we saw?

with(fish,boxplot(weight~Strain)) 

#  Our boxplot tells us that Strain A might be different 
#  to Strain B but there are no striking differences   

#  edit the box plot so that it includes:
#  (i)   y-axis and x-axis labels
#  (ii)  thinner box width (boxwex)
#  (iii) ylim range is 0-5

#########################################################################

#  As we have multiple groups, we use a test to establish
#  whether or not it is OK to assume constant variance for each group

#  There are many options for testing the constant variance assumption
#  I found a review paper that had 14 different test options!

#  With these tests the null is that the variance of each group is the same.
#  With a low p-value we reject the null of equal variance across the groups

#  Although there are many options we will just use one test

####  Constant variance test with multiple groups: the Bartlett test

#  Formally the test relies on the chi-square distribution and  
#  the way log based index numbers for dispersion can be calculated.

#  If there are large differences in the variance of each group,
#  the test statistic will be a large number.

#  When the test statistic is large the p-value is low and
#  we reject the null of equal group variance.

#  Formally we set up a Null hypothesis and Alternate hypothesis as:

#  Null: The group variances are all equal
#  Alternate: The group variances are not equal

#  Set alpha at 0.05 (which controls the type I error rate) 

#  The formula for the test says look at the weight column and these values
#  are grouped by the value listed in the Strain column.

with(fish,bartlett.test(weight~Strain))

#  The test p-value (0.7769) is greater than 0.05, therefore we do not reject the null of 
#  equal variance across the groups.  

#  STOP.  Look at the boxplot.  Are you surprised by the test result?

#  If we actually look directly at the boxplot we can see the distributions are pretty similar.
#  It should not be surprising that we do not reject the null of equal group variances.

#  We now conduct our ANOVA test.
#  We implement the test using the oneway.test() function 'oneway" stands for one way ANOVA.

#  We will use the test format that uses the equal group variance assumption 
#  (because we did not reject the null for the bartlett test)

#  Formally we need a Null and Alternate hypothesis

#  Null: the group means are all the same
#  Alternate:  at least one of the group means is different

#  Next we set the alpha level at 0.05.

with(fish,oneway.test(weight~Strain, var.equal=TRUE))

#  The null for the ANOVA test is that the mean for each group is the same
#  The p-value = 0.005597 is <0.05, therefore we reject the null.
#  We conclude that there is at least one difference in the groups.  

#  From the boxplot it was hard to be sure there was a difference.
#  The formal test confirms there is actually a difference

#  As we have multiple comparisons we need to be aware of the impact 
#  of multiple comparisons on the Type 1 error rate for t-tests. 

#  When using the pairwise.t.test() command it includes 
#  an automatic adjustment for multiple comparisons.

#  There is no single correct adjustment for multiple comparisons.
#  The default option with the pairwise.t.test is the 'Holm' adjustment.
#  This adjustment is fine as an option to use unless otherwise directed.

#  We implement the multiple comparison test as follows. 
#  Because we did not reject the null of equal group variances we set the pooled sd to TRUE.
#  This is the same as setting var.equal = TRUE in the t.test() formula.

#  What is an appropriate null and alternate hypothesis for the t-test?

with(fish, pairwise.t.test(weight,Strain, pool.sd = TRUE))

#  As the comparisons are symmetric, only results are printed in the the lower triangle

#  The table gives the summary p-values for the pair-wise tests
#  The results of the adjusted t-test say:
#  (i)   Strain A is different to Strain B (p-value = 0.004)
#  (ii)  Strain A is not different to Strain C (p-value = 0.16)
#  (iii) Strain B is not different to Strain C (p-value = 0.16)

#  There are other adjustment options for multiple comparison testing, 
#  including no adjustment at all!
#  It is however safe to alway use the Holm adjustment (which is the default)

###########################################################################
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#          .               `         /
#                           .    ,../...       .
#           .                .  /       `\  /  .
#      \    .        o         < '  )     =<
#      /\  .                    \ \      /  \   .  __
#    >=)'>                       `'\'"'"'         /o \/
#      \/ .    /         o              /,        \__/\    .:/
#      /   .  /--\ /         /         <')=<     .      ,,///;,   ,;/
#            <o)  =<      . / \         \`         .   o:::::::;;///
#             \__/ \       <')_=<                     >::::::::;;\\\
#              \            \_/            .            ''\\\\\'' ';\
#     (                      \              .   __
#      )                                       <'_><          (
#     (          (                ,/..          `              )
#      )     (    )             <')   `=<                )    (
#     (       )  (               ``\```                 (      )  source: chris.com
# _____)_____(____)______________________________________)____(_______
#
#########################################################################################
