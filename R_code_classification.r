# lezione 14 mer 21 apr: Classificazione per classi

setwd("~/lab/")

# richiamo funzione brick che usa la libreria raster
library(raster)
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

