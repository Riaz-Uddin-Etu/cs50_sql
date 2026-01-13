-- 1.sql
-- You should start by getting a sense for how average player salaries have changed over time. In 1.sql, write a SQL query to find the average player salary by year.
-- Sort by year in descending order.
-- Round the salary to two decimal places and call the column “average salary”.
-- Your query should return a table with two columns, one for year and one for average salary.
SELECT "year", ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC;

-- 2.sql
-- Your general manager (i.e., the person who makes decisions about player contracts)
-- asks you whether the team should trade a current player for Cal Ripken Jr., a star player who’s likely nearing his retirement.
-- In 2.sql, write a SQL query to find Cal Ripken Jr.’s salary history.
-- Sort by year in descending order.
-- Your query should return a table with two columns, one for year and one for salary.
SELECT "s"."year", "s"."salary"
FROM "players" AS "p"
JOIN "salaries" AS "s"
ON "p"."id" = "s"."player_id"
WHERE "p"."first_name" = 'Cal' AND "p"."last_name" = 'Ripken'
ORDER BY "s"."year" DESC;

-- 3.sql
-- Your team is going to need a great home run hitter.
-- Ken Griffey Jr., a long-time Silver Slugger and Gold Glove award winner, might be a good prospect.
-- In 3.sql, write a SQL query to find Ken Griffey Jr.’s home run history.
-- Sort by year in descending order.
-- Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
-- Your query should return a table with two columns, one for year and one for home runs.
SELECT "f"."year", "f"."HR"
FROM "players" AS "p"
JOIN "performances" AS "f"
ON "p"."id" = "f"."player_id"
WHERE "p"."first_name" = 'Ken' AND "p"."last_name" = 'Griffey' AND "p"."birth_year" = '1969'
ORDER BY "f"."year" DESC;

-- 4.sql
-- You need to make a recommendation about which players the team should consider hiring.
-- With the team’s dwindling budget, the general manager wants to know which players were paid the lowest salaries in 2001.
--  In 4.sql, write a SQL query to find the 50 players paid the least in 2001.
-- Sort players by salary, lowest to highest.
-- If two players have the same salary, sort alphabetically by first name and then by last name.
-- If two players have the same first and last name, sort by player ID.
-- Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.
SELECT "p"."first_name", "p"."last_name", "s"."salary"
FROM "players" AS "p"
JOIN "salaries" AS "s"
ON "p"."id" = "s"."player_id"
WHERE "s"."year" = "2001"
ORDER BY "s"."salary", "p"."first_name", "p"."last_name", "s"."player_id"
LIMIT 50;

-- 5.sql
-- It’s a bit of a slow day in the office. Though Satchel no longer plays,
-- in 5.sql, write a SQL query to find all teams that Satchel Paige played for.
-- Your query should return a table with a single column, one for the name of the teams.
SELECT "t"."name"
FROM "teams" AS "t"
WHERE "t"."id" IN (
    SELECT DISTINCT "f"."team_id"
    FROM "players" AS "p"
    JOIN "performances" AS "f"
    ON "p"."id" = "f"."player_id"
    WHERE "p"."first_name" = 'Satchel' AND "p"."last_name" = 'Paige'
);

