# CS50 SQL - Week 3: Writing

## 1. Overview
In **Week 3 (Writing)**, we explore DML (Data Manipulation Language)—the commands used to add, modify, and delete data in a database:
* **`INSERT INTO`** – Adding new records
* **`UPDATE`** – Modifying existing records
* **`DELETE`** – Removing records
* **`TRIGGERS`** – Automating database actions in response to changes
* **`SOFT DELETIONS`** – Safely archiving records without losing history

The lecture centers around the **Boston Museum of Fine Arts (MFA)** database (`mfa.db`), tracking art collections, artists, and acquisitions.

---

## 2. Inserting Data (`INSERT INTO`)

### Single Row Insertion
```sql
INSERT INTO "collections" ("title", "accession_number", "acquired")
VALUES ('Profusion of flowers', '56.257', '1956-04-12');
```
* If a column has an auto-incrementing `PRIMARY KEY` (e.g. `id`), SQLite automatically generates the next integer if omitted.
* Columns with `DEFAULT` constraints can also be safely omitted.

### Inserting Multiple Rows in One Statement
```sql
INSERT INTO "artists" ("name")
VALUES
    ('Li Yin'),
    ('Qian Weicheng'),
    ('Zhou Chen');
```

### Inserting from a Query
You can insert rows directly from the results of a `SELECT` query:
```sql
INSERT INTO "created" ("artist_id", "collection_id")
VALUES (
    (SELECT "id" FROM "artists" WHERE "name" = 'Li Yin'),
    (SELECT "id" FROM "collections" WHERE "title" = 'Imaginative landscape')
);
```

### Importing Data from CSV (SQLite CLI)
```sql
-- Set mode to csv, skip header row, and import into table
.import --csv --skip 1 mfa.csv collections
```

---

## 3. Updating Data (`UPDATE`)

### Basic Syntax
```sql
UPDATE "collections"
SET "acquired" = '1911-08-03'
WHERE "accession_number" = '11.6152';
```
> **Warning:** If you omit the `WHERE` clause, **every row in the table will be updated!**

### Updating Multiple Columns
```sql
UPDATE "collections"
SET "acquired" = '1914-01-08',
    "title" = 'Spring Outing in Beijing'
WHERE "id" = 4;
```

### Updating with Subqueries
```sql
UPDATE "collections"
SET "acquired" = '1911-08-03'
WHERE "id" = (
    SELECT "id" FROM "collections"
    WHERE "title" = 'Farmers working at dawn'
);
```

---

## 4. Deleting Data (`DELETE`)

### Basic Syntax
```sql
DELETE FROM "collections"
WHERE "title" = 'Spring outing';
```
> **Warning:** `DELETE FROM "table";` deletes **all rows** in the table while keeping the table structure intact. (To remove the entire table structure, use `DROP TABLE`).

### Foreign Key Cascade Deletions
When defining relationships, you can specify what happens to dependent child rows when a parent row is deleted:
* **`ON DELETE CASCADE`**: Automatically deletes child records when the parent is deleted.
  ```sql
  CREATE TABLE "created" (
      "artist_id" INTEGER,
      "collection_id" INTEGER,
      FOREIGN KEY("artist_id") REFERENCES "artists"("id") ON DELETE CASCADE,
      FOREIGN KEY("collection_id") REFERENCES "collections"("id") ON DELETE CASCADE
  );
  ```
* **`ON DELETE SET NULL`**: Sets the foreign key column to `NULL` in child records.
* **`ON DELETE RESTRICT`**: Prevents the parent record from being deleted if child records exist.
* **`ON DELETE NO ACTION`**: Same as `RESTRICT` in SQLite.

---

## 5. Triggers (`CREATE TRIGGER`)
A **trigger** is an automated procedure that SQLite executes whenever a specified event (`INSERT`, `UPDATE`, or `DELETE`) occurs on a table.

### Syntax
```sql
CREATE TRIGGER "trigger_name"
BEFORE/AFTER INSERT/UPDATE/DELETE ON "table_name"
FOR EACH ROW
BEGIN
    -- SQL statements to execute
END;
```

### `NEW` and `OLD` Pseudo-Tables
* **`NEW`**: Refers to the newly inserted or updated row values (available in `INSERT` and `UPDATE`).
* **`OLD`**: Refers to the original row values prior to modification or deletion (available in `UPDATE` and `DELETE`).

### Example: Audit / Transaction Log Trigger
```sql
-- Automatically log deleted items into a transactions table
CREATE TRIGGER "sell"
AFTER DELETE ON "collections"
FOR EACH ROW
BEGIN
    INSERT INTO "transactions" ("title", "action")
    VALUES (OLD."title", 'sold');
END;
```

---

## 6. Soft Deletions
Hard deleting (`DELETE FROM`) permanently removes data. In production databases, **Soft Deletion** is often preferred to keep historical records and prevent accidental data loss:

1. Add a flag column to your schema:
   ```sql
   ALTER TABLE "collections" ADD COLUMN "deleted" INTEGER DEFAULT 0;
   ```
2. When deleting, update the flag instead of removing the row:
   ```sql
   UPDATE "collections" SET "deleted" = 1 WHERE "id" = 2;
   ```
3. Application queries simply filter out soft-deleted rows:
   ```sql
   SELECT * FROM "collections" WHERE "deleted" = 0;
   ```

---

## 7. Folder Contents & Materials

* **`mfa.db`**: SQLite database initialized with Museum of Fine Arts collections and artist data.
* **`lecture3.pdf`**: Complete lecture slide deck.
* **`src3.pdf`**: Source code reference booklet.
* **`lecture3_transcript.txt`**: Full English transcript of Lecture 3.
* **`src3/`**: Contains demonstration SQL scripts:
  * `insert/` (`insert0.sql`, `insert1.sql`, CSV import examples)
  * `update/` (`update0.sql`, `update1.sql`)
  * `delete/` (`delete0.sql`, `delete1.sql`, cascade, soft delete)
  * `triggers/` (`triggers.sql`)

---

## 8. Problem Set 3 Assignments

1. **[dont-panic/](file:///c:/Users/ASUS/Downloads/cs50%20sql/week3/dont-panic)**:
   * Edit `hack.sql` to alter the `admin` account password, erase evidence from `user_logs`, and frame `emily33` using subqueries and `UPDATE`/`DELETE`.
2. **[meteorites/](file:///c:/Users/ASUS/Downloads/cs50%20sql/week3/meteorites)**:
   * Write an ETL data cleaning pipeline in `import.sql`: load `meteorites.csv` into a temporary table, clean nulls and decimals, filter out relicts, and insert cleaned data into the final `meteorites` table sorted by year and name with re-sequenced IDs.
