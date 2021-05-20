###
### Infant - Aggression Data Exploration
###

#   Goals:
#   - Propose a general question
#   - Decide on response variable --> infant involvement in aggression at 13 or 15 months
#   - Identify and describe potential pitfalls

#   Question: Are there variables which predict the involvement of infants in aggression later in life?

'Packages'
library(tidyverse)
library(ggplot2)

'Import Data using GitHub permalink to "master" branch'
monkey_agg <- read.csv("~/Desktop/R_Projects/EVE298_LMM_GroupProj/data/Infant_Conflict_Data_W_O_NAs_20210519.csv", header = TRUE)
head(monkey_agg)
str(monkey_agg)
summary(monkey_agg)

# changing matriline to factor
monkey_agg$fMatriline <- as.factor(monkey_agg$Matriline)
monkey_agg$fInfant.ID <- as.factor(monkey_agg$Infant.ID)
monkey_agg$fSex <- as.factor(monkey_agg$Sex)
monkey_agg$fMom.mpvspp <- as.factor(monkey_agg$Mom.mpvspp)

### Data Exploration ----
# > Predictor Variables ----
# .. Mom's aggressive interactions ---- 
# Looking at distribution of mom's involvement with aggression (w/ baby)
#  - Noticed that the mean ratio was below 1 for both instigating and receiving
#  - This means less than one (or two?) aggressive interactions per day (within observation period)

hist(monkey_agg$Mom.inv.1to4.i) # skewed because of one outlier at 3.5+ aggressive interactions per day
dotchart(monkey_agg$Mom.inv.1to4.i) # not a good starry night
hist(monkey_agg$Mom.inv.1to4.r) # also skewed, but not just because of one outlier (like with Mom initiating)
dotchart(monkey_agg$Mom.inv.1to4.r) # looks ok!
'the outliers for Mom.inv.1to4.i and Mom.inv.1to4.r are not the same
individuals: Tamar (mom of Terra) and Cambridge (mom of Camden)'

# .. Infant exposure to aggression ----
hist(monkey_agg$Exp.1to4.i) # skewed because of one outlier at 1.5 aggressive interactions per day
dotchart(monkey_agg$Exp.1to4.i) # ok starry night, but one outlier
hist(monkey_agg$Exp.1to4.r) # also skewed, but not just because of one outlier, just descending frequencies from 0 to 1.2
dotchart(monkey_agg$Exp.1to4.r) # looks ok, except for that one outlier
'Outlier for Exp.1to4.i is Terra, child of Tamar
Outlier for Exp.1to4.r Quidditch, child of Queena'

# > Response Variables ----

hist(monkey_agg$Inv.i.15) # ok, slightly skewed
dotchart(monkey_agg$Inv.i.15) # also ok, but two outliers
hist(monkey_agg$Inv.i.13) # skewed
dotchart(monkey_agg$Inv.i.13) # good! Nice even distribution.
hist(monkey_agg$Inv.i.10) # skewed
dotchart(monkey_agg$Inv.i.10) # whaaat? Lots of zeros, then a kind of upward trend?
'Month 10 was pulled at a separate time, so something happened on the human end
that caused a ton of zero values.

MONTH 13 is the response variable of choice because it has a good spread.'


### Building the Model ----







