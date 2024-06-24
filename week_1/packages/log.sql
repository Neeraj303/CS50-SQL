
-- *** The Lost Letter ***

-- To find the corresponding id for the address given, output:432
SELECT "id" FROM "addresses"
WHERE "address" = '900 Somerville Avenue';

-- To find the all the packages that were sent from address id: 432, which have congratulatory letter.Output: 854
SELECT * FROM "packages"
WHERE "from_address_id" = '432';

-- To find the corresponding address and type to id: 854
SELECT * FROM "addresses" WHERE "id" = '854';


-- *** The Devious Delivery ***
-- Find the to address, contents of the package which have no from address:
SELECT * FROM WHERE "from_address_id" is NULL;

-- Find the address id in the scan table corresponding to package_id = '5098', output = 348(address_id)
SELECT "type" FROM "addresses" WHERE "id" = '348';

-- *** The Forgotten Gift ***
-- Find the id corresponding the given address, output: 9873 (from), 4983 (to)
SELECT "id" FROM "addresses" WHERE "address" IN ('728 Maple Place', '109 Tileston Street');

-- Find the entry in packages table where from address id = 9873, and to id = 4983, output: Flowers
SELECT * FROM "packages" WHERE "from_address_id" = '9873' AND "to_address_id" = '4983';

-- Find the driver id who currently have the package
SELECT * FROM "scans" WHERE "package_id" = '9523';

-- Find the driver corresponding to id = '17', output: Mikel
SELECT "name" FROM "drivers" WHERE "id" = '17';
