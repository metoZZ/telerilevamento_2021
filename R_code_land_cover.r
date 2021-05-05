#R_code_land_cover.r

# richiamiamo le librerie che ci servono
library(raster)
library(RStoolbox) # per la classificazione
# install.packages("ggplot2")
library(ggplot2)
# install.packages("gridExtra")
library(gridExtra)

setwd("~/lab/") # settiamo la cartella di lavoro

defor1 <- brick("defor1.png")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
ggRGB(defor1,r=1, g=2, b=3, stretch="lin") # potenziamo il plot con la funzione ggRGB, tipo aggiunge le coordinate

defor2 <- brick("defor2.png")
plotRGB(defor2, r=1,g=2,b=3,stretch="lin")
ggRGB(defor2,r=1, g=2, b=3, stretch="lin")

#plottiamo tutte due le immagini con plotRGB
par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# install.packages("gridExtra")
# library(gridExtra)
# serve per il multiframe con ggplot2 e gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)
 

