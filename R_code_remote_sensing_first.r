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

