# CS50 SQL - Week 2: Designing

## 1. Overview
In **Week 2 (Designing)**, the focus shifts from querying existing databases to architecting and creating our own database schemas using DDL (Data Definition Language). 

The running real-world case study is modeling the **MBTA (Massachusetts Bay Transportation Authority)** Boston subway system: stations, cards, and swipes.

---

## 2. Key Concepts

### A. Database Schemas & Normalization
* **Schema**: The blueprint/structure of a database defining tables, columns, relationships, and constraints.
* **Normalization**: The process of organizing data into distinct tables to reduce redundancy and maintain data integrity:
  * Each entity gets its own table (e.g., `cards`, `stations`, `swipes`).
  * Avoid duplicate text strings across rows by using Primary Keys and Foreign Keys.

### B. SQLite Storage Classes & Data Types
SQLite uses dynamic typing with **type affinities**:
1. `NULL` – Missing or unknown value.
2. `INTEGER` – Signed integer (1, 2, 3, 4, 6, or 8 bytes).
3. `REAL` – Floating point value (8-byte IEEE floating point).
4. `TEXT` – String of characters (UTF-8, UTF-16).
5. `BLOB` – Binary Large Object (stored exactly as input, e.g., images, raw bytes).
6. `NUMERIC` – Can store integer or real numbers; also commonly used for dates and times (`CURRENT_TIMESTAMP`).

---

## 3. Table & Column Constraints

### Table Constraints
* `PRIMARY KEY("col")`: Uniquely identifies each record in the table.
* `FOREIGN KEY("col") REFERENCES "other_table"("id")`: Enforces relationships and referential integrity.

### Column Constraints
* `NOT NULL`: Ensures a column cannot contain `NULL` values.
* `UNIQUE`: Ensures all values in the column are distinct.
* `DEFAULT <val>`: Provides a fallback value if none is specified (e.g., `DEFAULT CURRENT_TIMESTAMP`).
* `CHECK(<condition>)`: Validates data against a specific condition:
  ```sql
  CHECK("type" IN ('enter', 'exit', 'deposit'))
  CHECK("amount" != 0)
  ```

---

## 4. DDL Statements (Data Definition Language)

### Creating Tables
```sql
CREATE TABLE "cards" (
    "id" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "line" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "swipes" (
    "id" INTEGER,
    "card_id" INTEGER,
    "station_id" INTEGER,
    "type" TEXT NOT NULL CHECK("type" IN ('enter', 'exit', 'deposit')),
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "amount" NUMERIC NOT NULL CHECK("amount" != 0),
    PRIMARY KEY("id"),
    FOREIGN KEY("station_id") REFERENCES "stations"("id"),
    FOREIGN KEY("card_id") REFERENCES "cards"("id")
);
```

### Altering Tables (`ALTER TABLE`)
* **Rename table**:
  ```sql
  ALTER TABLE "visits" RENAME TO "swipes";
  ```
* **Add a column**:
  ```sql
  ALTER TABLE "swipes" ADD COLUMN "amount" NUMERIC;
  ```
* **Rename a column**:
  ```sql
  ALTER TABLE "swipes" RENAME COLUMN "ttpe" TO "type";
  ```
* **Drop a column** (SQLite 3.35.0+):
  ```sql
  ALTER TABLE "swipes" DROP COLUMN "amount";
  ```

### Deleting Tables (`DROP TABLE`)
```sql
DROP TABLE IF EXISTS "swipes";
```

---

## 5. Directory Contents

* **`mbta.db`**: SQLite database generated using the final `schema7.sql` schema.
* **`lecture2.pdf`**: Complete lecture slide deck.
* **`lecture2_transcript.txt`**: Full English transcript of the lecture.
* **`src2.pdf`**: Source code booklet in PDF format.
* **`src2/`**:
  * **`schema/`**: Evolutionary schema iterations from `schema0.sql` (bare bones) to `schema7.sql` (with all constraints & foreign keys).
  * **`alter/`**: SQL scripts demonstrating `ALTER TABLE` operations (`alter0.sql` to `alter3.sql`).

---

## 6. Problem Set 2 Assignments
Once you're ready to practice designing schemas, the assignments for Week 2 are:
1. **ATL**: Design a database for Atlanta's Hartsfield-Jackson Airport (passengers, airlines, flights, check-ins).
2. **Happy to Connect**: Design a LinkedIn-like professional network schema (users, schools, companies, connections).
3. **Union Square Donuts**: Design a schema for a donut shop (ingredients, donuts, orders, customers).
