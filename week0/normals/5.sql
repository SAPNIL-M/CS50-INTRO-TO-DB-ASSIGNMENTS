-- TASK:
-- Look at the surface-temperature value for every coordinate.
-- Find the single highest surface temperature in the entire table.
-- The surface temperature is stored in the "0m" column.
-- Return only that one temperature value.
SELECT MAX("0m")
FROM "normals";