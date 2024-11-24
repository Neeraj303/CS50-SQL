.import --csv meteorites.csv tmp

UPDATE "tmp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "tmp" SET "year" = NULL WHERE "year" = '';
UPDATE "tmp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "tmp" SET "long" = NULL WHERE "long" = '';

UPDATE "tmp" 
SET
    "mass" = ROUND("mass", 2),
    "lat" = ROUND("lat", 2),
    "long" = ROUND("long", 2);

DELETE FROM "tmp" WHERE "nametype" = 'Relict';

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long",
    PRIMARY KEY("id")
);

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "tmp"
ORDER BY "year" ASC, "name";
