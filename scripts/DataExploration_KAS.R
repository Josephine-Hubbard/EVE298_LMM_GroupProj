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
monkey_agg <- read.csv("https://github.com/1010sheehy/EVE298_LMM_GroupProj/blob/b2eaae7060260484ea3525a567655eaa8ceac566/data/MASTER_Infant_Conflict_DataSet_03.01.19Version_ForEVE298.xlsm%20-%20All%20data%20with%20NAs.csv", header = TRUE)
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

# .. Infant exposure to aggression ----
hist(monkey_agg$Exp.1to4.i) # skewed because of one outlier at 1.5 aggressive interactions per day
dotchart(monkey_agg$Exp.1to4.i) # not a good starry night! Looks trumpet-y to me
hist(monkey_agg$Exp.1to4.r) # also skewed, but not just because of one outlier, just 
dotchart(monkey_agg$Exp.1to4.r) # looks ok!



### Building the Model ----

'| Structure | Variable | Type        | # levels | Experiment Unit |
 |-----------|----------|-------------|----------|-----------------|
 | Treatment | LNLENGTH | Categorical | 24       | rep:gen         |
 | Design    | rep      | Categorical | 3        |                 |
 |           | block    | Categorical | 18       |                 |
 | Response  | AFD      | Numeric     | 72       |                 |'





