# ============================================
# script para analise de covariancia
# ============================= E. M. 10/07/10


dados <- read.table("/home/mizubuti/arquivos/lab/thais/cotiledones.txt", header=TRUE)

str(dados)

dados$REP <- as.factor(dados$REP)

attach(dados)
plot(ABS, PESO, pch=16+as.numeric(RIZO), col=c("blue", "red")[as.numeric(RIZO)])

ancova <- lm(ABS~RIZO*PESO)
summary(ancova)
anova(ancova)

ancova2 <- update(ancova, ~ . - RIZO:PESO)
anova(ancova,ancova2)

step(ancova)

