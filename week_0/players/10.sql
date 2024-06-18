SELECT "first_name", "last_name", "height" AS "Heigth Above Avg." FROM "players" WHERE "height" > (SELECT AVG("Height") FROM "players") ORDER BY "height" DESC, "first_name" ASC, "last_name" ASC;

