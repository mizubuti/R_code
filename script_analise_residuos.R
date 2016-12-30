# ====================================================
# codigo para analise de residuos
# ====================================== E.M. 25/08/13
library(MASS)

setwd("~/Documents/arquivos/lab/sara/")

dados_cresc <- read.table("~/Documents/arquivos/lab/sara/dados_cresc.txt", header=T)

dados_cresc$meio <- as.factor(dados_cresc$meio)
dados_cresc$isol <- as.factor(dados_cresc$isol)
dados_cresc$rep <- as.factor(dados_cresc$rep)

# ANOVA para diametro medio aos 10 dias - DM10
modelo_DM10 <- aov(DM10 ~ meio + isol + meio*isol, data=dados_cresc)
anova(modelo_DM10)
# graficos de residuos
plot(modelo_DM10)
# residuos padronizados
DM10_resid <- studres(modelo_DM10)
plot(DM10_resid)

# ANOVA para area abaixo da curva cresc micelial - AACM
modelo_AACM <- aov(AACM ~ meio + isol + meio*isol, data=dados_cresc)
anova(modelo_AACM)
# graficos de residuos
plot(modelo_AACM)
# residuos padronizados
AACM_resid <- studres(modelo_AACM)
plot(AACM_resid)

# ANOVA para taxa de crescimento micelial - TCM
modelo_TCM <- aov(TCM ~ meio + isol + meio*isol, data=dados_cresc)
anova(modelo_TCM)
# graficos de residuos
plot(modelo_TCM)
# residuos padronizados
TCM_resid <- studres(modelo_TCM)
plot(TCM_resid)

