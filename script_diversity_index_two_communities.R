

mg_ny <- read.table("/home/eduardo/mizubuti@gmail.com/publicacoes/miller/mg_ny/mg_ny.txt")
mg_ny

# calculos com base em Gini-Simpson

H(mg_ny, lev="gamma", q = 2, boot=TRUE, gini=TRUE, boot.arg=list(num.iter=1000))

H(mg_ny, lev="alpha", q = 2, boot=TRUE, gini=TRUE, boot.arg=list(num.iter=1000))

H(mg_ny, lev="beta", q = 2, boot=TRUE, gini=TRUE, boot.arg=list(num.iter=1000))


# calculos com base em Shannon-Wiener

H(mg_ny, lev="gamma", q = 1, boot=TRUE, boot.arg=list(num.iter=1000))
H(mg_ny, lev="alpha", q = 1, boot=TRUE, boot.arg=list(num.iter=1000))
H(mg_ny, lev="beta", q = 1, boot=TRUE, boot.arg=list(num.iter=1000))
