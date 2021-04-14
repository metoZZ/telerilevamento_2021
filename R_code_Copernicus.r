# visualizing Copernicus
# scarichiamo l'indice che ci interessa sul sito di Copernicus, io ho scaricato l'indice del lago

# lezione 12 mer 14 apr
library(raster)
install.packages("ncdf4")
library(ncdf4)
setwd("~/lab/")
lake <- raster("c_gls_LSWT_202103110000_GLOBE_SLSTRAB_v1.1.0.nc") # associamo il nome al file della variabile
lake # vediamo le caratteristiche del file
plot (lake)
lakeres <- aggregate(lake,fact=100) # resampling, ricampioniamo la variabile perchè è molto grande, 100*100=1 pixel
plot(lakeres)
