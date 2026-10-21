-- TASK:
-- Choose any coordinate in the normals table.
-- At that coordinate, return the temperatures at:
--   0 meters, 100 meters, and 200 meters deep.
-- Return the three temperature columns for your chosen coordinate.
SELECT "0m","100m","200m"
FROM "normals"
WHERE "latitude" = '42.5' AND "longitude" = '-69.5';