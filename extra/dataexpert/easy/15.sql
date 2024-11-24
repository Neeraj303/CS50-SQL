/* Question 15 */
WITH data AS (
SELECT 
  YEAR(order_date) AS order_year, 
  profit
FROM playground.superstore
)
SELECT order_year, ROUND(SUM(profit),2) AS total_profit
FROM data
GROUP BY order_year
ORDER BY order_year DESC
