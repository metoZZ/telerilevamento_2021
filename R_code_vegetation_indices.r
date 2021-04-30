# R_code_vegetation_indices.r
# lezione 16 mer 28 apr
# analisi della deforestazione in amazzonia, immagini derivano dalla Nasa

library(raster) # richiamo dei pacchetti che useremo
setwd("~/lab/") # settaggio della cartella di lavoro

defor1 <-brick("defor1.png") # richiamiamo le immagini di nostro interesse e le associamo un nome diverso
defor2 <- brick ("defor2.png")

par(mfrow=c(2,1)) # plottiamo le 2 immagini per confrontarle, sapendo che b1=NIR, b2=red, b3=green
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")




# lezione 17 ven 30 apr
library(raster)
library(RStoolbox) # for vegetation indices calculation
setwd("~/lab/")

defor1 <-brick("defor1.png") # richiamiamo le immagini di nostro interesse e le associamo un nome diverso
defor2 <- brick ("defor2.png")
 
#b1=NIR, b2=red, b3=green
par(mfrow=c(2,1)) # plottiamo le 2 immagini per confrontarle, sapendo che b1=NIR, b2=red, b3=green
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

# vogliamo calcolare l'indice dvi nelle rispettive immagini, considerando che il dvi è uguale alla riflettanza nella banda dell'infrarosso meno quella del rosso
defor1 # per calcolare il dvi di defor1, scriviamo solo defor1 per sapere dove si trovano e come vengono chiamati all'interno del file la banda infrarosso e quella rossa

dvi1 <- (defor1$defor1.1 - defor1$defor1.2) #dvi per l'immagine defor1, in uscita quindi avremo un immagine con i pixel dati dalla differenza dei due valori
plot(dvi1) # visualizziamo l'immagine dell'indice dvi di defor1 con i colori standard di R

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # settiamo colori diversi
plot(dvi1, col=cl, main="DVI at time 0")

dvi2 <- (defor2$defor2.1 - defor2$defor2.2) #dvi per l'immagine defor2, in uscita quindi avremo un immagine con i pixel dati dalla differenza dei due valori
plot(dvi2) # visualizziamo l'immagine dell'indice dvi di defor2 con i colori standard di R
plot(dvi2, col=cl, main="DVI at time 1")

par(mfrow=c(2,1)) # plottiamo insieme, analisi multitemporale, i dvi1 e dvi2
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- dvi1-dvi2 # differenza degli indici per ogni pixel

cld <- colorRampPalette(c('blue','white','red'))(100) # colori usati per le differenze

plot(difdvi,col=cld) #dove la differenza tra i due dvi è maggiore sarà rossa -> area in cui la vegetazione ha subito una maggiore deforestazione

# calcoliamo l'ndvi che ci permette di normallizzare i nostri indici e quindi avere sempre un range fisso che va da -1 a +1
# (NIR - RED) / (NIR+RED), mettiamo sempre le parentesi perchè alcuni software ragionano in modo sequenziale
ndvi1 <- (defor1$defor1.1-defor1$defor1.2)/(defor1$defor1.1+defor1$defor1.2)
plot(ndvi1,col=cl)
ndvi2 <- (defor2$defor2.1-defor2$defor2.2)/(defor2$defor2.1+defor2$defor2.2)
plot(ndvi2,col=cl)

# usiamo la funzione spectralIndices per calcolare i vari indici direttamente
library(RStoolbox) 
vi<-spectralIndices(defor1, green=3,red=2,nir=1)
plot(vi,col=cl)

vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)
plot(vi2, col=cl)


#calcoliamo la differenza tra i due ndvi delle due immaggini
difndvi <- ndvi1 - ndvi2
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)


