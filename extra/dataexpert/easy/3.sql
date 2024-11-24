/* Question 3 */
SELECT
  month,
  SUM(births) AS total_births
FROM 
  playground.us_birth_stats
GROUP BY month
ORDER BY total_births DESC
LIMIT 1
