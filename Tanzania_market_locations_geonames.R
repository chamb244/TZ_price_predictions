# map tanzania market locations

#install package from github
library(devtools)
install_github("editio/georeference")

# load the library
library(georeference) 

# run the function 
# # GeoNames requires a user account (free) to use their API services.
# georef(c("Arusha", "Karatu", "Taveta"), source = "geonames", inject = "username=chamb244")
# georef("Arusha", source = "geonames", inject = "username=chamb244")


georef("Rome") 
georef(c("Arusha", "Karatu", "Taveta, Tanzania"))
mypts <- georef(c("Arusha", "Karatu", "Taveta"))
mypts <- georef(c("Arusha", "Karatu", "Taveta, Tanzania"))



# run the leaflet functions
library(leaflet)
leaflet() %>%
  addTiles() %>%
  addMarkers(mypts$lon, mypts$lat)

##### geonames package #####
library(geonames)
options(geonamesUsername="chamb244")
geonames::GNsearch(name = "Taveta", country = "TZA")
#DOESN'T WORK ...

##### ggmap's geocode #####
#compare with ggmap's geocode
library(ggmap)
geocode(c("Arusha", "Karatu", "Taveta"))
mypts <- georef(c("Arusha", "Karatu", "Taveta"))
# DOESN'T WORK...

