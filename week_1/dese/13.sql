SELECT "schools"."name", "graduation_rates"."graduated" 
FROM "schools"
    JOIN "graduation_rates" ON "graduation_rates"."school_id" = "schools"."id"
WHERE "graduation_rates"."graduated" > 99.0 
    AND "schools"."type" = 'Public School'
ORDER BY "graduation_rates"."graduated" DESC, "schools"."name" ASC
LIMIT 10;

