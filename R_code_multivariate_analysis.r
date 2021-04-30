# R_code_multivariate_analysis.r
# lezione 14 ven 23 apr

library(raster)
library(RStoolbox)
setwd("~/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd") #richiamiamo il fle e gli associamo un nome
p224r63_2011 # vediamo le caratteristiche del file
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)


# lezione 15 mer 28 apr
library(raster)
library(RStoolbox)
setwd("~/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd") #richiamiamo il fle e gli associamo un nome
p224r63_2011 # vediamo le caratteristiche del file
pairs(p224r63_2011) #correlazione di tutti i valori di tutte le bande
p224r63_2011res <- aggregate(p224r63_2011, fact=10)# Ricampionamento - resampling, aggreghiamo di un fattore lineare di 10 i pixel, aumentando così la dimensione dei pixel e diminuendo il "peso" dell'immagine, diminuiamo la risoluzione dell'immagine

par(mfrow=c(2,1)) # confrontiamo le due immagine: quella originale 30*30 m  e quella ricampionata 300*300 m
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")

p224r63_2011res_pca <- rasterPCA(p224r63_2011res) # prende il nostro pacchetto di dati e va a compattarlo in un numero di minore di bande

summary(p224r63_2011res_pca$model) # summary è una funzione base generica, in questo caso ci da un sommario ad esempio del modello della nostra immagine res_pca

plot(p224r63_2011res_pca$map) # plottiamo la mappa delle PCA, ci indicano dove si trova la maggiore varianza tra le bande

dev.off()
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin") # immagine risultante dalle 3 componenti principali
