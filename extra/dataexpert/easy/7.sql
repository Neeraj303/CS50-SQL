/* Question 7 */
WITH data AS (
SELECT 
  id,
  rev,
  content,
  ROW_NUMBER() OVER(PARTITION BY id ORDER BY rev DESC) AS rn
FROM 
  playground.revenue
)
SELECT 
  id,
  rev,
  content
FROM 
  data
WHERE 
  rn = 1
ORDER BY
  rev DESC 
