# ###############################################
# code for AMOVA Ralstonia solanacearum data
# ############################## 29/02/2016 #####

library(poppr)

teste <- read.genalex("/home/mizubuti/Desktop/thais_rs.csv")

splitStrata(teste) <- ~Host/Region

teste

# para fazer a analise so' por host

table(strata(teste, ~Host))


# para fazer a analise por host e region
table(strata(teste, ~Host/Region))

# amova sem correcao para clone
amova_teste <- poppr.amova(teste, ~Host/Region)
amova_teste

# amova com correcao para clone
amova_teste_cc <- poppr.amova(teste, ~Host/Region, clonecorrect = TRUE)
amova_teste_cc
