CREATE TABLE "users" (
    "id" INTEGER
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id"
    "school_name" TEXT,
    "school_type" TEXT NOT NULL,
    "school_location" TEXT,
    "year" NUMERIC, --The year in which the school was founded
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id"
    "name" TEXT, --name of the company
    "industry" TEXT, --company's industry
    "location" TEXT, -- company location
    PRIMARY KEY("id")
);

CREATE TABLE "user_connections" (
    "user_1_id" INTEGER, --The person 1 is connected (two-way)
    "user_2_id" INTEGER, -- with person 2
    FOREIGN KEY("user_1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_2_id") REFERENCES "users"("id")

);

CREATE TABLE "school_connections" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree" TEXT,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "company_connections" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "title" TEXT,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
