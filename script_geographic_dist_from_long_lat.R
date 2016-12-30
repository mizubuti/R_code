# ****************************************************************************
# script for calculating Great circle (geographic) distance from coordinates
# 
# input --> a text file with three columns: 
#   1st - isolate (do not label this column) see example below
#   2nd - longitude; 
#   3rd - latitude;
#   if the coordinates are in decimal notation then move to the second half
#   of the script. The first part will convert from angles, minutes sec to
#   decimal
# ********************************************************* E.M. 30/12/2016 **

setwd("/home/mizubuti/Google_Drive/fip-680/landscape_genetics") # sala
setwd("~/GoogleDrive_mizubuti/fip-680/landscape_genetics")      # mac
setwd("~/mizubuti@gmail.com/fip-680/landscape_genetics")        # casa

library(measurements)

# first part: converting coordinates in angle, minutes, seconds to decimals
#     if your data are already in decimal degrees --> jump ahead
#     longitude and latitude data can be formatted either with
#     or without seconds. 
#     You can adjust for the right format in the arguments of the function "conv_unit"
#
#     example data input:
#
#  	  long  lat
# Isol1	-30°25.264' -9°01.331'
# Isol2	-30°39.237 -8°10.811
# Isol3	-31°37.760 -8°06.040
# Isol4	-31°41.190 -8°06.557
# Isol5	-31°41.229 -8°06.622
# Isol6	-31°38.891 -8°06.281


coord <- read.table("coord_angle_format.txt", header = TRUE, stringsAsFactors = FALSE)  # data file in deg min format
coord <- read.table("maptest_corrigido_2.txt", header = TRUE, stringsAsFactors = FALSE) # data file in deg min sec format

# -------------------------------------------------------------------------------------
#   to process longitude, latitude data in degrees, minutes and seconds use this block
# -------------------------------------------------------------------------------------
coord$lat = gsub('°', ' ', coord$lat)
coord$long = gsub('°', ' ', coord$long)
coord$lat = gsub('\'', ' ', coord$lat)
coord$long = gsub('\'', ' ', coord$long)
coord$lat = gsub('\"', ' ', coord$lat)
coord$long = gsub('\"', ' ', coord$long)

coord$lat = as.numeric(conv_unit(coord$lat, from = 'deg_min_sec', to = 'dec_deg'))
coord$long = as.numeric(conv_unit(coord$long, from = 'deg_min_sec', to = 'dec_deg'))

# -----------------------------------------------------------------------------------
# to process longitude, latitude data in degrees with minutes only use these commands
# -----------------------------------------------------------------------------------
coord$lat = gsub('°', ' ', coord$lat)
coord$long = gsub('°', ' ', coord$long)

coord$lat = as.numeric(conv_unit(coord$lat, from = 'deg_dec_min', to = 'dec_deg'))
coord$long = as.numeric(conv_unit(coord$long, from = 'deg_dec_min', to = 'dec_deg'))


# *****************************************************************************************
# second part: calculate Great circle distance using decimal degree geographic coordinates
# *****************************************************************************************

library(fields)

# reading from an external file in dec degree system

p1 <- read.table("coord_centroid_regions.txt", header=TRUE, row.names = 1)
p2 <- read.table("coord_centroid_regions.txt", header=TRUE, row.names = 1)

# using the object with longitude and latitude created in the first part of the script 

p1 <- coord
p2 <- coord

# to get exact distance values with decimal points
# pair.dist <- rdist.earth(p1, p2, miles = FALSE, R = NULL)

# to get rounded values of geographic distance in kilometers (km)
pair.dist <- round(rdist.earth(p1, p2, miles = FALSE, R = NULL))
pair.dist


# the following functions come from the package 'geosphere' (load it first!)
# draws a polygon and calculate the centroid

pol <- rbind(c(-120,-20), c(-80,5), c(0, -20), c(-40,-60), c(-120,-20))

areaPolygon(pol)
perimeter(pol)

centroid(pol)


