/* Medium Question 2 */
SELECT product_id, price FROM (
SELECT 
  product_id, 
  new_price AS price,
  change_date,
  ROW_NUMBER() OVER(
    PARTITION BY product_id  
    ORDER BY change_date DESC
  ) AS rn
FROM (
  SELECT * FROM playground.product_prices 
  WHERE change_date <= CAST('2023-08-17' AS DATE)
  )
)
WHERE rn = 1
ORDER BY product_id ASC
