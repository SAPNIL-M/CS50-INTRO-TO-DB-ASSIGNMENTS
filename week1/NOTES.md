# CS50 SQL - Week 1: Relating

## 1. Overview
In **Week 1 (Relating)**, we expand from single tables to **relational databases**. We explore how to split data into normalized tables to eliminate redundancy and how to reconnect them using **Primary Keys**, **Foreign Keys**, **Subqueries**, and **JOINs**.

The lecture uses the multi-table relational version of `longlist.db` (`authors`, `books`, `publishers`, `authored`, `translators`, `translated`, `ratings`) as well as `sea_lions.db`.

---

## 2. Relational Design & ER Diagrams

### Why Normalize?
Storing everything in a single table causes:
* **Data Redundancy**: Duplicating author names, publishers, etc. across hundreds of rows.
* **Anomalies**: Updating an author's name in one row but forgetting another, or deleting a book and accidentally deleting the author's record entirely.

### Entity-Relationship (ER) Diagrams
* **Entities**: Objects or concepts (e.g., `Author`, `Book`, `Publisher`).
* **Relationships**: How entities connect:
  * **One-to-One (1:1)**: e.g., Country to Capital City.
  * **One-to-Many (1:N)**: e.g., Publisher publishes many Books.
  * **Many-to-Many (N:M)**: e.g., Authors write Books (requires a junction table like `authored`).

---

## 3. Primary & Foreign Keys

* **Primary Key (PK)**: Uniquely identifies each record in its own table.
  ```sql
  CREATE TABLE "authors" (
      "id" INTEGER,
      "name" TEXT,
      PRIMARY KEY("id")
  );
  ```
* **Foreign Key (FK)**: A column referencing the Primary Key in another table.
  ```sql
  CREATE TABLE "books" (
      "id" INTEGER,
      "title" TEXT,
      "publisher_id" INTEGER,
      PRIMARY KEY("id"),
      FOREIGN KEY("publisher_id") REFERENCES "publishers"("id")
  );
  ```

---

## 4. Subqueries (Nested Queries)
A query nested inside another query:
```sql
-- Find all books published by 'MacLehose Press' using a subquery
SELECT "title" FROM "books"
WHERE "publisher_id" = (
    SELECT "id" FROM "publishers"
    WHERE "publisher" = 'MacLehose Press'
);

-- Find books written by authors from the UK using IN
SELECT "title" FROM "books"
WHERE "id" IN (
    SELECT "book_id" FROM "authored"
    WHERE "author_id" IN (
        SELECT "id" FROM "authors"
        WHERE "country" = 'United Kingdom'
    )
);
```

---

## 5. JOINs

### INNER JOIN
Returns records that have matching values in both tables:
```sql
SELECT "books"."title", "publishers"."publisher"
FROM "books"
JOIN "publishers" ON "books"."publisher_id" = "publishers"."id";
```

### LEFT JOIN (OUTER JOIN)
Returns all records from the left table, plus matched records from the right table (filling unmatched fields with `NULL`):
```sql
-- Includes books that don't have a translator
SELECT "books"."title", "translators"."name"
FROM "books"
LEFT JOIN "translated" ON "books"."id" = "translated"."book_id"
LEFT JOIN "translators" ON "translated"."translator_id" = "translators"."id";
```

### Self-Join
Joining a table to itself to relate rows within the same table:
```sql
-- Example: Finding sea lions and their companions
SELECT a."name" AS "sea_lion_1", b."name" AS "sea_lion_2"
FROM "sea_lions" a
JOIN "sea_lions" b ON a."companion_id" = b."id";
```

---

## 6. Set Operations
Combine results of two or more `SELECT` queries (must select the same number and types of columns):
* **`UNION`**: Combines results and removes duplicates.
* **`UNION ALL`**: Combines results and keeps duplicates (faster).
* **`INTERSECT`**: Returns only rows present in both queries.
* **`EXCEPT`**: Returns rows from the first query that are not in the second.

```sql
SELECT "author_id" FROM "authored"
INTERSECT
SELECT "translator_id" FROM "translated";
```

---

## 7. Groups & Aggregation (`GROUP BY` and `HAVING`)

### `GROUP BY`
Groups rows that share a value in one or more columns so aggregate functions can be applied to each group:
```sql
-- Count how many books each publisher published
SELECT "publisher_id", COUNT(*) AS "book_count"
FROM "books"
GROUP BY "publisher_id";
```

### `HAVING` vs `WHERE`
* **`WHERE`** filters individual rows **before** grouping.
* **`HAVING`** filters aggregated groups **after** grouping.

```sql
-- Only show publishers with more than 3 books
SELECT "publishers"."publisher", COUNT("books"."id") AS "total"
FROM "publishers"
JOIN "books" ON "publishers"."id" = "books"."publisher_id"
GROUP BY "publishers"."id"
HAVING "total" > 3
ORDER BY "total" DESC;
```

---

## 8. Folder Structure
* **`longlist.db`**: Multi-table relational database.
* **`sea_lions.db`**: Demonstrates self-joins and migrations.
* **`lecture1.pdf`**: Complete lecture slide deck.
* **`src1.pdf`**: Source code booklet in PDF format.
* **`lecture1_transcript.txt`**: Full English transcript of the lecture.
* **`src1/`**: Contains lecture SQL scripts and raw CSV files:
  * `joins.sql`, `nested.sql`, `sets.sql`, `groups.sql`
  * `books.csv`, `authors.csv`, `publishers.csv`, `ratings.csv`, etc.

---

## 9. Problem Set 1 Assignments
* **Packages, Please**: Track packages, addresses, and delivery scans via relational queries.
* **DESE**: Analyze Massachusetts public school districts, expenditures, and graduation rates (`dese.db`).
* **Moneyball**: Optimize baseball player payrolls and performance statistics (`moneyball.db`).
