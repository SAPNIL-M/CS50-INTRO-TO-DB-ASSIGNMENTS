-- In hack.sql, write a sequence of SQL statements to achieve the following:
-- 1. Alter the password of the website's administrative account, "admin", to instead be "oops!".
--    (Note: passwords in "users" are MD5 hashed; the MD5 hash for "oops!" is 'e76b539c3686861574df61414e2669a9')
-- 2. Erase any logs of the above password change recorded by the database in "user_logs".
-- 3. Add false data to throw others off your trail. Specifically, frame "emily33" by making it appear
--    in the "user_logs" table as if the "admin" account had its password changed to "emily33"'s password.

