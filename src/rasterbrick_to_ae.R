# project rasterbricks into albers equal area based on a tiff that has been reprojected already (called aea)

rasterbrick_to_aea <- function( brick_input ) {
  brick_input %>%
    projectRaster(. , proj4string(aea)) %>%
    return(.)
}