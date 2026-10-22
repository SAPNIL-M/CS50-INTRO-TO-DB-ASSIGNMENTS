-- Your team is going to need a great home run hitter. Ken Griffey Jr.'s name keeps coming up, so you want to look at his home run history.
-- In 3.sql, write a SQL query to find Ken Griffey Jr.'s home run history.
-- * Sort by year in descending order.
-- * Note that there may be two players with the name "Ken Griffey" in the database: this one was born in 1969.
-- * Your query should return a table with two columns, one for year and one for home runs (HR).

SELECT "year","HR" FROM "performances"
WHERE "player_id" = (
    SELECT "id" FROM "players"
    WHERE ("first_name" = 'Ken' AND "last_name" = 'Griffey') AND "birth_year" = '1969'
)
ORDER BY "year" DESC;