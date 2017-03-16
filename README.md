# California_2016_Election_precinct_data
California precincts in TopoJSON format

When developing [geotuple.org](http://rhansson.github.io/geotuple/), I was looking for detailed voting district (precinct) boundaries and came across [this repository](https://github.com/datadesk/california-2016-election-precinct-maps) from the The Los Angeles Times Data Desk. They had already done an excellent job of organizing all the data, but I thought I could tidy up the geographic data just a bit for my needs.

## Results
The original shapefile data (combined counties) is *95M* while the resulting [TopoJSON](https://github.com/topojson) comes in at *10M*.
```
du -hc merged.*
1.3M	merged.dbf
4.0K	merged.prj
 93M	merged.shp
204K	merged.shx
 95M	total

$ du -h ca*
 10M	ca_precincts_topo.json
```
However, as the resulting file has been simplified a more equitable comparison is a reduction of about 50%

## Process
### ArcGIS
### PostGIS
## Issues
