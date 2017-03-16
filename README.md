# California_2016_Election_precinct_data
California precincts in TopoJSON format

When developing [geotuple.org](http://rhansson.github.io/geotuple/), I was looking for detailed voting district (precinct) boundaries and came across [this repository](https://github.com/datadesk/california-2016-election-precinct-maps) from the __The Los Angeles Times Data Desk__. They had already done an excellent job of organizing all the information, but I thought I could tidy up the geographic data just a bit for my needs.

## Results
The original shapefile data (*not provided in this repo*) is __95M__ while the resulting [TopoJSON](https://github.com/topojson) comes in at __*10M*__.
```
$ du -hc merged.*
1.3M	merged.dbf
4.0K	merged.prj
 93M	merged.shp
204K	merged.shx
 95M	total

$ du -h ca*
 10M	ca_precincts_topo.json
```
However, as the resulting file has been simplified, a more equitable comparison is a reduction of about 50%

## Process
The main objective is to simplify the polygon geometry, by reducing #coordinates, and to take advantage of the topology encoding provided by TopoJSON. Secondly, to load the data into a PostGIS db.

### Prerequisites
I used the following tools:
+ [OGR/GDAL](http://www.gdal.org/ogr2ogr.html)
+ [TopoJSON CLI](https://github.com/topojson/topojson/blob/master/README.md#api-reference)
+ [ArcGIS](http://desktop.arcgis.com/en/)
+ [PostGIS](http://postgis.net/)

#### ArcGIS
[_Eliminate_](http://desktop.arcgis.com/en/arcmap/10.3/tools/coverage-toolbox/eliminate.htm)

#### Loading data into PostGIS
The first step is to extract the relevant precinct voting information from the original csv file (*not provided in this repo*): 
```
$ head -24569 all_precinct_results.csv > all_precinct_results2.csv
```
We can then import this file into the table __precinct_results__ by executing the SQL script __import_precincts.sql__:
```
# \i postgis/import_precincts.sql
# SELECT COUNT(*) FROM precinct_results;
 count 
-------
 24568
(1 row)
```
Secondly, we import the precinct boundaries into the table __precinct__ using OGR (optionally projecting back to WSG84):
```
$ ogr2ogr -f PostgreSQL PG:"dbname='YOUR_NAME' user='YOUR_USER' password='YOUR_PW'" -nln precinct -select "pct16" -lco GEOM_TYPE="geography" -lco GEOMETRY_NAME=geog -s_srs EPSG:3310 -t_srs "EPSG:4326" ca_precincts_topo.json
```
We can now access the voting data spatially via a join:
```
# SELECT b.pres_trump_per FROM precinct a INNER JOIN precinct_results b ON a.pct16=b.pct16 WHERE a.pct16 = '037-7300001A';
 pres_trump_per 
----------------
            100
(1 row)
```

## Issues
* Attempting to convert the unsimplified shapefile to TopoJSON failed:
```
$ ogr2ogr -f "GeoJSON" merged.geojson -t_srs EPSG:3310 merged.shp
$ geo2topo pct16=merged.geojson > merged.topojson
 buffer.js:495
    throw new Error('"toString()" failed');
```
*Presumably due to too many coordinates*. [Potential limitation in nodejs](https://github.com/nodejs/node/issues/3175)
Simplifying the input fixes the problem:
```
$ ogr2ogr -f "GeoJSON" merged.geojson -simplify 5 -t_srs EPSG:3310 merged.shp
```
