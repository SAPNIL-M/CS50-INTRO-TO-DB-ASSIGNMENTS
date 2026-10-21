-- TASK:
-- Count how many different latitude values have at least one row
-- in the normals table.
-- Return only the count.
-- Hint for understanding the wording:
-- The table may not contain data for every possible whole degree of latitude.

SELECT COUNT(DISTINCT "latitude")
FROM "normals";