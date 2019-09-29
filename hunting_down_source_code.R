library(gamlss)
library(tidyverse)
library(broom)

r1 <- gamlss(R ~ Fl+A+H+loc, family=NO, data=rent)
summary(r1)
augment(r1)

class(r1)

gamlss:::summary.gamlss


summary.gamlss

?summary.gamlss

augment.gamlss

?augment.gamlss

methods(augment) %>% 
  as.list() %>% 
  unlist() %>% 
  keep(~ grepl("glm", .))

getAnywhere(augment.glm)
showMethods(augment)

debugonce(augment)
augment(r1)