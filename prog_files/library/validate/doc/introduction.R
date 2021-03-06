## ----echo=FALSE---------------------------------------------------------------
library(validate)

## -----------------------------------------------------------------------------
data(women)
summary(women)

## -----------------------------------------------------------------------------
library(validate)
cf <- check_that(women, height > 0, weight > 0, height/weight > 0.5)
summary(cf)

## ----eval=FALSE---------------------------------------------------------------
#  women %>% check_that(height > 0, weight > 0, height/weight > 0.5) %>% summary()

## -----------------------------------------------------------------------------
barplot(cf,main="Checks on the women data set")

## -----------------------------------------------------------------------------
women1 <- women
rules <- validator(height == women_reference$height)
cf <- confront(women, rules, ref = list(women_reference = women1))
summary(cf)

## -----------------------------------------------------------------------------
rules <- validator( fruit %in% codelist )
fruits <-  c("apple", "banana", "orange")
dat <- data.frame(fruit = c("apple","broccoli","orange","banana"))
cf <- confront(dat, rules, ref = list(codelist = fruits))
summary(cf)

## -----------------------------------------------------------------------------
v <- validator(height > 0, weight > 0, height/weight > 0)
v

## -----------------------------------------------------------------------------
cf <- confront(women,v)
cf

## -----------------------------------------------------------------------------
summary(cf)

## -----------------------------------------------------------------------------
v <- validator(
  BMI := (weight*0.45359)/(height*0.0254)^2
  , height > 0
  , weight > 0
  , BMI < 23
  , mean(BMI) > 22 & mean(BMI) < 22.5
)
v

## -----------------------------------------------------------------------------
cf <- confront(women,v)
summary(cf)

## -----------------------------------------------------------------------------
df <- data.frame(
  rule = c("height>0","weight>0","height/weight>0.5")
  , label = c("height positive","weight positive","ratio limit")
)
v <- validator(.data=df)
v

## -----------------------------------------------------------------------------
cf <- confront(women, v)
quality <- as.data.frame(cf)
measure <- as.data.frame(v)
head( merge(quality, measure) )

## -----------------------------------------------------------------------------
merge(summary(cf),measure)

## ----eval=FALSE---------------------------------------------------------------
#  ?syntax

## -----------------------------------------------------------------------------
cf <- check_that(women, height>0, weight>0,height/weight < 0.5)
aggregate(cf) 

## -----------------------------------------------------------------------------
head(aggregate(cf,by='record'))

## -----------------------------------------------------------------------------
# rules with most violations sorting first:
sort(cf)

## -----------------------------------------------------------------------------
v <- validator(hite > 0, weight>0)
summary(confront(women, v))

## ----eval=TRUE, error=TRUE----------------------------------------------------
# this gives an error
confront(women, v, raise='all')

## -----------------------------------------------------------------------------
v <- validator(rat = height/weight > 0.5, htest=height>0, wtest=weight > 0)
names(v)

## -----------------------------------------------------------------------------
names(v)[1] <- "ratio"
v

## -----------------------------------------------------------------------------
# add 'foo' to the first rule:
meta(v[1],"foo") <- 1
# Add 'bar' to all rules
meta(v,"bar") <- "baz"

## -----------------------------------------------------------------------------
v[[1]]

## -----------------------------------------------------------------------------
meta(v)

## -----------------------------------------------------------------------------
summary(v)

## -----------------------------------------------------------------------------
variables(v)
variables(v,as="matrix")

## -----------------------------------------------------------------------------
v[c(1,3)]
v[c('ratio','wtest')]

## -----------------------------------------------------------------------------
v[[1]]

