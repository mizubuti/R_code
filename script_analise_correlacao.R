# script para analise de correlacao

setwd("/home/eduardo/arquivos/R_code/")

dados1 <- read.table("/home/eduardo/arquivos/R_code/dados_correlacao.txt", header = TRUE)
dados1

dados1$CL <- as.factor(dados1$CL)
dados1$host <- as.factor(dados1$host)

# obtendo o grafico e salvando no formato jpg

jpeg("correlacao.jpg")
plot(dados1$year, dados1$LS, xlab="Year", ylab="LS", pch=16)
dev.off()

correlacao_1 <- cor.test(dados1$LS, dados1$year, method = "pearson")

# para fazer um subset por linhagen clonal
correlacao_JP_1 <- cor.test(~LS + year, data = dados1, subset=CL=="JP_1")

