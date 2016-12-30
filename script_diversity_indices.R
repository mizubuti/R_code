# ==========================================================
# scripts for diversity indices 
# ======================================= E. M. 17/09/2016 =

# this script uses "vegan" and "vegetarian" package

# organizacao dos dados
# prepare o conjunto de dados com cada populacao em uma linha. 
# nas colunas insira as frequencias dos genotipos/fenotipos.
# exemplo: 3 1 18 3 5 1

library(vegan)
library(vegetarian)

dados1 <- read.table("/home/mizubuti/arquivos/R_code/bla_bla_bla.txt")

# Shannon-Wiener / Simpson (Gini-Simpson) / Stoddart & Taylor


# ============ indice de Shannon-Wiener 

H(dados1, lev="alpha", q = 1, boot=TRUE, boot.arg=list(num.iter=1000)) 


# ============ indice de Simpson 

H(dados1, lev="alpha", q = 2, boot=TRUE, boot.arg=list(num.iter=1000))


# ============ indice de Gini-Simpson

H(dados1, lev="alpha", q = 2, gini=TRUE, boot=TRUE, boot.arg=list(num.iter=1000))


# ============ indice G de Stoddart & Taylor = Effective number based on Simpson

d(dados1, lev="alpha", q = 2, boot=TRUE, boot.arg=list(num.iter=1000)) 


# ’Numbers Equivalents’ for Alpha, Beta and Gamma Diversity Indices

#============= N1 de Hill --> Effective number based on Shannon

d(dados1, lev="alpha", q = 1, boot=TRUE, boot.arg=list(num.iter=1000))


#============= N2 de Hill --> Effective number based on Simpson = Stoddart & Taylor

d(dados1, lev="alpha", q = 2, boot=TRUE, boot.arg=list(num.iter=1000)) 








