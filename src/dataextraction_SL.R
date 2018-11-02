# load the netcdf and raster packages
library(ncdf4)
library(raster)


# The data are held in netCDF files. We don't work directly with the netCDFs in R. Instad we load a netcdf file and convert it to a raster brick so we can work with it. In this example the netCDF I'll # # use is called '1993_01_salinity.nc'.I've sent it to you in the email with this code.
nc <-  "1993_01_salinity.nc" # change the file path to where ever your netcdfs are saved
rasbr <- brick(nc,lvar = 4) #lvar = 4 is used because the netCDF contains four dimensions. Without this command, the raster brick will only have one level (the top one, which is my surface data)
rasbr # this will give you some information about the raster brick

# We no longer care that the data originated from a netCDF file. Everything now is done with the raster brick.

# We can plot the different layers (which represent depth) inside the raster brick.

#SL: gonna check some stuff on nc
print(nc)
nc2 <- nc_open(nc)
attributes(nc2$var)
data <- ncvar_get(nc2, attributes(nc2$var)$names[1]) #get salinity data
dim(data)

# Plot the top layer
plot(rasbr[[1]]) #the double brackets tell R which layer to plot

# plot layer 20
plot(rasbr[[20]])

# If you look back to the output of 'rasbr' and look at 'coord. ref.', you can see that the CRS (coordinate reference system) is in WGS84 (+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0)


# Because I am using these files for Maxent, I need the projection to be an albers equal area. We can project the whole raster brick. There are a couple of ways to do this, but the simplest way is to use an existing file in the projection I want. The file I will use for this is called aea.tif. I've sent it to you in the email with this code as a zip. Note that there are two files in the zip folder - # you will need both (but you only call on the .tif in the code)
aea <- raster("aea.tif") # change the file path to where ever the tif and .twf files are saved
rasbr_aea <- projectRaster(rasbr, aea)
plot(rasbr_aea[[1]]) # just to look at the top layer of the raster brick after projection so you can see the difference


# The next piece of data we need is the observation data itself. I've sent you the observations.csv in the email with this code.
obs <- read.csv("observations3.csv") #change this path to your .csv location
head(obs)

# A note about obs$depth. This is not a measurement, but relates to the layer in the raster bricks. E.G. the observation in row one was found at rasbr[[15]], the observation in row 3 at rasbr[[17]]. I created this field myself.

# The lon and lat represent meters as oppose to decimal degrees so it is 'albers equal area' ready.
# For this exercise, I'm going to ignore year, month, and depth and just do a straightforward extract to points.

# First we need to convert 'obs' into a 'spatialpoints dataframe'
xy <- obs[ ,c(4,5)] # This is to tell R where the coordinates are (in column 4 and 5). Note that the column order needs to be longitude, latitude
obssp <- SpatialPointsDataFrame(coords = xy, data = obs, proj4string = CRS("+proj=aea +lat_1=50 +lat_2=70 +lat_0=40 +lon_0=-60 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs")) # The CRS is used here is for the albers equal area projection.
obssp


# We can plot the observations on any layer of the 'rasbr_aea ' brick
plot(rasbr_aea[[10]]) #plot layer 1 - the top layer
points(obssp$lon, obssp$lat)


# The code to extract the valuees from any layer in 'rasbr_aea' is very simple
obssp$salinity <- extract(x=rasbr_aea[[1]], y = obssp) #extract from the top layer of the rasbr_aea and add to the obssp dataset in a new column called salinity
head(obssp) # just to take a look at the output

################################################
#SL I AM DOING SOME STUFF HERE :O) 
#THE ABOVE EXTRACTION IS THE HOOK UP. I WANT TO EXTRACT FOR A CERTAIN DEPTH DEFINED BY OBSSP IN ORDER TO AUTOMATE THIS. THIS MEANS YOU NEED
#TO MAKE [[]] LINKED TO DEPTH...LET'S SEE IF WE CAN DO THIS NOW.
obssp$salinity2 <- extract(x=rasbr_aea[[obssp$depth]], y = obssp)
#Ok, the above is close but not right. It is printing salinity for depths 15, 22, 17, 18, 15, 16, 16 for each observation record.
#At least this is what I think. Let's check it out.
obssp$salinity22 <- extract(x=rasbr_aea[[22]], y = obssp) #I expect this to be 33.42. Yep.
############### Starting over now I have created a smaller observation file with only 3 records. 
#Gonna create a loop here and iterate over the depths listed in the observation file
Data_Loop <-NULL #Gonna put my loop data in here
for (i in obssp$depth) { #cycle through values in depth column (15, 22, 17)
  #this is the equation you will be calculating for every value of y
  sal <- extract(x=rasbr_aea[[i]], y = obssp) #create a data list
  
  #Put your data in a data frame. Don't forget to enclose this within the loop!
  Data_Loop <- rbind(Data_Loop, data.frame(depth=i, year=obssp$year, month=obssp$month, lon=obssp$lon, lat=obssp$lat, Salinity=sal))
  
  #print the i value so you can track progress. Good for longer loops
  print(i)
  #Close the loop
  }
Data_Loop
############SL: TRY IT ANOTHER WAY. Problem is that we need to tell x to be at specific depth as specified by obssp$depth and y to be only the lat and lon at that depth.
#The two examples here (one above and one below) are VERY close. Just a matter of tweaking and playing around a bit more. See if you can figure it out.
Data_Loop <-NULL #Gonna put my loop data in here
for (i in 1:length(obssp)) { #cycle through values in depth column (15, 22, 17)
  #this is the equation you will be calculating for every value of y
  sal <- extract(x=rasbr_aea[[obssp$depth[i]]], y = obssp[i,]) #go with i row in obssp
  
  #Put your data in a data frame. Don't forget to enclose this within the loop!
  Data_Loop <- rbind(Data_Loop, data.frame(depth=obssp$depth, year=obssp$year, month=obssp$month, lon=obssp$lon, lat=obssp$lat, Salinity=sal))
  
  #print the i value so you can track progress. Good for longer loops
  print(i)
  #Close the loop
}
Data_Loop



# I can write this 'spatialpoints dataframe' to a .csv and convert it back to a 'normal dataframe'.
write.csv(obssp, file = "../output/bio/observations_sal.csv", row.names = FALSE) # change the path to where ever you would like to save it
obs <- as.data.frame(obssp) # this coverts the 'spatialpoints dataframe' to a 'normal dataframe'
obs # just to take a look at the output

# for some reason converting the 'spatialpoints dataframe' to a 'normal dataframe' adds a duplicate lon and lat column (the write.csv function does the same). I don't know why, but they are easy to remove so I am not worried about it.
