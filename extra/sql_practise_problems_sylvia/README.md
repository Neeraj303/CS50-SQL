## [SQL Practice Problems book by Sylvia Moestl Vasilik](http://www.sqlpracticeproblems.com)

My solutions for the [SQL Practice Problems book by Sylvia Moestl Vasilik](extra/sql_practise_problems_sylvia/sql_practice_problem.pdf). The book and associated files are intended for MS SQL. I translated the table definitions and data files into [MySQL](extra/sql_practise_problems_sylvia/mysql) and [Sqlite3](extra/sql_practise_problems_sylvia/sqlite). You can follow the below steps to directly access the sqlite database.

```bash
sqlite3 sqlite_pp.db
.mode table

# To view the tables
.tables
```
### Introductory Problems
```sql
-- 1.Which shippers do we have?
SELECT * FROM shippers;

-- 2. Certain fields from Categories
SELECT CategoryName, Description FROM categories;

-- 3. Sales Representatives
SELECT FirstName, LastName, HireDate FROM employees WHERE title = 'Sales Representative';

-- 4. Sales Representatives in the United States
SELECT FirstName, LastName, HireDate FROM employees WHERE title = 'Sales Representative' AND country = 'USA';

-- 5. Orders placed by specific EmployeeID
--

```