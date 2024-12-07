Refer to this for the question: https://dataford.io/learningpath/SQL-Practice-Problems

/*  Department Detailed Info (M-Q3) */
SELECT
  d.department_id, d.department_name, d.manager_id, d.location_id, 
  e.employee_id, e.first_name, e.last_name, e.email,
  l.street_address, l.city, l.state_province, l.country_id,
  c.country_name
FROM departments AS d
JOIN employees AS e
  ON d.department_id = e.department_id AND d.manager_id = e.employee_id
JOIN locations AS l
  ON d.location_id = l.location_id
JOIN countries AS c
  ON l.country_id = c.country_id


/* Customer Orders (M-Q4) */
  
SELECT c.customer_id, c.cust_first_name, c.cust_last_name, 
  o.order_id, o.order_date, o.order_total
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date


/* Customers with no orders (M-Q5) */

SELECT c.customer_id, c.cust_first_name, c.cust_last_name
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id


/* Specific Product Name (M-Q11) */

SELECT 
  c.customer_id, c.cust_first_name, c.cust_last_name,
  o.order_id,
  oi.line_item_id, pi.product_id, pi.product_name, oi.unit_price, oi.quantity
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
JOIN order_items AS oi
  ON o.order_id = oi.order_id
JOIN product_information AS pi
  ON pi.product_id = oi.product_id
WHERE pi.product_name LIKE 'RAM%' AND c.customer_id = 105


/* Customer Information (M-Q18) */
-- SELECT * FROM customers

SELECT 
  c.marital_status,
  MIN(o.order_total) AS cheapest_order,
  MAX(o.order_total) AS most_expensive_order,
  SUM(o.order_total) AS combined_order_total
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
GROUP BY c.marital_status


/* Top Customers (M-Q19) */

SELECT 
  c.customer_id,
  c.cust_first_name,
  c.cust_last_name,
  o.order_id,
  o.order_date,
  o.order_total
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
GROUP BY c.customer_id, o.order_id
HAVING o.order_total >= 1.5*(SELECT AVG(order_total) FROM orders)
ORDER BY o.order_total DESC


/* Largest Orders (M-Q21) */
WITH data AS (
  SELECT 
    sales_rep_id, customer_id, order_id, order_total,
    ROW_NUMBER() OVER(PARTITION BY sales_rep_id ORDER BY order_total DESC) AS rn
  FROM 
    orders
)
SELECT sales_rep_id, customer_id, order_id, order_total
FROM data 
WHERE rn = 1 AND sales_rep_id IS NOT NULL
ORDER BY order_total DESC


/* Order Details (M-Q22) */
-- SELECT * FROM order_items
SELECT 
  o.order_id,
  o.order_date,
  o.order_total,
  SUM(oi.unit_price * oi.quantity) AS manual_order_total
FROM order_items AS oi
JOIN orders AS o
  ON oi.order_id = o.order_id
GROUP BY o.order_id, o.order_date, o.order_total
ORDER BY manual_order_total DESC
  

/* First and Last Order (M-Q23) */
-- SELECT * FROM orders WHERE customer_id = 101

WITH cte AS (
SELECT
  customer_id, order_id, order_date,
  DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date ASC) as order_date_sequence_asc,
  DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY order_date DESC) as order_date_sequence_desc
FROM orders
)
SELECT 
  customer_id,
  order_id,
  order_date,
  order_date_sequence_asc,
  order_date_sequence_desc
FROM cte
WHERE order_date_sequence_asc = 1 OR order_date_sequence_desc = 1
ORDER BY customer_id


/* Customer Orders Total (M-Q28) */
WITH cte AS (
SELECT customer_id, SUM(order_total) AS customer_order_total, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
)
SELECT customer_id, customer_order_total 
FROM cte
WHERE order_count = (
  SELECT MAX(order_count) FROM cte
)
ORDER BY customer_order_total DESC

-- SELECT * FROM orders
-- The below query is used when direct_order and online_order are not same.
-- WITH data AS (
-- SELECT 
--   customer_id,
--   order_mode,
--   COUNT(order_id) AS order_count,
--   SUM(order_total) AS order_total
-- FROM orders
-- GROUP BY customer_id,order_mode
-- ORDER BY customer_id DESC, order_mode
-- ), data1 AS (
-- SELECT 
--   COALESCE(t1.customer_id, t2.customer_id) AS customer_id, COALESCE(t1.order_count,0) AS direct_count, COALESCE(t1.order_total,0) AS direct_total,
--   COALESCE(t2.order_count, 0) AS online_count, COALESCE(t2.order_total,0) AS online_total
-- FROM (SELECT * FROM data WHERE order_mode = 'direct') t1
-- FULL JOIN (SELECT * FROM data WHERE order_mode = 'online') t2
--   ON t1.customer_id = t2.customer_id
-- )


-- SELECT 
--   customer_id, 
--   (direct_total+online_total) AS customer_order_total 
-- FROM 
--   data1 
-- WHERE 
--   (direct_count <> online_count) AND 
--   (direct_count = 3 OR online_count = 3) 
-- ORDER BY customer_order_total DESC
-- SELECT customer_id, (direct_total + online_total) AS customer_order_total
-- FROM data1
-- WHERE direct_count <> online_count


/* Smallest and Largest Order by Customer (M-Q29) */ 
WITH data AS (
SELECT customer_id, MIN(order_total) AS min_order_total, MAX(order_total) AS max_order_total
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1
)
SELECT o.customer_id, o.order_id, o.order_total, d.min_order_total, d.max_order_total
FROM orders AS o
JOIN data AS d
  ON o.customer_id = d.customer_id
