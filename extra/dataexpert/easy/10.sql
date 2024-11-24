/* QUestion 10 */
WITH
  DATA AS (
    SELECT
      customer_id,
      customer_name,
      COUNT(order_id) AS order_count
    FROM
      playground.superstore
    GROUP BY
      customer_id,
      customer_name
    ORDER BY
      order_count DESC,
      customer_name ASC
  )
SELECT
  *
FROM
  DATA
WHERE
  order_count > 20
ORDER BY
  order_count DESC,
  customer_name ASC
