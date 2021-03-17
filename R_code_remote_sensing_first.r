# il mio primo codice in R per il Telerilevamento!

install.packages("raster") #funzione per installare un pacchetto, in questo caso raster è esterno quindi mettiamo le virgolette

setwd("~/lab/") #linux, set working directory, settare la cartella di lavoro 

library(raster) #richiama il pacchetto raster, dato che lo abbiamo prima installato non mettiamo le virgolette

p224r63_2011 <- brick("p224r63_2011_masked.grd") #richiamo l'immagine e la associo ad un oggetto
p224r63_2011 #mostra le informazioni del file - cosa c'è dentro il file

plot(p224r63_2011) # funzione per visualizzare le diverse bande

cl <- colorRampPalette (c("black", "grey", "light grey"))(100) #color change, cambia il colore assegnato alla scala di visualizzazione, c è un vettore che ci serve per includere più elementi in uno, 100 indica il numero di livelli dei colori che abbiamo assegnato

cls <- colorRampPalette(c("red","pink","orange","purple")) (200) #altro esempio di modifica dei colori

plot(p224r63_2011, col=cl) #plottaggio associato al color change, col è un argomento della funzione plot che serve per definire i colori
