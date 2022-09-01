install.packages("maps")
install.packages("ggmap")
install.packages("mapproj")

library(ggplot2)
library(maps)
library(ggmap)
library(mapproj)

# Question 1
us <-  map_data("state")
# Load USA state map data.
map <-  ggplot(us)
# Strat creating map of USA.
map <-  map +  aes(x=long,  y=lat, group=group) +  geom_polygon()
# Creating the map by adding longitude to X and latitude to Y, also use polygon as its shape.
map <-  map +  coord_map()  + ggtitle("USA Map")
# Onto a flat 2D plane using any projection defined by the mapproj package and make it a title called "USA Map".
map
# Show the map.

# Question 2
us <-  map_data("state")
map <-  ggplot(us)
map <-  map +  aes(x=long,  y=lat, group=group) +  geom_polygon(color="black", fill="white")
map <-  map +  coord_map()  + ggtitle("USA Map")
map

# Question 3
ny_counties <-  map_data("county","new york")
ggplot(ny_counties) +  aes(long,lat, group=group) +  geom_polygon(color="black", fill="white")

# Question 4
head(ny_counties)
view(ny_counties)

# Question 5
ny_counties <-  map_data("county","new york")
ggplot(ny_counties) +  aes(long,lat, group=group) +  geom_polygon(color="black", fill="white") + coord_map(projection = "mercator")
# It sets the aspect ratio of the plot to the appropriate lat/lon ratio. On a map drawn in this projection, the lines of latitude and longitude intersect vertically at any position, allowing the world map to be drawn on a rectangle.

# Question 6
nyData <- read_csv("https://intro-datascience.s3.us-east-2.amazonaws.com/nyData.csv")
head(nyData)

# Question 7
mergeNY <- merge(ny_counties, nyData, all.x=TRUE, by.x="subregion", by.y="county")

# Question 8
head(mergeNY)

# Question 9
ggplot(mergeNY) +  aes(long,lat, group=group) +  geom_polygon(color="black", aes(x=long, y=lat, group=group, fill=pop2000)) + coord_map(projection = "mercator")