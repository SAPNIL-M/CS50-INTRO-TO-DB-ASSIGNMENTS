-- In 6.sql, write a SQL query to return the first name, last name, and debut date of players born in Pittsburgh, Pennsylvania (PA). Sort by debut date (most recent to oldest), then first name, then last name.

SELECT "first_name","last_name","debut" FROM "players"
WHERE "birth_city" = 'Pittsburgh' AND "birth_state" = 'PA'
ORDER BY "debut" DESC,"first_name","last_name";