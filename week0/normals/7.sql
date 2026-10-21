-- TASK:
-- Find the average surface temperature for locations near the equator.
-- Include rows whose latitude is from -0.5 through 0.5, including both limits.
-- The surface temperature is stored in the "0m" column.
-- Round the average to two decimal places.
-- Name the output column:
-- "Average Equator Ocean Surface Temperature"

SELECT ROUND(AVG("0m"),2) AS "Average Equator Ocean Surface Temperature"
FROM "normals"
WHERE ("latitude" BETWEEN -0.5 AND 0.5);