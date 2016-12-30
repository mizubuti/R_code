# ***********************************************************
# script para mixed model 
#
# exemplo Littell pag 42 -- wafer aninhado em et é aleatorio
# 
# ********************************************* E.M. 07/01/10

library(lme4)

dados <- read.table('/home/mizubuti/arquivos/R_code/data_wafer_littell_96.txt', header=TRUE)

dados$et <- as.factor(dados$et)
dados$wafer <- as.factor(dados$wafer)
dados$pos <- as.factor(dados$pos)


# usando lmer

modelo_2 <- lmer(resista ~ et + pos + et:pos + (1|et/wafer), data=dados)
summary(modelo_2)

