CREATE TABLE "riders" (
    "id" INTEGER, -- we dont need NOT NULL, UNIQUE in this since primary key contraint invilve that
    "name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "stations" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "line" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "visits" (
    "rider_id" INTEGER,
    "station_id" INTEGER,
    FOREIGN KEY("rider_id") REFERENCES "riders"("id")
    FOREIGN KEY("station_id") REFERENCES "stations"("id")
    -- PRIMARY KEY("rider_id", "station_id") -- Joint Primary key
    -- Sqlite by default give own primary called row id
);