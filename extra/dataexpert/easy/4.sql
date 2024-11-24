/* Question 4 */
SELECT (CASE
  WHEN gender = 'M' THEN CONCAT('', name)
  ELSE CONCAT('', name)
END) AS name, birthday
FROM playground.successors
ORDER BY birthday ASC
