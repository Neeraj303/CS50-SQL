Refer to this for the question: https://dataford.io/learningpath/SQL-Practice-Problems

/* Employees First Names (E-Q1) */
SELECT first_name FROM employees;

/* Job Details (E-Q5) */
SELECT 
  job_id AS job_code,
  job_title AS title,
  min_salary AS minimum_salary,
  max_salary AS maximum_salary
FROM jobs;

/* Employees Hiring Details (E-Q12) */
SELECT 
  employee_id,
  job_id,
  hire_date AS hired_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) >= 2007;

/* Department Info (E-Q13) */
SELECT department_id, department_name, location_id FROM departments WHERE location_id != 1700

/* IT Programmers Details (E-Q14) */
SELECT employee_id, first_name, last_name, job_id FROM employees WHERE job_id = 'IT_PROG'

/* Specific Locations (E-Q17) */
SELECT location_id, city, state_province, country_id FROM locations
WHERE country_id = 'US' OR country_id = 'CA'

/* Employees Salary (E-Q19) */
SELECT employee_id, salary FROM employees
WHERE salary BETWEEN 6000.00 AND 10000.00;

/* Starting with Letters (E-Q24) */
SELECT employee_id, first_name
FROM employees
WHERE first_name LIKE 'C%s';

/* Employees Phone Number (E-Q27) */
SELECT employee_id, phone_number FROM employees
WHERE phone_number LIKE '%423%';

/* Specific Phone Numbers (E-Q31) */
SELECT employee_id, phone_number
FROM employees
WHERE phone_number NOT LIKE '650%';

/* Without a manager (E-Q32)
SELECT department_id, department_name, manager_id 
FROM departments
WHERE manager_id IS NULL;

/* Employees with commission (E-Q34)
SELECT employee_id, commission_pct FROM employees
WHERE commission_pct IS NOT NULL

/* Programmers hired in 2007 (E-Q39)
SELECT employee_id, hire_date, job_id, salary FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2007 AND job_id LIKE 'IT_PROG'

/* High Salary Employees (E-Q42)
SELECT employee_id, hire_date, job_id, manager_id, salary FROM employees
WHERE 
  EXTRACT(YEAR FROM hire_date) = 2007 OR (job_id = 'IT_PROG' AND salary > 5000) OR (manager_id IS NULL AND salary > 5000)

/* Average Salary (E-Q46)
SELECT 
  job_id, manager_id,
  COUNT(employee_id) AS employee_count,
  AVG(salary) AS average_salary
FROM employees
GROUP BY job_id, manager_id

/* Greater than 3000 (E-Q51)
SELECT job_id, MIN(salary) AS minimum_salary, MAX(salary) AS maximum_salary
FROM employees
GROUP BY job_id
HAVING (MAX(salary) - MIN(salary)) >= 3000;

/* Number of Departments (E-Q61)
SELECT country_id, COUNT(location_id) AS warehouse_count
FROM locations
GROUP BY country_id
ORDER BY COUNT(location_id) DESC

/* Order Details (E-Q78)
SELECT customer_id, MIN(order_total) AS min_order_total, MAX(order_total) AS max_order_total, SUM(order_total) AS order_total, COUNT(order_id) AS order_count, AVG(order_total) AS average_order_total
FROM orders
GROUP BY customer_id
ORDER BY order_total DESC

/* First Orders (E-Q82)
SELECT DISTINCT customer_id, MIN(order_date) AS first_order_date, SUM(order_total) AS order_total
FROM orders
GROUP BY customer_id
HAVING EXTRACT(YEAR FROM MIN(order_date)) < 2007 AND SUM(order_total) > 150000
ORDER BY first_order_date ASC

/* Product Details (E-Q89)
SELECT 
  AVG(price) AS average_price,
  MAX(price) AS maximum_price,
  MIN(price) AS minimum_price,
  (MAX(price) - MIN(price)) AS price_range
FROM product

/* Purchase Details (E-Q100)
SELECT purchase_id, member_id, purchase_date, employee_id, purchase_total FROM purchase
WHERE 
  EXTRACT(YEAR FROM purchase_date) = 2024 AND 
  EXTRACT(MONTH FROM purchase_date) = 01 AND
  purchase_total > 10

/* Purchase IDs (E-Q105)
SELECT DISTINCT purchase_id FROM purchase_item WHERE product_id IN (1, 4, 8)
