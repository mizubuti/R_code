# ************************************************************************
# TESS3 for R 
# Spatial Genetics Analysis
#
# -- for details see:
#
# https://bioshock38.github.io/TESS3_encho_sen/reference/index.html
#
# **************************************************** E.M. 19/11/2016 **

library(tess3r)

# creating the matrix of individual genotypes (data entry in Structure format)
X <- read.table("/home/eduardo/mizubuti@gmail.com/fip-680/landscape_genetics/data_Ss/structure_brazil.txt")

# creating the coordinates matrix (data entry in decimal format)
coord <- read.table("/home/eduardo/mizubuti@gmail.com/fip-680/landscape_genetics/data_Ss/coord.txt")

tess_obj <- tess3(X, coord, K = 23, ploidy = 1, lambda = 1, rep = 1, W = NULL,
      method = "projected.ls", max.iteration = 200, tolerance = 1e-05,
      openMP.core.num = 1, Q.init = NULL, mask = 0, algo.copy = TRUE,
      keep = "best", verbose = FALSE)


