-- You need a list of players worth their pay.
-- In 11.sql, write a SQL query to find the 10 least expensive players per hit in 2001.
-- * Your query should return a table with three columns, one for the players' first name, one for their last name, and one called "dollars per hit" for their salary divided by the number of hits they had in 2001.
-- * You can calculate the "dollars per hit" by dividing the player's 2001 salary by the number of hits they made in 2001.
-- * Dividing by zero is not possible in SQL, so ensure you filter out players with 0 hits.
-- * Sort by dollars per hit (least expensive to most expensive). If two players have the same dollars per hit, sort by first name, then last name.
-- * Limit results to the top 10.
SELECT "p"."first_name","p"."last_name",("s"."salary" / "pr"."H") AS "dollars per hit"
FROM "players" "p"
JOIN "salaries" "s" ON "s"."player_id" = "p"."id"
JOIN "performances" "pr" ON "pr"."player_id" = "p"."id" AND "pr"."year" = "s"."year"
WHERE "s"."year" = '2001' AND "pr"."H" != '0'
ORDER BY "dollars per hit","p"."first_name","p"."last_name"
LIMIT 10;