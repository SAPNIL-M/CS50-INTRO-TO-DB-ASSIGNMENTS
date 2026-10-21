-- TASK:
-- Find every coordinate inside this rectangle:
--   latitude from 0 through 20
--   longitude from 55 through 75
-- This rectangle represents the Arabian Sea for this problem.
-- For every matching coordinate, return:
--   1. latitude
--   2. longitude
--   3. temperature at 50 meters deep
-- Return all matching rows, not just one row.

SELECT "latitude", "longitude", "50m"
FROM "normals"
WHERE ("latitude" BETWEEN 0 AND 20) AND ("longitude" BETWEEN 55 AND 75);