# ====================================================
# codigo para analise de dados cercosporina - Brainer
# modelagem usando mixed models
# requer pacote lme4
# ====================================== E.M. 01/01/08

setwd("G:/Documents/1artigos/brainer/R_code")

cercos <- read.table("cercosporina.txt", header=TRUE)

# modelo com todos fatores aleatórios

fm1 <- lmer(Cerc ~ 1 + (1|Reg) + (1|Sist) + (1|LavSist), cercos)
summary(fm1)

# modelo misto com Reg e Sist(Reg) fixos e Lav(Sist(Reg)) como aleatorio

