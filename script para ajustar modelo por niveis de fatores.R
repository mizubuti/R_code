####################################################################
# script para fazer operacao ou ajustar modelo por
# niveis de um fator
# ex.: ajusta modelo exponencial de area ~ dia, por isol, esp, temp
#################################################### E.M. 07/01/2012


by(dados, list(dados$isol, dados$esp, dados$temp), function(x) nls(area~a*exp(b*dia), data=x))

# outra opcao

# usar o comando nlsList

teste <- nlsList(area~a*exp(b*dia)|esp/isol/hosp/temp, data=dados, start=list(a=1, b=0.1))
teste



