# CS50 SQL - Week 0: Querying

## 1. Overview
In **Week 0 (Querying)**, we learn the foundations of relational databases and how to retrieve, filter, sort, and summarize data using SQL (Structured Query Language).

The lecture introduces **SQLite** and uses a single-table database called `longlist.db` (containing books nominated for the International Booker Prize).

---

## 2. SQLite CLI Basics
When interacting with SQLite from the terminal:
* **Open a database**: `sqlite3 longlist.db`
* **Helpful dot-commands**:
  * `.mode table`: Formats terminal output in an easy-to-read ASCII table.
  * `.headers on`: Displays column headers in query output.
  * `.schema`: Shows the `CREATE TABLE` statement used to construct the database.
  * `.tables`: Lists all tables in the database.
  * `.quit` (or `.exit`): Exits SQLite.

---

## 3. Basic Query Syntax

### SELECT & LIMIT
```sql
-- Retrieve specific columns
SELECT "title", "author" FROM "longlist";

-- Retrieve all columns
SELECT * FROM "longlist";

-- Limit number of results returned
SELECT "title" FROM "longlist" LIMIT 10;
```

---

## 4. Filtering with WHERE

### Comparison Operators
* `=`, `!=` (or `<>`), `<`, `<=`, `>`, `>=`
```sql
SELECT "title", "year" FROM "longlist" WHERE "year" = 2023;
SELECT "title", "pages" FROM "longlist" WHERE "pages" < 200;
```

### Boolean Logic
* `AND`, `OR`, `NOT`
```sql
SELECT "title" FROM "longlist"
WHERE ("year" = 2022 OR "year" = 2023) AND "format" = 'hardcover';
```

---

## 5. Handling NULL (The SQL Trap)
In SQL, `NULL` represents the absence of data. You **cannot** use `=` or `!=` with `NULL`.
* **Correct**:
  ```sql
  SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NULL;
  SELECT "title", "translator" FROM "longlist" WHERE "translator" IS NOT NULL;
  ```
* **Incorrect**:
  ```sql
  -- This will return 0 rows!
  WHERE "translator" = NULL
  ```

---

## 6. Pattern Matching with LIKE
* `%` matches **zero or more** characters.
* `_` matches **exactly one** character.
* `LIKE` in SQLite is case-insensitive for ASCII characters.

```sql
-- Titles starting with 'The'
SELECT "title" FROM "longlist" WHERE "title" LIKE 'The%';

-- Titles containing 'love' anywhere
SELECT "title" FROM "longlist" WHERE "title" LIKE '%love%';

-- Titles where the second letter is 'a'
SELECT "title" FROM "longlist" WHERE "title" LIKE '_a%';
```

---

## 7. Ranges & Sets
```sql
-- BETWEEN (inclusive range)
SELECT "title", "year" FROM "longlist"
WHERE "year" BETWEEN 2019 AND 2022;

-- IN (matches any value in a list)
SELECT "title", "format" FROM "longlist"
WHERE "format" IN ('hardcover', 'paperback');
```

---

## 8. Sorting with ORDER BY
* Default is `ASC` (ascending). Use `DESC` for descending order.
* Can sort by multiple columns.
```sql
-- Sort by pages descending, then title alphabetically
SELECT "title", "pages" FROM "longlist"
ORDER BY "pages" DESC, "title" ASC
LIMIT 5;
```

---

## 9. Aggregate Functions
Perform calculations across multiple rows to return a single value:
* `COUNT(*)`: Count total rows.
* `COUNT("col")`: Count non-null values in a column.
* `COUNT(DISTINCT "author")`: Count unique values.
* `AVG("pages")`: Average value.
* `SUM("pages")`: Total sum.
* `MIN("pages")` / `MAX("pages")`: Minimum and maximum values.
* `ROUND(AVG("pages"), 1)`: Round result to 1 decimal place.

```sql
SELECT
    COUNT(*) AS "total_books",
    ROUND(AVG("pages"), 2) AS "average_pages",
    MIN("pages") AS "shortest",
    MAX("pages") AS "longest"
FROM "longlist";
```

---

## 10. Folder Structure
* **`longlist.db`**: SQLite database with the single `longlist` table.
* **`lecture0.pdf`**: Complete lecture slide deck.
* **`src0.pdf`**: Source code booklet in PDF format.
* **`lecture0_transcript.txt`**: Full English transcript of the lecture.
* **`src0/`**: SQL scripts organized by topic:
  * `0-SELECT.sql`, `1-LIMIT.sql`, `2-WHERE.sql`, `3-NULL.sql`
  * `4-LIKE.sql`, `5-compound.sql`, `6-range.sql`, `7-dates.sql`
  * `8-ORDER BY.sql`, `9-aggregate.sql`

---

## 11. Problem Set 0 Assignments
* **Cyberchase**: Querying episodes from the PBS show Cyberchase (`cyberchase.db`).
* **36 Views** or **Normals**: Analysis of Hokusai prints or climate normals.
* **Players**: Querying historical baseball players' data (`players.db`).
