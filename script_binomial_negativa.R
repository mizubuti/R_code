# **************************************************************
# script para testar ajuste da distribuicao binomial negativa. 
# o parametro k e' estimado por maxima verossimilhanca
# o programa testa, por chi-quadrado se o a distr. bin. negat
# ajusta aos dados
# **************************************************************

# estimando parametros da distrib. bin. negativa

dados_brutos <- read.table("/home/mizubuti/Desktop/teste_chris.txt")

# formatar como matrix (vetor)

dados <- as.matrix(dados_brutos)

estimativas <- fitdistr(dados, "negative binomial")

estimativas

# qui-quadrado para testar o ajuste da distrib. binomial negativa
# se o p-value for maior que 0,05, aceita H0: mesma distribuicao

# os valores de size (=k) e mu sao obtidos do objeto estimativas
# ainda tenho que pensar em um jeito de obter os valores automaticamente
# do objeto "estimativas" para evitar digitar -- talvez usar coef???

chisq.test(x, y=rnbinom(30, size=0.165, mu=5.667))


