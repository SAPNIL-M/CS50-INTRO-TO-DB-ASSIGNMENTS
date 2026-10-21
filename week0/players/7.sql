-- In 7.sql, write a SQL query to count the number of players who bat right-handed and throw left-handed, or vice versa.

SELECT COUNT(*) FROM "players"
WHERE ("bats" = 'R' AND "throws" = 'L') OR ("bats" = 'L' AND "throws" = 'R');