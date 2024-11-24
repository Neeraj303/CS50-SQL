/* Question 9 */
SELECT 
  day_of_week,
  ROUND(AVG(births),0) AS average_births
FROM
  playground.us_birth_stats
GROUP BY 
  day_of_week
ORDER BY 
  day_of_week 
