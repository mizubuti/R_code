# ## - script para calculo de DE50, DE90 etc usando o pacote drc ##
# 
# ATENCAO! esta funcao somente funciona para conjunto de dados
# que apresentam mesmo tipo de distribuicao (ex. exponencial neg.)
# se houver dados com distribuicao diferente, o algoritmo
# nao converge e falha. portanto, antes de iniciar e' necessario
# fazer uma inspecao visual dos dados e eliminar os isolados que
# diferem do padrao predominante (ex. isol resistentes -- linear)
#
# ha' varias funcoes nao lineares que podem ser ajustadas com drc
# veja opcoes no manual e neste site: http://www.bioassay.dk/
#
# ##################################################### EM 05/01/13

library(drc)
library(lattice)

# leitura dados no linux
dados1 <- read.table('/home/eduardo/Documents/projetos/cnpq/cnpq_mapa/cercobin_11_dias.txt', header=T)

# leitura de dados no mac
# dados1 <- read.table("~/Documents/arquivos/projetos/cnpq/mapa_cnpq/cercobin_11_dias.txt", header=T)

dados1$exp <- as.factor(dados1$exp)
dados1$isol <- as.factor(dados1$isol)
dados1$rep <- as.factor(dados1$rep)

# inspecionar padrao dos dados para retirar isolados resistentes

# subset para gerar graficos apenas para o expto. 1
dados_exp1 <- subset(dados1, exp == "1")
xyplot(diam_medio~conc|isol, dados_exp1)

# subset para gerar graficos apenas para o expto. 2
dados_exp2 <- subset(dados1, exp == "2")
xyplot(diam_medio~conc|isol, dados_exp2)

# ajuste do modelo com funcoes do pacote "drc" para o expto. 1
# ATENCAO! esta funcao somente funciona para conjunto de dados
# que apresentam mesmo tipo de distribuicao (ex. exponencial neg.)
# se houver dados com distribuicao diferente, o algoritmo
# nao converge e falha

# ajusta o modelo exponencial negativo -- fct=EXD.2() c/ 2 parms.
result_exp1 <- drm(diam_medio~conc, isol, fct=EXD.2(), na.action=na.omit, data=dados_exp1)

# obtem DE50 e erro padrao dessa estimativa
final_exp1 <- ED(result_exp1, c(50)))


# ajuste do modelo drc para o expto. 2

result_exp2 <- drm(diam_medio~conc, isol, fct=EXD.2(), na.action=na.omit, data=dados_exp2)
final_exp2 <- ED(result_exp2, c(50)))


# script para ajustar regressao linear e estima DE50  

dados                           #nome do conjunto de dados, data.frame 1
dadosiso                        #nome do conjunto de dados, data.frame 2
str(dados)                      #observar organiza??o dos dados

#calcula regress?o de cada isolado por repeti??o
result <- by(dados, dados$isolado:dados$rep, function(x) lm(inib~log10(conc+0.01),data=x)) 

result[[1]]                     #verifica??o da sa?da 1 somente para confer?ncia dos valores
result[[2]]
result

m<-360                          # total de observa??es (trat x rep)

# os valores de intercepto (a) e da inclina??o(b) ser?o compilados de 1 a m.
for (i in 1:m)
{
temp<-result[[i]]
# os objetos criados abaixo n?o possuem nenhuma fun??o, mas quando inseridos retiram um erro que est? implicito nos calculos (encontrar outra maneira)
a<-temp$coefficients[1]
b<-temp$coefficients[2]
a[i]<-temp$coefficients[1]
b[i]<-temp$coefficients[2]
saida.y[i]<- 10^((50-a[i])/b[i])
}
saida.y

# sa?da y=resultado da DE
resultDE<-saida.y

# mudan?a do nome 
DE50<-resultDE

# concatenar os resultados da "DE50" com o data.frame 2 (dadosiso)
resultado<-cbind(dadosiso,DE50)
 
#vizualizar resultado final
resultado



