# ****************************************************************************
# script for calculating Great circle (geographic) distance from coordinates
# 
# input --> a text file with two columns: 1st - longitude; 2nd - latitude
#   if the coordinates are in decimal notation then move to the second half
#   of the script. The first part will convert from angles, minutes sec to
#   decimal
# ********************************************************* E.M. 30/11/2016 **

setwd("/home/mizubuti/Google_Drive/fip-680/landscape_genetics") # sala
setwd("~/GoogleDrive_mizubuti/fip-680/landscape_genetics")      # mac
setwd("~/mizubuti@gmail.com/fip-680/landscape_genetics")        # casa


# first part: converting coordinates in angle, minutes, seconds to decimals
#     if your data are already in decimal degrees --> jump ahead

library(measurements)

coord <- read.table("/home/mizubuti/Google_Drive/fip-680/landscape_genetics/coord_angle_format.txt", 
                    header = TRUE, stringsAsFactors = FALSE)

coord$lat = gsub('°', ' ', coord$lat)
coord$long = gsub('°', ' ', coord$long)

coord$lat = as.numeric(measurements::conv_unit(coord$lat, from = 'deg_dec_min', to = 'dec_deg'))
coord$long = as.numeric(measurements::conv_unit(coord$long, from = 'deg_dec_min', to = 'dec_deg'))


# second part: calculate Great circle distance using decimal degree geographic coordinates

library(fields)

# reading from an external file in dec degree system

p1 <- read.table("coord_centroid_regions.txt", header=TRUE, row.names = 1)
p2 <- read.table("coord_centroid_regions.txt", header=TRUE, row.names = 1)

# using the objects created in the first part of the script

p1 <- coord
p2 <- coord


# to get exact distance values with decimal points
# pair.dist <- rdist.earth(p1, p2, miles = FALSE, R = NULL)

# to get rounded values of geographic distance
pair.dist <- round(rdist.earth(p1, p2, miles = FALSE, R = NULL))
pair.dist


# the following functions come from the package 'geosphere' (load it first!)
pol <- rbind(c(-120,-20), c(-80,5), c(0, -20), c(-40,-60), c(-120,-20))

areaPolygon(pol)
perimeter(pol)

centroid(pol)


