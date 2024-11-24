/* Medium Question 1  */
SELECT COALESCE((
  SELECT SUM(salary) FROM playground.employees_salary
  WHERE salary = (SELECT MAX(salary) FROM playground.employees_salary
  )
) - 
(
  SELECT SUM(salary) FROM playground.employees_salary
  WHERE salary = (SELECT MIN(salary) FROM playground.employees_salary
  )
),0) AS difference
