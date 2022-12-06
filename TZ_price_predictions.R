# 221205

install.packages("terra", repos='https://rspatial.r-universe.dev')
install.packages("geodata", repos='https://rspatial.r-universe.dev')
library(geodata)
library(readxl)



setwd("C:/CIMMYT/GAIA/WP1/jordan/TZ_price_predictions")


# get TZ boundaries and price observations

w <- world(path=tempdir())
mybnd <- w[w$GID_0=="TZA",]


mydat <- read_excel("C:/DATA/Tanzania/prices/government/wholesale_prices_govt_2019_10_25.xlsx")
mypts <- vect(mydat, geom=c("lon", "lat"), crs="+proj=longlat", keepgeom=FALSE)
head(mypts)

## are these prices correlated?? 

plot(mybnd)
plot(mypts, add=TRUE)

# bring in stack
# for now get existing stack - in future, bring in from scratch using geodata package

indir <- "C:/DATA/Tanzania/Markus/"
rlist <- list.files(indir, pattern=".tif$")
r <- rast(paste0(indir,rlist))
# get the projection of the raster stack - in this case Lambert Azimuthal Equal Area
tocrs <- crs(r)

# reproject points and boundary
mypts <- project(mypts,r)
mybnd <- project(mybnd,r)

plot(r[[1]])
plot(mybnd, add=TRUE)
plot(mypts, add=TRUE)
