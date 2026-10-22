-- It’s a well-known strategy in baseball to consider how a player’s performance changes over time:
-- an older player may not be able to hit or run as well as a younger player.
-- In 5.sql, write a SQL query to find all teams that Satchel Paige played for.
-- * Your query should return a table with a single column, one for the name of the teams.

SELECT "name" FROM "teams"
WHERE "id" IN (
    SELECT "team_id" FROM "performances"
    WHERE "player_id" = (
        SELECT "id" FROM "players"
        WHERE "first_name"='Satchel' AND "last_name" = 'Paige'
    )
);
