install.packages("RCurl")
library(RCurl)
library(jsonlite)
station_link  <-  'https://gbfs.citibikenyc.com/gbfs/en/station_status.json'
apiOutput  <-  getURL(station_link)
apiData  <-  fromJSON(apiOutput)
stationStatus  <-  apiData$data$stations
cols  <-  c('num_bikes_disabled','num_docks_disabled',  'station_id', 'num_ebikes_available', 'num_bikes_available',  'num_docks_available')
stationStatus  =  stationStatus[,cols]

# Question 1
# This is a JSON file with keys and values.

# Question 2
# station_link  <-  'https://gbfs.citibikenyc.com/gbfs/en/station_status.json'
# The URL of JSON data.

# apiOutput  <-  getURL(station_link)
# Grab the JSON data.

# apiData  <-  fromJSON(apiOutput)
# Parse the data.

# stationStatus  <-  apiData$data$stations
# See the stations from data.

# cols  <-  c('num_bikes_disabled','num_docks_disabled',  'station_id', 'num_ebikes_available', 'num_bikes_available',  'num_docks_available')
# Keep a subset of this colums.

# stationStatus  =  stationStatus[,cols]
# Only view the column from data.

# Question 3
str(apiData)
str(apiOutput)
# apiData shows the structure of dataframe and apiOutput shows the vectors.

# Question 4
prettify(apiOutput)
# It arrange them into each set by using {}.

# Question 5
# Object type is num & chr.
# Stations are installed? Number of disabled docks? Number of disabled bikes? Eightd has available keys? Number of docks are available. Rented? Number of ebikes are available? Last report conditons. Returned? The station id. Legacy id. The station status. Number of bikes are available.

# Question 6
hist(stationStatus$num_docks_available)

# Quesetion 7
hist(stationStatus$num_bikes_available)

# Question 8
ebikesAvailDF <- stationStatus[stationStatus$num_ebikes_available > 0,]
nrow(ebikesAvailDF)
# 301

# Question 9
library(tidyverse)
view(ebikesAvailDF)

# Question 10
mean(ebikesAvailDF$num_ebikes_available)
# 1.408638

# Question 11
mean(stationStatus$num_ebikes_available)
# 0.2686946, that data is different, one flitered out stations don't have ebikes.

# Question 12
stationSize <- stationStatus[stationStatus$num_bikes_available + stationStatus$num_bikes_disabled + stationStatus$num_docks_available + stationStatus$num_docks_disabled + stationStatus$num_ebikes_available]

# Question 13
plot(stationStatus$num_docks_available,stationStatus$num_bikes_available)
# In most stations, number of available bikes should close to the occupied docks; however, from the plot we can see that there are some stations shows most bikes are disabled or damaged. The other cases are people did not put bikes into the docks... because none occupied docks but large number of bikes are available.