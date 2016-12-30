# ################################
# script para graficos de densidade
# denstity plots - dados Lahyre
# #################### E. M. 15/11/13


library(lattice)

dados <- read.table("/Users/mizubuti_macbookair/Documents/arquivos/publicacoes/lahyre/fungicidas/dados_ec50.txt", header=TRUE)

tiff("/Users/mizubuti_macbookair/Documents/arquivos/publicacoes/lahyre/fungicidas/mancozeb.tiff")
densityplot(~manc, data=dados, plots.points=TRUE, xlab="CE50 (µg.mL-1)", col="Black")
dev.off()

tiff("/Users/mizubuti_macbookair/Documents/arquivos/publicacoes/lahyre/fungicidas/chlorothalonil.tiff")
densityplot(~chloro, data=dados, plots.points=TRUE, xlab="CE50 (µg.mL-1)", col="Black", auto.key=TRUE)
dev.off()

tiff("/Users/mizubuti_macbookair/Documents/arquivos/publicacoes/lahyre/fungicidas/thiophanate.tiff")
densityplot(~thiopha, data=dados, plots.points=TRUE, xlab="CE50 (µg.mL-1)", col="Black", auto.key=TRUE)
dev.off()

tiff("/Users/mizubuti_macbookair/Documents/arquivos/publicacoes/lahyre/fungicidas/tebuconazole.tiff")
densityplot(~tebuco, data=dados, plots.points=TRUE, xlab="CE50 (µg.mL-1)", col="Black", auto.key=TRUE)
dev.off()


