# il mio primo codice in R per il Telerilevamento!

# ogni volta che uso una nuova funzione se la scrivo nel motore di ricerca trovo cosa esegue e la sua scrittura

install.packages("raster") #funzione per installare un pacchetto, in questo caso raster è esterno quindi mettiamo le virgolette

setwd("~/lab/") #linux, set working directory, settare la cartella di lavoro 

library(raster) #richiama il pacchetto raster, dato che lo abbiamo prima installato non mettiamo le virgolette

p224r63_2011 <- brick("p224r63_2011_masked.grd") #richiamo l'immagine e la associo ad un oggetto
p224r63_2011 #mostra le informazioni del file - cosa c'è dentro il file

plot(p224r63_2011) # funzione per visualizzare le diverse bande

cl <- colorRampPalette (c("black", "grey", "light grey"))(100) #color change, cambia il colore assegnato alla scala di visualizzazione, c è un vettore che ci serve per includere più elementi in uno, 100 indica il numero di livelli dei colori che abbiamo assegnato

cls <- colorRampPalette(c("red","pink","orange","purple")) (200) #altro esempio di modifica dei colori

plot(p224r63_2011, col=cl) #plottaggio associato al color change, col è un argomento della funzione plot che serve per definire i colori

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7:  infrarosso meio

dev.off() #pulisce la finistra grafica, le impostazioni ripartono da zero

plot(p224r63_2011$b1_sre) #permette di plottare l'immagine associandola unicamente alla banda 1


par #definisce come vogliamo mettere le immagini all'interno della finestra grafica

# 1 riga, 2 colonne
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 righe, 1 colonna
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

par(mfcol=c(1,2)) #in questo caso se scriviamo col al posto di row, nominiamo prima le colonne e poi le righe, quindi in questo caso avremo il grafico con 1 colonna e 2 righe

#plottiamo le prime 4 bande di landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#plottiamo le prime 4 bande ma a visualizzazione 2x2, quindi quadrata
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#plottiamo a quadrato le prime 4 bande ma associando una colorRampPalette diversa ad ogni banda
par(mfrow=c(2,2))
clb <- colorRampPalette(c("lightblue","blue","darkblue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c("lightgreen","green","dark green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("pink","red","dark red")) (100)
plot(p224r63_2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("yellow","orange","red")) (100)
plot(p224r63_2011$B4_sre, col=clnir)





#lezione 8 ven 26 mar: visualizing data by RGB plotting
library(raster)
setwd("~/lab/")
p224r63_2011 <- brick("p224r63_2011_masked.grd")

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin") #abbiamo un ogetto raster multi-layer e tramite la funzione plottiamo associando 3 bande alle relaive RGB
#stretch lineare serve per tirare l'immagine e mostrare tutte le sfumature presenti, a scopo di visualizzazione, non cambiamo i dati
#in questo caso vedremo con i colori naturali - quelli del visibile a occhio umano

plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin") #in questo caso invece abbiamo tolto la banda blu e inserito la banda dell'infrarosso vicino, in questo caso si dice a falsi colori, semplicemente perchè non sono quelle del visibile
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin") #a seconda della banda che montiamo visualizziamo pattern del paesaggio diversi, che magari prima non riuscivam a vedere, in questo caso si vede bene la componente agricola
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")

pdf("il_mio_primo_pdf_con_R.pdf") #funzione per creare un pdf dell'immagine interessata
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011,r=4,g=3,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=2,b=4,stretch="Lin")
dev.off()

plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="hist") # aumentiamo lo stretch passando da una funzione lineare a una histogram "s", ci permette in questo caso di visualizzare la diramazione dei corsi d'acqua che a occhio nudo non vedremmo, chiamate dimensione frattale che significa visualizzare l'oggetto che si ripete con la stessa forma infinitamente - cavolo romano, usato per studiare gli incendi

# costruiamo un multiframe plottando la nostra immaggine in colori naturali, in falsi colori con uno stretch lineare e in falsi colori con uno stretch histogram
par(mfrow=c(3,1))
plotRGB(p224r63_2011,r=3,g=2,b=1,stretch="Lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="lin")
plotRGB(p224r63_2011,r=3,g=4,b=2,stretch="hist")
 

install.packages("RStoolbox")
library(RStoolbox)







# lezione 9 mer 31 mar: Multitemporal set-Analisi Multitemporale

library(raster) # come al solito richiamiamo il pacchetto raster
setwd("~/lab/") # settiamo la cartella di lavoro

p224r63_2011 <- brick("p224r63_2011_masked.grd") # richiamiamo e associamo la solita immagine del 2011
p224r63_2011 # in questo modo vediamo le sue caratteristiche

p224r63_1988 <- brick("p224r63_1988_masked.grd") # richiamiamo e associamo la stessa area - con uguae path e row - ma immagine del 1988
p224r63_1988 # ne visioniamo le caratteristiche 

plot(p224r63_1988) # plottiamo le singole bande

dev.off() # pulisco

plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin") # plottiamo associando le bande ai multi layer RGB a colori naturali

plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin") # scattiamo tutti i numeri delle bande di uno per inserire la banda a infrarosso vicino

# plottiamo le due immagini, del 1988 e del 2011, per confrontarle
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

# plottiamo le due immagini, del 1988 e del 2011, per confrontarle sia temporalmente sia confrontando i due stretch, lin e hist
# con hist riusciamo ad evidenziare minerali rocce sabbia 
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Hist")

# produciamo un pdf con le immagini plottate 
pdf("Multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Hist")
dev.off()

