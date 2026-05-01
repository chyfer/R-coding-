
########################################################

# Power --Single sample test.

###########################  Environmental regulation example #####################

#  The EPA has defined the natural water EC level in an area as 850 EC units.

#  The environmental conditions on a mining licence specify that 
#  if there is a change in the EC level of 100 units
#  there will be an intervention.

#  It is thought that the population standard deviation for EC measurements
#  in the estuary is 150.

#  I want to be able to detect a change of 100 EC units in the stream.
#  Q. How many sample do I need to collect if I need test power to be at least 0.80
#  and alpha is 0.05.

#  We just plug in the values to the power calculator

power.t.test(n = , delta = 100, sd = 150, sig.level = 0.05,
             power = 0.8,
             type = "one.sample")

#  From the output I can see we need 20 samples. (round up)
#  Can you see where the value comes from in the test output.

#  Let's say i can only collect 12 samples, how much power will i have
#  to detect the change?


power.t.test(n = 12, delta = 100, sd = 150, sig.level = 0.05,
             power = ,
             type = "one.sample")

#  My test power is now modest (0.56).  This means there could be a true change in
#  conditions of 100 EC units and i might not identify this change.

#  Say the threshold for an effect to be biologically important for the
#  the fish in the estuary is 50 EC units.

#  What sample do I need to detect a change of 50 EC units with power of 0.90?


power.t.test(n = , delta = 50, sd = 150, sig.level = 0.05,
             power = 0.9,
             type = "one.sample")

# I need a sample of 97 observations 

######################################################

##  Test Power: two sample example #######

#########  Energy intake example ######################

#  I have looked at a number of other studies on calorie intake and I 
#  have an estimate of the mean number of calories a person purchases
#  as part of a fast food meal; which is 3,000 KJ.

#  I also have an estimate of the sd of energy content of purchases which is 280KJ

#  I think that an intervention policy will be meaningful if it results in an average reduction
#  in calorie intake of 300KJ per fast food mal purchase.

#  The significance level (alpha) I am working with is 0.05

#  Unless my test power is 80% it is not worth undertaking the experiment.

#  To recruit a person to my survey costs $10, and i have a budget of $1,000.

#  The question is should we undertake the 
#  experiment that will have two treatment conditions.

#  For this example we find the required sample size as: 

power.t.test(n = , delta = 300, sd = 280, sig.level = 0.05,
             power = 0.8,
             type = "two.sample")

#  The test result says that: 
#  I need only need a sample of 30 (15 in each group as you round up)

#  The research committee revises guideines suggesting that unless power is 0.90 they will not fund the study
#  How many participants do we need in each group?  Remember to round up.

power.t.test(n = , delta = 300, sd = 280, sig.level = 0.05,
             power = 0.9,
             type = "two.sample")

#  Let us now turn the question around.

#  SaY I know my budget is $1,000, so i can get 50 consumers in each group.
#  How much power do i have to detect a difference?

power.t.test(n =50 , delta = 300, sd = 280,  sig.level =0.05 , power = , type = c("two.sample")) 

#  The power calculation is almost one
#  So, if I spend all my budget I can be quite certain that 
#  if there really is a difference of at least 300 units
#  I will be able to detect the difference. 

#  High power does not mean that you will find a difference!!!!!!

#  High power just means that if there is
#  a difference you have a good chance of detecting the difference.

#  Assume, however, that a difference of 100KJ is meaningful from a 
#  biological/ policy persective.  Here my power to detect
#  such a difference, assuming I allocate all my budget would be?

power.t.test(n =50 ,  delta = 100, sd = 280 , sig.level =0.05 , power = , type = c("two.sample")) 

#  The result is that Power is only 0.42.  Do you think that is acceptable from
#  a research design perspective?  Do you understand what you nee to change to increase
#  the power of the tests?  You can always edit the default values and see what happens.
#  Also make sure you understand what the values in the otput imply. 

#  If i want to work out what difference I can detect with power 0.80
#  and sample size 50 (each group) and sig.level =0.05 I can use the following 

power.t.test(n =50 , delta = , sd = 280 , sig.level =0.05 , power =0.8 , type = c("two.sample")) 

#  The detectable difference is 158.4KJ
#  make sure you understand where this value comes from.

#### Paired design ##############

#  Let my policy intervention be to provide information
#  on the energy content of the food people buy.

#  Now, let me redesign the experiment such that I get one measurement 
#  on consumer choices with information on KJ content and one measurement  
#  without information on KJ content such that I have a paired design.
#  I now have to pay each consumer $20 (one for each measurement)

#  What is the power of my test for this revised design?

power.t.test(n =50 , delta = 100, sd = 280 , sig.level =0.05 , power = , type = c("paired")) 

#  You can see that i have been able to increase the power of the test 
#  substantially by revising the experimental design.
#  power = 0.6969614.

#  If you can get a paired design you control unplanned variation
#  If you control unplanned variation you can increase the chance
#  of finding a difference if a difference exists.

#  We can also spin the question around to be
#  If i maintain that power must be 0.80, what is the max effect i can
#  detect?

power.t.test(n =50 , delta = , sd = 280 , sig.level =0.05 , power =0.8 , type = c("paired")) 

#  So the detectable difference is 113.2 KJ
#  Recall that the detectable difference with the two sample test was 158.4KJ

#  This gives you some idea of the gains that can be achieved if you can work out a
#  paired example.

#  when you move on to conducting your own experiments it is important that you
#  understand the concept of test power


###############################################################
#       __
#      /
#   .-/-.               ... if you look hard it does look
#   |'-'|
#   |   |                       like a burger, fries & coke...
#   |   |   .-""""-.
#   \___/  /' .  '. \   \|/\//
#         (`-..:...-')  |`""`|
#          ;-......-;   |    |
#           '------'    \____/
#
#######################################################

