# Generate normal data with known parameters
rnorm_fixed <-  function(N, mu = 0, sd = 1) scale(rnorm(N)) * sd + mu

# Wide format (sort of)
#y = rnorm_fixed(50, mu=0.3, sd=2)  # Almost zero mean.
y = c(rnorm(15), exp(rnorm(15)), runif(20, min = -3, max = 0))  # Almost zero mean, not normal
x = rnorm_fixed(50, mu = 0, sd = 1)  # Used in correlation where this is on x-axis
y2 = rnorm_fixed(50, mu = 0.5, sd = 1.5)  # Used in two means

# Long format data with indicator
value = c(y, y2)
group = rep(c('y1', 'y2'), each = 50)

# Be explicit about the underlying linear model by hand-dummy-coding:
group_y2 = ifelse(group == 'y2', 1, 0)  # 1 if group == y2, 0 otherwise

a = t.test(y, y2, var.equal=FALSE)
a1 = t.test(y, y2)



# As linear model with per-group variances
b = nlme::gls(value ~ 1 + group_y2, weights = nlme::varIdent(form=~1|group), method="ML")

summary(lm(value ~ 1 + group_y2))
