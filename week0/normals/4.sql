-- TASK:
-- Look at the surface-temperature value for every coordinate.
-- Find the single lowest surface temperature in the entire table.
-- The surface temperature is stored in the "0m" column.
-- Return only that one temperature value.
SELECT MIN("0m")
FROM "normals";
