# CS50 SQL - Course Context & Progress

## 1. What This Workspace Is
This workspace contains Harvard's **CS50 SQL (Databases with SQL)** course materials, problem sets, and SQLite databases.
- Dialect: **SQLite**
- Goal: Learn database querying, schema design, data writing/cleaning, optimization, and scaling through guided problem sets.

## 2. Folder Map
- **`week0/` (Querying)**: Basic `SELECT`, filters, aggregations, sorting, and conditions.
  - Problem sets: `cyberchase`, `normals`, `players`, `views`.
- **`week1/` (Relating)**: Foreign keys, joins, subqueries, and sets.
  - Problem sets: `packages`, `dese`, `moneyball`.
- **`week2/` (Designing)**: Table schemas, primary/foreign keys, normalization, and constraints.
  - Problem sets: `atl`, `connect`, `donuts`.
- **`week3/` (Writing)**: `INSERT`, `UPDATE`, `DELETE`, triggers, `.import`, and data cleaning.
  - Problem sets: `meteorites`, `dont-panic`.
- **`src0/` - `src3/`**: Official lecture code, demo databases, and sample queries.

## 3. What Has Been Done So Far
- **Week 0: Querying** — **COMPLETE**
  - All queries solved and verified in `cyberchase`, `normals`, `players`, and `views`.
- **Week 1: Relating** — **IN PROGRESS**
  - Completed: `week1/packages/` (all 3 mysteries solved and logged in `log.sql` and `answers.txt`).
  - Completed: `week1/dese/` (queries 1–12 solved and verified; 13 skipped).
- **Week 2: Designing** — **COMPLETE**
  - All schemas designed, validated, and databases created:
    - `week2/atl/schema.sql` -> `atl.db`
    - `week2/connect/schema.sql` -> `connect.db`
    - `week2/donuts/schema.sql` -> `donuts.db` (verified clean relations and composite keys).

## 4. What Is Left To Do
1. **Week 1: Relating (CURRENT TASK)**:
   - `week1/packages/`: Detective mystery tracing 3 lost packages via JOINs (`log.sql` & `answers.txt`).
   - `week1/dese/`: 13 SQL queries on Massachusetts schools, districts, and expenditures.
   - `week1/moneyball/`: 12 SQL queries on baseball statistics and salaries.
2. **Week 3: Writing (UP NEXT)**:
   - `week3/meteorites/import.sql`: Import `meteorites.csv` via staging table, clean data, and sort.
   - `week3/dont-panic/hack.sql`: Password update, log erasure, and decoy logs.
3. **Future Weeks**:
   - Week 4 (Viewing), Week 5 (Optimizing), Week 6 (Scaling), Final Project.
