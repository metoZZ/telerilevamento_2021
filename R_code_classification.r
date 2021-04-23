# lezione 14 mer 21 apr: Classificazione per classi

# richiamo funzione brick che usa la libreria raster
library(raster)
setwd("~/lab/")
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
plotRGB(so, 1, 2, 3, stretch="lin") # visualizziamo i 3 livelli RGB

# usiamo la funzione unsuperClass per la classificazione: il software crea un training set - unsupervised classification perchè non effettuata da noi - che è all'interno del pacchetto RStoolbox
# noi possiamo deifinire soltanto il numero di classe che vogliamo stabilire per la classificazione
library(RStoolbox)
soc <- unsuperClass(so, nClasses=3)
set.seed(42) #standardizza il training set per poter usare sempre lo stesso

# proviamo ad aumentare il numero di classi da 3 a 20
soc20 <- unsuperClass(so, nClasses=20)
plot(soc20$map)

# scarichiamo un'altra immagine dal sito https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images
sun <- brick("Sun.png")
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)



# lezione 15 ven 23 apr:  continuo classificazione del Grand Canyon
library(raster)
library(RStoolbox)
setwd("~/lab/")
gc <- brick ("dolansprings_oli_2013088_canyon_lrg.jpg") # richiamiamo il file e lo associamo ad una stringa alfanumerica che abbiamo deciso noi per facilitarci nelle prossime funzioni
plotRGB(gc, r=1, g=2, b=3, stretch="Lin") # visualizziamo l'immagine con i colori naturali - frequenza del visibile
plotRGB(gc, R=1, g=2, b=3, stretch="hist") # auentiamo la potenza dello stretch da lineare a istogramma 
gcc2 <- unsuperClass(gc, nClasses=2) # classificazione non supervisionata in cui noi abbiamo deciso soltanto il numero di classi
gcc2
plot(gcc2$map) # visualizziamo la mappa dell'immagine classificata
gcc4 <- unsuperClass(gc, nClasses=4) # classichiamo a 4 classi
gcc4
plot(gcc4$map)
