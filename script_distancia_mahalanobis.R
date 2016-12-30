# *****************************************************
# script para calculo de distancia de Mahalanobis
# 
# *************************************** E.M. 19/06/10

# requer pacote "ecodist"

library(ecodist)


This function calculates a variety of dissimilarity or distance metrics. Although it duplicates the
functionality of dist() and bcdist(), it is written entirely in R, and can easily be extended to include
additional metrics. distance() was written for extensibility and understandability, and is not an
efficient choice for use with large matrices.
Usage
distance(x, method = "euclidean")

Arguments

x = matrix or data frame with rows as samples and columns as variables (such as species). 
Distances will be calculated for each pair of rows.

method = Currently 7 dissimilarity metrics can be calculated: euclidean bray-curtis manhattan
mahalanobis jaccard simple difference sorensen Partial matching will work for selecting a method.

Value
Returns a lower-triangular distance matrix as an object of class "dist".

Examples
data(iris)
iris.md <- distance(iris[,1:4], "mahal")
