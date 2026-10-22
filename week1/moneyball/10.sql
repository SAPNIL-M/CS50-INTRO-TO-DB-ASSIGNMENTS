-- The general manager has asked you for a report which details each player's name, their salary for each year they've been playing, and their number of home runs for each year they've been playing.
-- In 10.sql, write a SQL query to answer this question.
-- * Return the player's first name, last name, salary, home runs, and the year they achieved those numbers.
-- * Sort by player ID (ascending), then by year (descending), then by HR (descending), then by salary (descending).

SELECT "p"."first_name","p"."last_name","s"."salary","pr"."HR","pr"."year"
FROM "players" "p"
JOIN "salaries" "s" ON "s"."player_id" = "p"."id"
JOIN "performances" "pr" ON "pr"."player_id" = "p"."id" AND "pr"."year" = "s"."year"
ORDER BY "p"."id","pr"."year" DESC,"pr"."HR" DESC,"s"."salary" DESC;