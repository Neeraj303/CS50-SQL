/* Question 11 */
SELECT
  d.dep_name
FROM
  playground.departments AS d
  LEFT JOIN playground.employees AS E ON d.id = E.department
WHERE
  E.id IS NULL
ORDER BY
  d.id ASC
