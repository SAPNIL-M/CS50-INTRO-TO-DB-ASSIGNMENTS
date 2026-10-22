-- Hits are great, but so are RBIs!
-- In 12.sql, write a SQL query to find the players among both the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
-- * Your query should return two columns, one for the players' first name and one for their last name.
-- * You can calculate a player's salary per RBI by dividing their 2001 salary by their 2001 RBI.
-- * Ensure you filter out players with 0 hits and players with 0 RBIs.
-- * Order your results by player ID (ascending) or alphabetically by last name (ascending).
SELECT "first_name","last_name"
FROM "players"
WHERE "id" IN (
    SELECT "p"."id"
    FROM "players" "p"
    JOIN "salaries" "s" ON "s"."player_id" = "p"."id"
    JOIN "performances" "pr" ON "pr"."player_id" = "p"."id" AND "pr"."year" = "s"."year"
    WHERE "s"."year" = '2001' AND "pr"."H" != '0'
    ORDER BY ("s"."salary" / "pr"."H")
    LIMIT 10
) AND "id" IN (
    SELECT "p"."id"
    FROM "players" "p"
    JOIN "salaries" "s" ON "s"."player_id" = "p"."id"
    JOIN "performances" "pr" ON "pr"."player_id" = "p"."id" AND "pr"."year" = "s"."year"
    WHERE "s"."year" = '2001' AND "pr"."RBI" > '0'
    ORDER BY ("s"."salary" / "pr"."RBI")
    LIMIT 10
)
ORDER BY "id";