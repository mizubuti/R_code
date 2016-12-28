# ************************************************************************
# Estimating Effective Number of Genotypes using rarefaction and 
# extrapolation of species diversity (Hill numbers) 
#
# -- for details see:
#
# http://onlinelibrary.wiley.com/doi/10.1111/2041-210X.12613/full
#
# **************************************************** E.M. 15/11/2016 **


# for big raw data sets you can use R to determine genotype abundance
# using the following block of commands -- you need to adjust to your files

setwd("~/mizubuti@gmail.com/fip-680/landscape_genetics")
setwd("~/Google_Drive/fip-680/landscape_genetics")


dados1 <- read.table("dados.txt", header = T)
dados 

#Comparando amostras dos tecidos de HB no Amazonas

#Separando somente as amostras de HB no Amazonas
manaus <- subset(dados, dados$Estado=="Manaus") #Separa somente as amostras do Acre

#Separando somente as amostras de HB no Amazonas
hb_manaus <- subset(manaus, manaus$Hospedeiro=="Hevea_brasiliensis") #Separa as amostras de HB dentro do ACRE

#Calculando a abundância de cada OTU encontradas nas folhas, caules e raizes de HB no AM
ab_hb_manaus_tecido<-aggregate(hb_manaus[,8:129], list(hb_manaus$Tecido), sum)  #Calcula a abundância de cada OTU encontrada em Hevea  brasiliensis dentro de cada estado (AM ou AC) e armazena o que foi calculado em "ab_hb"

#Organizando os dados de abundância em uma lista
ab_hb_manaus_tecido <- as.matrix(ab_hb_manaus_tecido[,-1]) #Converte ab_hb_tecido de data.frame para matrix
ab_hb_manaus_tecido <- matrix(ab_hb_manaus_tecido, ncol = ncol(ab_hb_manaus_tecido), dimnames = NULL) #Cria uma matriz sem o cabeçalho das OTUs
ab_hb_manaus_tecido <- list("Caule" = c(sort(ab_hb_manaus_tecido[1,], decreasing = TRUE)), "Folha" = c(sort(ab_hb_manaus_tecido[2,], decreasing = TRUE)), "Raiz" = c(sort(ab_hb_manaus_tecido[3,], decreasing = TRUE))) #Cria uma lista onde as abundâncias são classificadas do maior para a menor
ab_hb_manaus_tecido <- lapply(ab_hb_manaus_tecido, function(x) x[x != 0]) #Exclui os zeros (OTUs ausentes)


# diversity analyses

library(iNEXT)
library(ggplot2)

# the data file should be in two (or more) columns. the first row should include the name of the location
# the other rows contain frequency data (if your dealing with abundance)
# if samples differ in size, fill the gaps with 0 so as to have a complete matrix


# the option q=c(0,1,2) calculates richness, Shannon-Wiener and Simpson diversity at once
# you can choose to use one at a time --> eg. q = 2 to get only Simpson diversity


dados_mg_ny <- read.table("mg_ny.txt", fill = TRUE)
dados_mg_ny <- read.table("mg_ny.txt", header = TRUE)

# Determining the endpoint as in Box 1
# sample size rarefaction / extrapolation

# step 1 - largest sample size
maximo <- max(sum(ab_hb_manaus_tecido$`Folha`), sum(ab_hb_manaus_tecido$`Caule`), sum(ab_hb_manaus_tecido$`Raiz`)) 

# step 2 - assuming the suggested ratio (r) = 2, multiply r by sample sizes
minimo <- min(2*sum(ab_hb_manaus_tecido$`Folha`), 2*sum(ab_hb_manaus_tecido$`Caule`), 2*sum(ab_hb_manaus_tecido$`Raiz`))

# step 3 - select the maximum value between "maximo" and "minimo" to be the endpoint
endpoint <- max(maximo,minimo)


# in the paper the endpoint was set to 125

analise1 <- iNEXT(dados_mg_ny, q=c(0,1,2), datatype="abundance", endpoint=156, nboot = 200)
analise1

ggiNEXT(analise1, type=3, se=TRUE, facet.var="none", color.var="site", grey=FALSE)  

coverage<-DataInfo(dados_mg_ny, datatype="abundance")
coverage

#Tentativa de mudar os eixos x e y
plot.iNEXT(analise1, type = 1, se = TRUE, show.legend = TRUE, show.main = TRUE, col = NULL, 
xlab="Number of isolates", ylab="sample coverage")



# Sample-size-based R/E curves, separating by "site""
ggiNEXT(analise1, type=3, facet.var="site")

# Sample-size-based R/E curves, separating by "order"
ggiNEXT(analise1, type=3, facet.var="order")

scale_y_continuous(limits = c(0,40)

# display black-white theme
ggiNEXT(analise1, type=1, facet.var="order", grey=TRUE)

#estimar valores do coverage
estimateD(dados_mg_ny, datatype = "abundance", base = "size", level = NULL,
conf = 0.95)

