# time series analyss
# Greenland increase of temperature
# Data and Code from Emanuela Cosma
# settiamo la cartella di lavoro
# install.packages("raster")
library(raster)
# settiamo la cartella di lavoro
setwd("~/lab/greenland") 




#lezione 10 mer 7 apr

# carico pacchetti
library(raster)
setwd("~/lab/greenland")

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


# lezione 11 ven 9 apr
# carico pacchetti che useremo
library(raster)
library(rasterVis)
setwd("~/lab/greenland")

rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist,raster)
import
TGr <- stack(import)
TGr

levelplot(TGr) # mi da un output più potente rispetto al plot normale, con un'unica legenda e uniche coordinate per tutte le bande in modo da avere uno spazio maggiore da dedicare alle mappe, in più sfrutta una gamma di colori più potente 
levelplot(TGr$lst_2000) # introduce un grafico della media della temperatura lungo le righe e lungo le colonne
cl <- colorRampPalette(C("blue","lightblue","pink", "red"))(100) #cambiamo i colori dei valori
levelplot(TGr, col.regions=cl) # applichiamo il cambio dei colori, notare il cambiamento dell'argomento da col a col.regions
levelplot(TGr, col.regions=cl, names.attr=c("July 2000", "July 2005", "July 2010", "July 2015")) # cambiamo il nome delle 4 diverse immagine
levelplot(TGr, col.regions=cl, main="LST variation in time", names.attr=c("July 2000", "July 2005", "July 2010", "July 2015")) # con l'attributo main aggiungiamo il titolo al nostro grafico

# Melt: dati che riguardano lo scioglimento dei ghiacci dal 1979 al 2007
meltlist <- list.files (pattern="melt") # creo la lista di tutti i file che hanno all'interno del loro nome del file la parola "melt"
melt_import <- lapply(meltlist,raster) # importo la lista di file applicando a tutti la funzione raster
melt <- stack(melt_import) # creo un unico file contente tutte le immagini 
melt # guardo le caratteristiche del nostro file
levelplot(melt) # plottiamo le immagini dal 1979 al 2007
melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt # differenza tra la matrice di dati dell'anno 2007 - che ha temperature maggiori - e quella dell'anno 1979, da notare che ogni immagine è attaccata dal melt perchè sono al suo interno
melt_amount # vediamo le caratteristiche del file, quindi anche i valori min e max, min quindi che hanno avuto il minor sciogliemto e max il maggiore intermini assoluti
clb <- colorRampPalette(c("blue","white","red"))(100) # nuova scala di colori, con valori bassi in blue e valori alti in rosso
plot(melt_amount,col=clb) # plottiamo la differenza, dove avremo le parti colorate di rosso avremo le aree che hanno subito un maggiore scioglimento
levelplot(melt_amount, col.regions=clb) # aumentiamo la potenza dell'output

