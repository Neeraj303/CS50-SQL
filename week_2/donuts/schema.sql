CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT, --Name of the ingredient
    "price" INTEGER, --Price per unit of the ingredient (grams, punds, etc)
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT, -- Name of the donut
    "gluten_free" TEXT CHECK("gluten_free" IN ("YES", "NO")),
    "price" INTEGER, -- Price per donut
    PRIMARY KEY("id")
);

-- created a new table to show many to many relationship between "ingredients" - "donuts".
CREATE TABLE "donut_ingredient" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    PRIMARY KEY ("donut_id", "ingredient_id") -- This is an composite primary key
);

-- Table to define all the orders
CREATE TABLE "orders" (
    "order_id" TEXT,
    "customer_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    PRIMARY KEY("order_id", "customer_id", "donut_id")
);

-- Table to define each specific customer
CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "order_history" (
    "customer_id" INTEGER,
    "order_id" TEXT,
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("order_number")
);




