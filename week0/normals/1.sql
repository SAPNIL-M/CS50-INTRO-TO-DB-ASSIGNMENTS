-- TASK:
-- Find the ocean temperature at the surface (0 meters deep)
-- for the coordinate 42.5 latitude, -69.5 longitude.
-- Return only the temperature value.

SELECT "0m" FROM "normals"
WHERE "latitude" = '42.5' AND "longitude" = '-69.5';