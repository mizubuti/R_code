# ***************************************************
# script para analise de dados de remocao de residuos
#        de fungicidas protetores -- tomateiro
# ***************************************************

# requer o pacote nlstools

library(nlstools)

# leitura dos dados

semana1 <- read.table("semana1.txt", h=T)
semana2 <- read.table("semana2.txt", h=T)
# semana3 <- read.table("semana3.txt", h=T)
semana4 <- read.table("semana4.txt", h=T) 


# graficos de dispersao, organizados por fungicidas

# mancozeb
par(mfrow=c(3,1)) 
plot(semana1$dia, semana1$manc, main="Semana 1", xlab="Dias", ylab="Resíduos de mancozeb (ug/mg)", ylim=c(0,1500))
abline(lsfit(semana1$dia, semana1$manc), col="red")
legend('topright', c('Resíduos','Modelo linear'), lty=c(0,1), pch=c(19,NA), col=c('black','red'), inset=0.02)

plot(semana2$dia, semana2$manc, main="Semana 2", xlab="Dias", ylab="Resíduos de mancozeb (ug/mg)", ylim=c(0,1500))
abline(lsfit(semana2$dia, semana2$manc), col="red")
plot(semana4$dia, semana4$manc, main="Semana 4", xlab="Dias", ylab="Resíduos de mancozeb (ug/mg)", ylim=c(0,1500))
abline(lsfit(semana4$dia, semana4$manc), col="red")


# mancozeb-nt
par(mfrow=c(3,1)) 
plot(semana1$dia, semana1$manc_nt, main="Semana 1", xlab="Dias", ylab="Resíduos de mancozeb NT (ug/mg)", ylim=c(0,1500))
abline(lsfit(semana1$dia, semana1$manc_nt), col="red")
legend('topright', c('Resíduos','Modelo linear'), lty=c(0,1), pch=c(19,NA), col=c('black','red'), inset=0.02)

plot(semana2$dia, semana2$manc_nt, main="Semana 2", xlab="Dias", ylab="Resíduos de mancozeb NT (ug/mg)", ylim=c(0,1500))
abline(lsfit(semana2$dia, semana2$manc_nt), col="red")
plot(semana4$dia, semana4$manc_nt, main="Semana 4", xlab="Dias", ylab="Resíduos de mancozeb NT (ug/mg)", ylim=c(0,1500))
abline(lsfit(semana4$dia, semana4$manc_nt), col="red")

# oxicloreto de cobre
par(mfrow=c(3,1))
plot(semana1$dia, semana1$oxi, main="Semana 1", xlab="Dias", ylab="Resíduos de oxicl. cobre (ug/mg)", ylim=c(0,4000))
abline(lsfit(semana1$dia, semana1$oxi), col="red")
legend('topright', c('Resíduos','Modelo linear'), lty=c(0,1), pch=c(19,NA), col=c('black','red'), inset=0.02)
plot(semana2$dia, semana2$oxi, main="Semana 2", xlab="Dias", ylab="Resíduos de oxicl. cobre (ug/mg)", ylim=c(0,4000))
abline(lsfit(semana2$dia, semana2$oxi), col="red")
plot(semana4$dia, semana4$oxi, main="Semana 4", xlab="Dias", ylab="Resíduos de oxicl. cobre (ug/mg)", ylim=c(0,4000))
abline(lsfit(semana4$dia, semana4$oxi), col="red")



# ajuste do modelo linear - dados brutos

# mancozeb

ajuste.manc.semana1 <- lm(manc ~ dia, data=semana1)
summary(ajuste.manc.semana1)
ajuste.manc.semana2 <- lm(manc ~ dia, data=semana2)
summary(ajuste.manc.semana2)
ajuste.manc.semana4 <- lm(manc ~ dia, data=semana4)
summary(ajuste.manc.semana4)

