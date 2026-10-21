-- TASK:
-- At the coordinate 42.5 latitude, -69.5 longitude,
-- find the temperature recorded by the deepest sensor.
-- The deepest sensor is 225 meters below the surface.
-- Return only the temperature value.

SELECT "225m"
FROM "normals"
WHERE "latitude" = '42.5' AND "longitude" = '-69.5';