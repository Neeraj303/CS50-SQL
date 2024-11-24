/* Question 13 */
WITH data AS (
SELECT 
  r.user_id,
  r.rental_date,
  s.stream_date
FROM playground.rental AS r
LEFT JOIN playground.streams AS s
  ON r.user_id = s.user_id AND r.rental_id = s.rental_id
)
SELECT 
  DISTINCT user_id 
FROM 
  data
WHERE 
  rental_date = CAST('2023-02-01' AS DATE) AND (stream_date BETWEEN CAST('2023-02-02' AS DATE) AND CAST('2023-02-08' AS DATE))
ORDER BY 
  user_id
