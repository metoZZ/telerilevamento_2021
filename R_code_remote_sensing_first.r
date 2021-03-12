# il mio primo codice in R per il Telerilevamento!

install.packages("raster") #funzione per installare un pacchetto, in questo caso raster è esterno quindi mettiamo le virgolette

setwd("~/lab/") #linux

library(raster) #richiama il pacchetto raster, dato che lo abbiamo prima installato non mettiamo le virgolette

p224r63_2011 <- brick("p224r63_2011_masked.grd") #richiamo l'immagine e la associo ad un oggetto
p224r63_2011 #mostra cosa c'è dentro il file

plot(p224r63_2011) # funzione per visualizzare le diverse bande

