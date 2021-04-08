# time series analyss
# Greenland increase of temperature
# settiamo la cartella di lavoro
# install.packages("raster")
library(raster)
# settiamo la cartella di lavoro
setwd("~/lab/greenland") 


#lezione 10 mer 7 apr
lst_2000 <- raster("lst_2000.tif") # al posto di usare brick che serve per pacchetti di dati, usiamo raster che invece richiama un singolo strato
lst_2000 #dettagli del dato, tipo i valori min e max
plot(lst_2000)
lst_2005 <- raster("lst_2005.tif")
plot(lst_2005)
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

#visualizziamo le 4 immagini insieme
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# lista di file, grazie alla funzione list.files e al suo patter che mi indica la parte di nome in comune tra i file che voglio introdurre nella lista
rlist <- list.files(pattern="lst")
rlist
# con lapply applichiamo la funzione raster alla lista di file definita prima con list.files
import <- lapply(rlist,raster)
import
# ora tramite la funzione stack riusciamo a creare un unico file contenente tutta la lista dei file costruita prima
TGr <- stack(import)
plot(TGr)
#ora proviamo a plottare nelle 3 bande assegnando ad ognuna un'immagine 
plotRGB(TGr, 1, 2, 3, stretch="Lin")
# in questo modo ho associato nel rosso l'immagine del 2000, nel verde l'immagine del 2005 e nel blu l'immagine del 2010, in questo modo l'immagine risulta più blu e quindi significa che i valori della temperatura nel 2010 sono maggiori
plotRGB(TGr, 2, 3, 4, stretch="Lin")
# in questo caso mettiamo a confronto le immagini dei diversi annni: 2005, 2010, 2015
