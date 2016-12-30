# script para usar o RgoogleMaps
# exemplo de entrada de dados, com coordenadas latitude longitude)

library(RgoogleMaps)

lat<-c(-16.3784,-17.3758,-20.7526,-21.1308,-10.2119,-9.9133,-10.6519,-19.1969)

lon<-c(-39.3667,-54.7244,-41.2903,-42.3658,-63.8288,-63.0408,-68.5038,-40.0977)

MyMap<-GetMap(center=c(mean(lat), mean(lon)), zoom<-min(MaxZoom(range(lat), range(lon))), maptype="terrain")

PlotOnStaticMap(MyMap,lat,lon,pch=25,col='red',bg="red")

maptype = c("roadmap", "mobile", "satellite", "terrain", "hybrid", "mapmaker-roadmap")

