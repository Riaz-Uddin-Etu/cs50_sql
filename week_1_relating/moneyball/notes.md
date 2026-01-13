# CS50’s Introduction to Databases with SQL — Moneyball Problem

These notes track my ongoing work on the **Moneyball** problem set from *CS50’s Introduction to Databases with SQL*. The goal is to document progress, query intent, and key SQL concepts used along the way. This file will be updated incrementally as more queries are completed.

## Progress Log

**Status:** Queries 1–5 completed

This phase focused on reading data, joining tables, aggregation, filtering, and ordering results correctly according to business-style questions.

## Query Notes

### 1.sql — Average Player Salary by Year

**Objective:** Understand how player salaries change over time.

**What this query does:**

* Aggregates salary data by year using `AVG()`.
* Rounds the result to two decimal places for readability.
* Sorts years in descending order to show the most recent data first.

**Concepts reinforced:**

* `GROUP BY`
* Aggregate functions (`AVG`)
* Column aliasing
* Sorting aggregated results

### 2.sql — Cal Ripken Jr.’s Salary History

**Objective:** Review the salary trend of a specific star player nearing retirement.

**What this query does:**

* Joins `players` and `salaries` tables.
* Filters by first and last name to isolate Cal Ripken Jr.
* Displays salary by year, sorted from most recent to oldest.

**Concepts reinforced:**

* `JOIN` between relational tables
* Filtering with `WHERE`
* Understanding one-to-many relationships (player → salaries)

### 3.sql — Ken Griffey Jr.’s Home Run History

**Objective:** Evaluate home run performance of a strong hitter prospect.

**What this query does:**

* Joins `players` with `performances`.
* Filters by name *and* birth year to avoid ambiguity.
* Returns yearly home run totals in descending order.

**Concepts reinforced:**

* Disambiguating records using additional attributes
* Joining performance statistics
* Ordering historical performance data

### 4.sql — Lowest-Paid Players in 2001

**Objective:** Identify cost-effective players under budget constraints.

**What this query does:**

* Finds players with the lowest salaries in the year 2001.
* Applies multi-level sorting:

  1. Salary (ascending)
  2. First name (A–Z)
  3. Last name (A–Z)
  4. Player ID (to fully stabilize sorting)
* Limits output to the bottom 50 salaries.

**Concepts reinforced:**

* Complex `ORDER BY` logic
* Deterministic sorting
* Practical use of `LIMIT`

### 5.sql — Teams Played For by Satchel Paige

**Objective:** Identify all teams associated with a historical player.

**What this query does:**

* Uses a subquery to find distinct team IDs from performance records.
* Filters by player name in the subquery.
* Retrieves team names matching those IDs.

**Concepts reinforced:**

* Subqueries with `IN`
* `DISTINCT` to avoid duplicate results
* Indirect relationships across multiple tables

## General Observations So Far

* SQL reads like logic written down carefully; most bugs come from missing constraints or unclear joins.
* Sorting rules matter more than expected—especially when outputs are graded automatically.
* Disambiguation (names, years, IDs) is a recurring real-world problem, not just a classroom one.

**Next step:** Continue with the remaining Moneyball queries and append notes here as they are completed.
