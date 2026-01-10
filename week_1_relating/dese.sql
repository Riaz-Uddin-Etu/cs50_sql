-- write a SQL query to find the names and cities of all public schools in Massachusetts.
SELECT name, city
FROM schools
WHERE type = 'Public School';

-- write a SQL query to find the names of districts that are no longer operational.
SELECT name
FROM districts
WHERE name LIKE '%(non-op)%';

-- In 3.sql, write a SQL query to find the average per-pupil expenditure. Name the column “Average District Per-Pupil Expenditure”.
SELECT AVG("per_pupil_expenditure") AS "Average District Per-Pupil Expenditure"
FROM "expenditures";

--  In 4.sql, write a SQL query to find the 10 cities with the most public schools.
-- Your query should return the names of the cities and the number of public schools within them,
-- ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.
SELECT city, COUNT("name") AS "Number of School"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY city
ORDER BY "Number of School" DESC, city
LIMIT 10;

-- In 5.sql, write a SQL query to find cities with 3 or fewer public schools.
-- Your query should return the names of the cities and the number of public schools within them,
-- ordered from greatest number of public schools to least. If two cities have the same number of public schools, order them alphabetically.
SELECT "city", COUNT("names") as "Number_of_Public_Schools"
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING COUNT("names") <= 3
ORDER BY "Number_of_Public_Schools" DESC, "city";

-- In 6.sql, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.
SELECT "schools"."name"
FROM "schools"
JOIN "graduation_rates"
ON "schools"."id" = "graduation_rates"."school_id"
WHERE "graduated" = '100';

-- . In 7.sql, write a SQL query to find the names of schools (public or charter!) in the Cambridge school district.
-- Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”
SELECT "schools"."name"
FROM "districts"
JOIN "schools"
ON "districts"."id" = "schools"."district_id"
WHERE "districts"."name" = 'Cambridge';

-- in 8.sql, write a SQL query to display the names of all school districts and the number of pupils enrolled in each.
SELECT "districts"."name", "expenditures"."pupils"
FROM "districts"
JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id";

--  In 9.sql, write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).
SELECT "districts"."name"
FROM "districts"
JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id"
ORDER BY "expenditures"."pupils"
LIMIT 1;

-- In 10.sql, write a SQL query to find the 10 public school districts with the highest per-pupil expenditures.
-- Your query should return the names of the districts and the per-pupil expenditure for each.
SELECT "districts"."name", "expenditures"."per_pupil_expenditure"
FROM "districts"
JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id"
WHERE "districts"."type" = 'Public School District'
ORDER BY "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;
