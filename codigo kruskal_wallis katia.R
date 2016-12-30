# ####################################################
# Codigo em R para fazer análise de Kruskal-Wallis 
# com múltiplas comparações de médias
# requer pkg: pgirmess
# ######################################## EM 26/11/07

setwd ("/media/My U3 Drive/dados Katia/")
library(pgirmess)
dados <- read.table("dados_KW_Katia.txt", header=T)

# convertendo a var. Trat em vetor de fatores

dados$Trat<-as.factor(dados$Trat)

# teste de Kruskal-Wallis e a seguir a comparação p./cada var.

kruskal.test(TRB ~ Trat, dados)
kruskalmc(dados$TRB, dados$Trat, probs=0.05)

kruskal.test(KLN19 ~ Trat, dados)  
kruskalmc(dados$KLN19, dados$Trat, probs=0.05)

kruskal.test(RH ~ Trat, dados)
kruskalmc(dados$RH, dados$Trat, probs=0.05)

kruskal.test(TRB.1 ~ Trat, dados) 
kruskalmc(dados$TRB.1, dados$Trat, probs=0.05)

kruskal.test(KLN19.1 ~ Trat, dados) 
kruskalmc(dados$KLN19.1, dados$Trat, probs=0.05)

kruskal.test(RH.1 ~ Trat, dados)
kruskalmc(dados$RH.1, dados$Trat, probs=0.05)