GROUP BY o.customer_id, o.order_id, d.min_order_total, d.max_order_total
ORDER BY o.customer_id ASC, o.order_total DESC


/* Product Markup (M-Q34) */
SELECT 
  product_id, product_name, list_price, min_price,
  DENSE_RANK() OVER(ORDER BY list_price - min_price) AS product_markup_sequence
FROM product_information
WHERE list_price IS NOT NULL AND min_price IS NOT NULL
ORDER BY product_markup_sequence ASC


/* Category Name (M-Q35) */
WITH data AS (
SELECT 
  p.product_id, p.product_name, p.list_price, p.min_price, c.category_name,
  DENSE_RANK() OVER(ORDER BY list_price - min_price DESC) AS product_markup_sequence
FROM product_information AS p
JOIN categories_tab AS c
  ON p.category_id = c.category_id
WHERE p.list_price IS NOT NULL AND p.min_price IS NOT NULL
)

SELECT * FROM data
WHERE product_markup_sequence = 1


/* Category Sales per Region (M-Q36) */
(SELECT 
  'Europe' AS sales_region, 
  product_category, 
  SUM(total_sale) AS total_sale 
FROM europe_sale 
GROUP BY product_category)
UNION ALL
(SELECT 
  'North America' AS sales_region,
  product_category,
  SUM(total_sale) AS total_sale
FROM north_america_sale
GROUP BY product_category)


/* North America Sales (M-Q37) */
WITH cte AS (
SELECT 
  DATE_TRUNC('MONTH', report_date) AS reporting_month,
  product_category,
  SUM(total_sale) as total_sale
FROM 
  north_america_sale
GROUP BY reporting_month, product_category
)

SELECT 
  reporting_month,
  ROW_NUMBER() OVER(PARTITION BY reporting_month ORDER BY total_sale DESC) as product_category_rank,
  product_category,
  total_sale
FROM cte
ORDER BY reporting_month ASC, product_category_rank ASC


/* Europe Sales Report (M-Q38) */
WITH cte AS (
SELECT 
  DATE_TRUNC('MONTH', report_date) AS reporting_date,
  product_category,
  SUM(total_sale) AS total_sale
FROM 
  europe_sale
GROUP BY reporting_date, product_category
)

SELECT 
  reporting_date,
  MAX(CASE WHEN product_category = 'Software' THEN total_sale ELSE 0 END) AS "software sales",
  MAX(CASE WHEN product_category = 'Hardware' THEN total_sale ELSE 0 END) AS "hardware sales",
  MAX(CASE WHEN product_category = 'Office Supplies' THEN total_sale ELSE 0 END) AS "office supply sales"
FROM 
  cte
GROUP BY 
  reporting_date


/* Order History (M-Q39) */
-- SELECT * FROM orders
-- WHERE customer_id = 144

-- SELECT * FROM customers LIMIT 1

WITH cte1 AS (
SELECT 
  customer_id,
  cust_first_name,
  cust_last_name,
  cust_email,
  date_of_birth,
  marital_status,
  gender,
  income_level,
  credit_limit
FROM customers
ORDER BY customer_id
),
cte2 AS (
SELECT 
  customer_id,
  COUNT(order_id) AS order_count,
  SUM(order_total) AS total_sale,
  AVG(order_total) AS average_sale,
  MIN(order_total) AS minimum_sale,
  MAX(order_total) AS maximum_sale
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 1
ORDER BY customer_id
)

SELECT 
  c1.customer_id, 
  c1.cust_first_name, 
  c1.cust_last_name, 
  c1.cust_email, 
  c1.date_of_birth, 
  c1.marital_status, 
  c1.gender, 
  c1.income_level, 
  c1.credit_limit,
  c2.order_count, 
  c2.total_sale, 
  c2.average_sale, 
  c2.minimum_sale, 
  c2.maximum_sale
FROM cte1 c1
INNER JOIN cte2 c2
  ON c1.customer_id = c2.customer_id


/* Product Rank Value (M-Q43) */
-- SELECT * FROM purchase_item
-- SELECT * FROM product

wITH cte AS (
SELECT p.description, SUM(pi.quantity) AS total_quantity
FROM product p
JOIN purchase_item pi
  ON p.product_id = pi.product_id
GROUP BY p.product_id
)
SELECT *, DENSE_RANK() OVER(ORDER BY total_quantity DESC) AS quantity_rank
FROM cte


/* Top and Bottom Two (M-Q44) */ 
-- SELECT * FROM purchase_item
WITH cte1 AS (
SELECT p.description, SUM(pi.quantity) AS total_quantity
FROM product p
JOIN purchase_item pi
  ON pi.product_id = p.product_id
GROUP BY p.product_id
), cte2 AS (
SELECT 
  *,
  DENSE_RANK() OVER(ORDER BY total_quantity ASC) AS quantity_rank_asc,
  DENSE_RANK() OVER(ORDER BY total_quantity DESC) AS quantity_rank_desc
FROM cte1
)
SELECT * FROM cte2
WHERE quantity_rank_asc = 1 OR quantity_rank_asc = 2 OR quantity_rank_desc = 1 OR quantity_rank_desc = 2
ORDER BY total_quantity DESC


/* Member Savings (M-Q46) */
-- SELECT * FROM member_type

SELECT 
  description AS member_type,
  annual_cost AS annual_member_cost,
  discount AS member_discount,
  ROUND((annual_cost/discount),2) AS amount_required
FROM member_type
WHERE annual_cost <> 0.00
ORDER BY member_type_id
