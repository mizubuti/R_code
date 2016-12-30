# script para histograma

dados1 <- read.table('/home/usuario/Documentos/Z_mizubuti/histograma_tebuco_1.txt', header=T)

frequencia = dados1$Estimate
histograma <- hist(frequencia, col='black', breaks=c(0,0.1,1,10,20), main="Tebuconazole")

# recurso para saber quantos isolados há em cada categoria

teste <- table(cut(dados1$Estimate, breaks= 0:100))
teste