# analise de residuos
par(mfrow=c(2,2)) 
plot(ajuste.manc.semana1)
plot(ajuste.manc.semana2)
plot(ajuste.manc.semana4)

# mancozeb_nt

ajuste.manc_nt.semana1 <- lm(manc_nt ~ dia, data=semana1)
summary(ajuste.manc_nt.semana1)
ajuste.manc_nt.semana2 <- lm(manc_nt ~ dia, data=semana2)
summary(ajuste.manc_nt.semana2)
ajuste.manc_nt.semana4 <- lm(manc_nt ~ dia, data=semana4)
summary(ajuste.manc_nt.semana2)

par(mfrow=c(3,1)) 
plot(ajuste.manc_nt.semana1)
plot(ajuste.manc_nt.semana2)
plot(ajuste.manc_nt.semana4)

# oxicloreto de cobre

ajuste.oxi.semana1 <- lm(oxi ~ dia, data=semana1)
summary(ajuste.oxi.semana1)
ajuste.oxi.semana2 <- lm(oxi ~ dia, data=semana2)
summary(ajuste.oxi.semana2)
ajuste.oxi.semana4 <- lm(oxi ~ dia, data=semana4)
summary(ajuste.oxi.semana4)

par(mfrow=c(3,1)) 
plot(ajuste.oxi.semana1)
plot(ajuste.oxi.semana2)
plot(ajuste.oxi.semana4)

# =================== ajustes nao lineares ===================

# mancozeb

nl.manc.semana1 <- nls(manc~alfa*exp(-beta*dia), data=semana1, start=list(alfa=500, beta=1))
summary(nl.manc.semana1)
# analise de residuos
nr <- nlsResiduals(nl.manc.semana1)
plot(nr)

nl.manc.semana2 <- nls(manc~alfa*exp(-beta*dia), data=semana2, start=list(alfa=500, beta=1))
summary(nl.manc.semana2)
nr <- nlsResiduals(nl.manc.semana2)
plot(nr)

nl.manc.semana4 <- nls(manc~alfa*exp(-beta*dia), data=semana4, start=list(alfa=500, beta=1))
summary(nl.manc.semana4)
nr <- nlsResiduals(nl.manc.semana4)
plot(nr)


# mancozeb_nt

nl.manc_nt.semana1 <- nls(manc_nt~alfa*exp(-beta*dia), data=semana1, start=list(alfa=500, beta=1))
summary(nl.manc_nt.semana1)
# analise de residuos
nr <- nlsResiduals(nl.manc_nt.semana1)
plot(nr)

nl.manc_nt.semana2 <- nls(manc_nt~alfa*exp(-beta*dia), data=semana2, start=list(alfa=500, beta=1))
summary(nl.manc_nt.semana2)
nr <- nlsResiduals(nl.manc_nt.semana2)
plot(nr)

nl.manc_nt.semana4 <- nls(manc_nt~alfa*exp(-beta*dia), data=semana4, start=list(alfa=500, beta=1))
summary(nl.manc_nt.semana4)
nr <- nlsResiduals(nl.manc_nt.semana4)
plot(nr)

# oxicloreto de cobre

nl.oxi.semana1 <- nls(oxi~alfa*exp(-beta*dia), data=semana1, start=list(alfa=500, beta=1))
summary(nl.oxi.semana1)
# analise de residuos
nr <- nlsResiduals(nl.oxi.semana1)
plot(nr)

nl.oxi.semana2 <- nls(oxi~alfa*exp(-beta*dia), data=semana2, start=list(alfa=500, beta=1))
summary(nl.oxi.semana2)
nr <- nlsResiduals(nl.oxi.semana2)
plot(nr)

nl.oxi.semana4 <- nls(oxi~alfa*exp(-beta*dia), data=semana4, start=list(alfa=500, beta=1))
summary(nl.oxi.semana4)
nr <- nlsResiduals(nl.oxi.semana4)
plot(nr)









