SELECT DISTINCT("teams"."name")
FROM "teams"
    JOIN "performances" ON "performances"."team_id" = "teams"."id"
WHERE "performances"."player_id" = (
    SELECT "id" FROM "players"
    WHERE "first_name" = 'Satchel' 
        AND "last_name" = 'Paige'
);

