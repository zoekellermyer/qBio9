#download data -- needs to be in same working directory (in qBio9, use "getwd() to find wd)
#name as object (bigger_dogs), read.csv() calls doc, NEEDS QUOTATION MARKS!
bigger_dogs <- read.csv("dogs_bigger.csv")

#checking if file is here
list.files()

#install packages
install.packages("ggplot2")
install.packages("ggrepel")
install.packages("cowplot")
install.packages("repr")

#need to load packages for use
library("ggplot2")
library("ggrepel")
library("cowplot")
library("repr")

#lm means linear model, makes linear regression; "fit" notes it as best fit line
fit <- lm(aod ~ weight,bigger_dogs)
summary(fit)
a <- coef(fit)["weight"]
b <- coef(fit)["(Intercept)"]


#below makes plot - NOTE: CHANGING COLOR OF LINE IS "colour = __" in geom_abline() function
options(repr.plot.width = 4,repr.plot.height = 4,repr.plot.res = 150)
p <- ggplot(bigger_dogs,aes(x = weight,y = aod,label = breed)) +
  geom_point(size = 2) +
  geom_text_repel() +
  geom_abline(slope = a,intercept = b,colour = "magenta", 
              linewidth = 1,linetype = "dashed") +
  labs(x = "body weight (lbs)",y = "longevity (years)") +
  theme_cowplot()

#makes plot
p
