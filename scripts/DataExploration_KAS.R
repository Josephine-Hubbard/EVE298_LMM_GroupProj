###
### Infant - Aggression Data Exploration
###

#   Goals:
#   - Propose a few general questions
#   - Decide on response variable
#   - Identify and describe potential pitfalls

'Install Packages'
library(tidyverse)
library(ggplot2)

'Import Data using GitHub permalink to "master" branch'
monkey_agg <- read.csv("https://raw.githubusercontent.com/1010sheehy/EVE298_LMM_GroupProj/master/data/Infant_Conflict_Data_W_O_NAs.csv", header = TRUE)
str(monkey_agg)
summary(monkey_agg)

### Exploratory Figures ----
# > Mom's aggressive interactions ---- 
# Looking at distribution of mom's involvement with aggression (w/ baby)
#  - Noticed that the mean ratio was below 1 for both instigating and receiving
#  - This means less than one (or two?) aggressive interactions per day

ggplot(data = monkey_agg,
       aes(y = Exp.1to4.i)) +
  geom_boxplot()

'Notes from looking at data:

Exp.1to4.i is predominantly below one, with only one outlier having close to 1.5
aggressive interactions per day. During the observation periods, initiating
aggressive acts happens less than once a day.'