-- In schema.sql, write a set of CREATE TABLE statements to design a database for LinkedIn (Connect).

-- Requirements:
-- 1. Users: first name, last name, username, password.
-- 2. Schools: name, type of school, location, year founded.
-- 3. Companies: name, industry, location.
-- 4. User Connections (People with People): mutual connections between users.
-- 5. School Affiliations: user, school, start date, end date, degree earned/pursued.
-- 6. Company Affiliations: user, company, start date, end date, title held.

CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year_founded" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "connections" (
    "user_a_id" INTEGER,
    "user_b_id" INTEGER,
    PRIMARY KEY ("user_a_id","user_b_id"),
    FOREIGN KEY ("user_a_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("user_b_id") REFERENCES "users" ("id")
);

CREATE TABLE "school_affiliations" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "degree" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools" ("id")
);

CREATE TABLE "company_affiliations" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies" ("id")
);