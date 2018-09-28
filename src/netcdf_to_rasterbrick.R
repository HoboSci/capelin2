# Function to take all netCDFs in one folder and transform into raster bricks

netcdf_to_rasterbrick <- function( ncdf_filename_input ) {
  mcdf_filename_input %>%
    file.path(../data/env/netcdf, . ) %>%
    nc_open(.) %>%
    ncvar_get(.) %>%
    brick(.) %>%
    return()
}