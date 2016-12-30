# ***************************************************** #
# script for Fisher exact test
# os dados são: 
# Número de isolados de C. boninense no Amazonas = 3
# Número de isolados de C. gloeosporioides no Amazonas = 99
# Número isolados de C. boninense no Acre = 12
# Número de isolados de C. gloeosporioides no Acre = 58
# Número de isolados de C. boninense em H. brasiliensis = 6
# Número de isolados de C. boninense em H. guianensis = 6
# Número isolados de C. gloeosporioides em H. brasiliensis = 31
# Número de isolados de C. gloeosporioides H. guianensis = 27
#
# ***************************************************** #

estado <- as.matrix(c(58,12,99,3))
estado <- dim(c(2,2))
estado

fisher.test(estado)


hospedeiro <- as.matrix(c(6,31,6,27))
dim(hospedeiro) <- c(2,2)
hospedeiro

fisher.test(hospedeiro)