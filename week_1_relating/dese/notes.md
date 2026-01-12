# Week 1 – CS50 SQL Notes

## 1. Basic SELECT Queries

* Use `SELECT` to retrieve specific columns.
* Example:

```sql
SELECT name, city
FROM schools
WHERE type = 'Public School';
```

* `WHERE` filters rows based on conditions.

## 2. Filtering with Patterns

* Use `LIKE` to match patterns in strings.
* Example: finding non-operational districts:

```sql
SELECT name
FROM districts
WHERE name LIKE '%(non-op)%';
```

* `%` is a wildcard matching any sequence of characters.

## 3. Aggregate Functions

* SQL aggregates include `COUNT()`, `AVG()`, `SUM()`, `MIN()`, `MAX()`.
* Example: average per-pupil expenditure:

```sql
SELECT AVG(per_pupil_expenditure) AS "Average District Per-Pupil Expenditure"
FROM expenditures;
```

* Use `AS` to rename output columns for clarity.

## 4. GROUP BY and HAVING

* `GROUP BY` groups rows to perform aggregation per group.
* `HAVING` filters aggregated groups (like WHERE but for groups).
* Examples:

```sql
SELECT city, COUNT(name) AS "Number of School"
FROM schools
WHERE type = 'Public School'
GROUP BY city
ORDER BY "Number of School" DESC, city
LIMIT 10;
```

```sql
SELECT city, COUNT(name) AS "Number_of_Public_Schools"
FROM schools
WHERE type = 'Public School'
GROUP BY city
HAVING COUNT(name) <= 3
ORDER BY "Number_of_Public_Schools" DESC, city;
```

## 5. JOINs

* Use `JOIN` to combine tables on related columns.
* Example: find schools with 100% graduation rate:

```sql
SELECT schools.name
FROM schools
JOIN graduation_rates
ON schools.id = graduation_rates.school_id
WHERE graduated = '100';
```
* Types of JOINs: `INNER JOIN` (default), `LEFT JOIN`, `RIGHT JOIN`.

## 6. Sorting and Limiting

* `ORDER BY` sorts results. Default ascending, `DESC` for descending.
* `LIMIT` restricts the number of rows returned.

## 7. Notes from Queries

* Always qualify columns with table names in JOINs to avoid ambiguity.
* Column names can be quoted `"name"` for safety in case of reserved words or spaces.
* Aggregation + sorting is very useful for ranking results (top 10 cities/districts).
* HAVING is necessary when filtering on aggregated values.

## 8. Subqueries

* Subqueries can be used to compute values for filtering, aggregation, or comparison.
* Example: find districts with above-average per-pupil expenditure:

```sql
WHERE e.per_pupil_expenditure > (
    SELECT AVG(per_pupil_expenditure)
    FROM expenditures
)
```

## 9. New Queries (11–13)

### Query 11 – Schools with Per-Pupil Expenditure and Graduation Rate

```sql
SELECT schools.name, expenditures.per_pupil_expenditure, graduation_rates.graduated
FROM schools
JOIN graduation_rates ON schools.id = graduation_rates.school_id
JOIN expenditures ON schools.district_id = expenditures.district_id
ORDER BY expenditures.per_pupil_expenditure DESC, schools.name;
```

* Combines **3 tables** with JOINs.
* Sorts by per-pupil expenditure, breaking ties alphabetically by school name.

### Query 12 – Above-Average Expenditure & Exemplary Teachers

```sql
SELECT d.name, e.per_pupil_expenditure, s.exemplary
FROM districts AS d
JOIN expenditures AS e ON d.id = e.district_id
JOIN staff_evaluations AS s ON d.id = s.district_id
WHERE e.per_pupil_expenditure > (SELECT AVG(per_pupil_expenditure) FROM expenditures)
  AND s.exemplary > (SELECT AVG(exemplary) FROM staff_evaluations)
  AND d.type = 'Public School District'
ORDER BY s.exemplary DESC, e.per_pupil_expenditure DESC;
```

* Uses **subqueries** to compare values against averages.
* Combines filtering, JOINs, and sorting in one query.

### Query 13 – Total Expenditure per District

```sql
SELECT d.name, (e.pupils * e.per_pupil_expenditure) AS total_expenditure_on_pupil
FROM districts AS d
JOIN expenditures AS e ON d.id = e.district_id;
```

* Introduces **calculations in SELECT** (`pupils * per_pupil_expenditure`).
* Can answer questions like “Which district spends the most overall on students?”

## 10. Key Takeaways
* Filtering with `WHERE` vs filtering grouped data with `HAVING`.
* Aggregates allow analyzing large datasets efficiently.
* Joins are essential to combine related data across multiple tables.
* Always test queries step by step to ensure correct results.
* JOINs are essential for combining related data across multiple tables.
* Subqueries allow dynamic filtering based on aggregated data (like averages).
* Calculations can be performed directly in SELECT statements.
* Sorting with multiple columns allows precise ranking.
* Aggregation + HAVING + JOIN + calculation can answer complex real-world questions.
