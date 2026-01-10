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

---

## 2. Filtering with Patterns

* Use `LIKE` to match patterns in strings.
* Example: finding non-operational districts:

```sql
SELECT name
FROM districts
WHERE name LIKE '%(non-op)%';
```

* `%` is a wildcard matching any sequence of characters.

---

## 3. Aggregate Functions

* SQL aggregates include `COUNT()`, `AVG()`, `SUM()`, `MIN()`, `MAX()`.
* Example: average per-pupil expenditure:

```sql
SELECT AVG(per_pupil_expenditure) AS "Average District Per-Pupil Expenditure"
FROM expenditures;
```

* Use `AS` to rename output columns for clarity.

---

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

---

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

---

## 6. Sorting and Limiting

* `ORDER BY` sorts results. Default ascending, `DESC` for descending.
* `LIMIT` restricts the number of rows returned.

---

## 7. Notes from Queries

* Always qualify columns with table names in JOINs to avoid ambiguity.
* Column names can be quoted `"name"` for safety in case of reserved words or spaces.
* Aggregation + sorting is very useful for ranking results (top 10 cities/districts).
* HAVING is necessary when filtering on aggregated values.

---

## 8. Key Takeaways

* Filtering with `WHERE` vs filtering grouped data with `HAVING`.
* Aggregates allow analyzing large datasets efficiently.
* Joins are essential to combine related data across multiple tables.
* Always test queries step by step to ensure correct results.

---

