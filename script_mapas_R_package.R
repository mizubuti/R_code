# ********************************************************************
# script para fazer mapas e plotar pontos com coordenadas geograficas
#
# e' necessario criar um arquivo texto com as coordenadas geograficas, 
# em formato decimal, dos pontos amostrados. neste script, o arquivo
# contem duas variaveis: lat long e os valores estao em colunas, 
# separados por espaco
# *******************************************************E.M. 21/12/09

library(maps)
library(maptools)
library(pixmap)

# library(RODBC)
# library(mapdata)

# Para carregar coordenadas dos pontos lendo arquivo de Excel
# habilite o comando library(RODBC) acima e as tres linhas abaixo

# Dados<-odbcConnectExcel('insira_nome_do_arquivo_aqui.xls',readOnly=T)
# Coord<-sqlFetch(Dados,'CoordMed',colnames=F,rownames='Ponto')  # ajustar conforme o arquivo em uso
# odbcClose(nome_do_arquivo_aberto)


# Carregar shapes e pontos

Brasil_estados <- readShapeLines('/home/mizubuti/arquivos/mapas/brasil.shp', proj4string=CRS("+proj=longlat"))
pontos <- read.table('/home/mizubuti/arquivos/R_code/lat_long.txt', header=TRUE)
# Brasil_municipios <- readShapeLines('/home/mizubuti/arquivos/mapas/municipios.shp', proj4string=CRS("+proj=longlat"))

# Desenhar o mapa

plot(Brasil_estados)
points(pontos, pch=16, col='red', cex=1.0)  # para controlar o tamanho do ponto altere o valor de cex

# Inserir indicacao "Norte"
# ainda necessita ser trabalhado

north.arrow = function(x, y, h) {
    polygon(c(x, x, x + h/2), c(y - h, y, y - (1 + sqrt(3)/2) * h),
col = "black", border = NA)
    polygon(c(x, x + h/2, x, x - h/2), c(y - h, y - (1 + sqrt(3)/2) *
h, y, y - (1 + sqrt(3)/2) * h))
    text(x, y, "N", adj = c(0.5, 0), cex = 3)
}
plot(1, type = "n", ylim = c(0, 1))
north.arrow(1, 0.8, 0.1)


# salvar o mapa

postscript('mapa_brasil.eps',paper='special',onefile=F,horizontal=F,width=3.5
,height=4.5,bg='white',pointsize=3)

par(mar=c(3,2,2,0))

title(main='TESTE')

legend(40.2,23.5,c('Uma','Duas','Três'),pch=21,cex=1,pt.bg=c('red','yellow',
'blue'),bty='n',pt.cex=2,pt.lwd=0.6,title='Réplicas')

legend(39.8,23.5,c('Areia','Calcário','Lama'),pch=21,cex=1,pt.bg=c('lightyel
low','lightgray','lightgreen'),bty='n',pt.cex=2,pt.lwd=0.6,title='Faciologia
')

addlogo(N,px=c(40,39.8),py=c(21,20.8))

dev.off()

q('no')


