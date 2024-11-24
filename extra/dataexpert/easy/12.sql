/* Question 12 */
SELECT
  s.id,
  s.name,
  s.club_id
FROM
  playground.students AS s
  LEFT JOIN playground.clubs AS c ON s.club_id = c.id
WHERE
  c.id IS NOT NULL
ORDER BY
  s.id
