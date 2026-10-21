-- TASK:
-- Return the 10 coldest locations in the table.
-- For each location, return its latitude, longitude, and surface temperature.
-- Sort the results from coldest to warmest.
-- If two temperatures are equal, sort those rows by latitude,
-- from smallest to largest.
SELECT "latitude","longitude","0m" AS "surface temperature"
FROM "normals"
ORDER BY "0m","latitude"
LIMIT 10;