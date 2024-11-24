/* Question 14 */
SELECT id, name, surname
FROM playground.suspect
WHERE height <= 170 
  AND (name LIKE 'B%' OR name LIKE 'b%')
  AND surname LIKE 'Gre_n' 
ORDER BY id 
