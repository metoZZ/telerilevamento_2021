# R_code_multivariate_analysis.r
# lezione 14 ven 23 apr

library(raster)
library(RStoolbox)
setwd("~/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
