-- In schema.sql, write a set of CREATE TABLE statements to design a database for Union Square Donuts.

-- Requirements:
-- 1. Ingredients: name, price per unit (e.g. per pound, per gram).
-- 2. Donuts: name, gluten-free (yes/no), price per donut, ingredients list.
-- 3. Orders: order number, donuts in the order (and quantities), customer who placed the order.
-- 4. Customers: first name, last name, order history.

CREATE TABLE "ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "unit" TEXT NOT NULL,
    "price_per_unit" NUMERIC, 
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "is_gluten_free" TEXT NOT NULL,
    "price" NUMERIC,
    PRIMARY KEY ("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,PRIMARY KEY ("id")
);

CREATE TABLE "donut_ingredients" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    PRIMARY KEY("donut_id","ingredient_id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts" ("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients" ("id")
);

CREATE Table "orders"(
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers" ("id")
);

CREATE TABLE "order_item"(
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER NOT NULL,
    PRIMARY KEY("order_id","donut_id"),
    FOREIGN KEY ("order_id") REFERENCES "orders" ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts" ("id")
);

