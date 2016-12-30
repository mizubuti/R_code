                                            
# ************************************************************************
# script para fazer mapas e plotar pontos com coordenadas geograficas
#
# sao necessarios:
# - arquivo texto com as coordenadas geograficas, em formato decimal, 
# dos pontos amostrados. neste script, o arquivo contem duas variaveis: 
# long e latitude, nessa ordem, com valores em colunas, separados 
# por espaco
# - arquivos de mapas formato shp, dbf e shx
# ********************************************************** E.M. 08/06/15

library(maps)
library(maptools)
library(pixmap)

setwd("/home/mizubuti/Documents/arquivos/mapas/")


# Carregar shapes e pontos

america_sul <- readShapeLines('/home/mizubuti/Documents/arquivos/mapas/America_do_Sul.shp', proj4string=CRS("+proj=longlat"), delete_null_obj=TRUE)

Brasil_estados <- readShapeLines('/home/mizubuti/Documents/arquivos/mapas/BRASIL.shp', proj4string=CRS("+proj=longlat"))
bacia <- readShapeLines('/home/mizubuti/Documents/arquivos/mapas/lineaire_10km.shp', proj4string=CRS("+proj=longlat"))

# Atencao!!! o arquivo devera' conter na primeira coluna o valor de longitude e, na 2a, latitude (em decimal)

pontos0 <- read.table('AM.txt', header=FALSE)
pontos1 <- read.table('AC.txt', header=FALSE)
pontos2 <- read.table('PA.txt', header=FALSE)


# Desenhar o mapa

plot(america_sul)
plot(Brasil_estados, add=TRUE)

points(pontos0, pch=19, col='red', cex=0.5)  # para controlar o tamanho do ponto altere o valor de cex
points(pontos1, pch=19, col='green', cex=0.5)  # para controlar o tamanho do ponto altere o valor de cex
points(pontos2, pch=19, col='blue', cex=0.5)  # para controlar o tamanho do ponto altere o valor de cex

points(pontos, pch=16, col='red', cex=0.6)  # para controlar o tamanho do ponto altere o valor de cex

legend("bottomright",c("Sampled locations"),pch=21,cex=1, pt.bg=c('red'),bty='n',pt.cex=2, pt.lwd=0, title=' ')

plot(bacia, add=TRUE)

par(new=TRUE)

# Add Scale to Existing Unprojected Map

map.scale(relwidth = 0.15, metric = TRUE, ratio = TRUE, ylim = c(0, 1))


# insere seta indicando Norte

par(new=TRUE)
north.arrow = function(x, y, h) {
    polygon(c(x, x, x + h/2), c(y - h, y, y - (1 + sqrt(3)/2) * h),
col = "black", border = NA)
    polygon(c(x, x + h/2, x, x - h/2), c(y - h, y - (1 + sqrt(3)/2) *
h, y, y - (1 + sqrt(3)/2) * h))
    text(x, y, "N", adj = c(0.5, 0), cex = 2)
}
plot(1, type = "n", ylim = c(0, 1), frame.plot=FALSE, axes=FALSE, xlab="", ylab="")
north.arrow(1.35, 0.75, 0.05)

par(new=TRUE)
plot(bacia)

# salvar o mapa no formato jpg ou tiff -- neste caso, a escolha foi tiff

# jpeg(filename = "amostras_hemileia.jpeg", pointsize = 12, quality = 100, bg = "white", res = 300)

tiff(filename = "samples_metagenomic_hevea.tif", width=1200, height=1600, pointsize = 10, compression = "none", bg = "white", res = 300)

dev.off()




