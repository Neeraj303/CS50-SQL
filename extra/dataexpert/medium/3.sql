/* medium question 3 */
WITH data AS (
  SELECT 
    state,
    fatal_collisions_per_billion_miles,
    (SELECT AVG(fatal_collisions_per_billion_miles) FROM playground.bad_drivers) AS Average
  FROM
    playground.bad_drivers
  ORDER BY state ASC
)
SELECT 
  state,
  fatal_collisions_per_billion_miles,
  (CASE
    WHEN fatal_collisions_per_billion_miles > Average THEN 'Above Average'
    ELSE 'Below Average'
  END) AS comparison_to_national_avg
FROM data
ORDER BY state ASC
