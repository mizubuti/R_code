# ======================================================
# script para calculo de diversidade -- Shannon, Simpson 
# 	e riqueza por curva de rarefacao
# ====================================== E.M. 09/01/08 =

# **** Atencao Vide pacote vegetarian e BiodiversityR (a GUI for vegan)


library(vegan)

# -- entrada de dados
# criar uma matriz (ex.: "pop1") com elementos vazios, 01 linha e x colunas
# nesse caso, 12 colunas. 

pop1 <- matrix(,1,12)

# voce devera' fornecer as frequencias dos genotipos 
# (no exemplo, 12 genotipos amostrados), um valor por coluna.
# para tal, voce podera': 1. entrar os dados por teclado 
# ou 
# 2. pela leitura dos dados de arquivo externo
# A opcao 1 esta' implementada por "default"

# ativa o editor para entrada de dados via teclado

data.entry(pop1)

# remova os comentarios das proximas linhas para ler dados de arquivo externo 
# populacao1 <- read.table("xxxxx.ext", h = TRUE)
# populacao1 <- matrix(populacao1)

# -- calculo de indice de Shannon-Wiener H'
pop1_H <- diversity(pop1, "shannon", MARGIN = 1, base = exp(1))

# -- calculo de indice de Stoddart & Taylor G
pop1_G <- diversity(pop1, "invsimpson")

pop1_H; pop1_G

# estimar a riqueza [Expected number of genotypes -  E(g(n))] 
# para uma amostra de tamanho 34

rarefy(pop1, 34, se=FALSE, MARGIN = 1)

# para mais detalhes sobre o comando veja:
# a funcao rarefy faz parte da library vegan para analise de ecologia de comunidades
# a funcao rarefy esta' associada ao pacote diversity
# google: rarefaction diversity vegan R package
# http://cc.oulu.fi/~jarioksa/softhelp/vegan/html/00Index.html


