-- TASK:
-- Return the 10 warmest locations in the table.
-- For each location, return its latitude, longitude, and surface temperature.
-- Sort the results from warmest to coldest.
-- If two temperatures are equal, sort those rows by latitude,
-- from smallest to largest.

SELECT "latitude","longitude","0m" AS "surface temperature"
FROM "normals"
ORDER BY "0m" DESC,"latitude"
LIMIT 10;