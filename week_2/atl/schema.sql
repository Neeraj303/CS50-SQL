CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);


CREATE TABLE "check-ins" (
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "check_in_time" NUMERIC NOT NULL DEFAULT CURRENT_TIME,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER
    "airline_name" TEXT UNIQUE,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER
    "flight_number" INTEGER,
    "airline_id" INTEGER,
    "from" TEXT,
    "to" TEXT,
    "departure_time" NUMERIC ,
    "arrival_time" NUMERIC,
    PRIMARY KEY("id")
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);

