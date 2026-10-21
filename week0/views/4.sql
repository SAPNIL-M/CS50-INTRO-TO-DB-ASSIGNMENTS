-- In 4.sql, write a SQL query to count how many prints by Hiroshige have English titles that refer to the "Eastern Capital".

SELECT COUNT("english_title") FROM "views"
WHERE "english_title" LIKE '%Eastern Capital%' AND "artist" = 'Hiroshige';