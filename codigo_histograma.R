# **************************************
# script histograma
# ************************ E.M. 04/01/10

DE50 <- read.table('/home/mizubuti/Desktop/dados_histograma.txt', header=TRUE)
DE50

hist(DE50$conc_ug, main="Histograma",xlab="Classes de DE50 (ug/L)",ylab="Frequência", freq=TRUE)


