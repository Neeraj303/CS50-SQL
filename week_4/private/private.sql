-- Create a new table to store the code
CREATE TABLE "cipher_code" (
"id" INTEGER,
"sentence_number" INTEGER,
"character_number" INTEGER,
"message_length" INTEGER,
PRIMARY KEY("id")
);

-- Insert the data into the table
INSERT INTO "cipher_code" ("sentence_number", "character_number", "message_length")
VALUES
(14, 98, 4),
(114, 3, 5),
(618, 72, 9),
(630, 7, 3),
(932, 12, 5),
(2230, 50, 7),
(2346, 44, 10),
(3041, 14, 5);


-- Create a new table to inly store the sentences as per the cipher
CREATE TABLE "cipher_sentence" (
    "id" INTEGER,
    "code" TEXT,
    "start" INTEGER,
    "length" INTEGER,
    PRIMARY KEY("id")
);

-- Inserting the selected sentences
INSERT INTO "cipher_sentence" ("code", "start", "length")
SELECT "s"."sentence", "c"."character_number", "c"."message_length"  FROM "sentences" AS "s"
JOIN "cipher_code" AS "c" ON "c"."sentence_number" = "s"."id"
WHERE "s"."id" IN (
    SELECT "sentence_number" FROM "cipher_code"
);

-- Create a view to store the decoded code
CREATE VIEW "message" AS
SELECT substr("c"."code", "c"."start", "c"."length") AS "phrase" FROM "cipher_sentence" AS "c";
