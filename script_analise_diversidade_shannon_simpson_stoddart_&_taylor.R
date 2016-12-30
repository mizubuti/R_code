# ==========================================================
# script para calcular indices de diversidade com bootstrap
# ======================================= E. M. 24/08/2009 =

# este script necessita do pacote "vegetarian"

# organizacao dos dados
# prepare o conjunto de dados com cada populacao em uma linha. 
# nas colunas insira as frequencias dos genotipos/fenotipos.
# exemplo: 3 1 18 3 5 1


library(vegetarian)

dados1 <- read.table("/home/mizubuti/arquivos/R_code/bla_bla_bla.txt")

# ============ indice de Shannon-Wiener 

H(dados1, lev="alpha", q = 1, boot=TRUE, boot.arg=list(num.iter=1000)) 


#============= indice N1 de Hill 

d(dados1, lev="alpha", q = 1, boot=TRUE, boot.arg=list(num.iter=1000))

# ============ indice de Stoddart & Taylor

d(dados1, lev="alpha", q = 2, boot=TRUE, boot.arg=list(num.iter=1000))

# ============ indice de Simpson 
 
H(dados1, lev="alpha", q = 2, boot=TRUE, boot.arg=list(num.iter=1000)) 








