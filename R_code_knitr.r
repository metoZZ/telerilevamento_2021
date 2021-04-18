# R_code_knitr.r

# lezione 13: ven 16 apr

setwd("~/lab/") # come sempre impostiamo la cartella di lavoro

library(knitr)

stitch("R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr")) # funzione che richiamo uno script .r per poi creare un report
