## [SQL Practice Problems book by Sylvia Moestl Vasilik](http://www.sqlpracticeproblems.com)

My solutions for the [SQL Practice Problems book by Sylvia Moestl Vasilik](sql_practice_problem.pdf). The book and associated files are intended for MS SQL. I translated the table definitions and data files into [MySQL](./mysql/) and [Sqlite3](./sqlite). You can follow the below steps to directly access the sqlite database.

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
SELECT orderid, orderdate FROM orders WHERE employeeid = 5;

-- 6. Suppliers and ContactTitles
SELECT SupplierID, ContactName, ContactTitle FROM Suppliers WHERE Contacttitle != 'Marketing Manager';

-- 7. Products with “queso” in ProductName
SELECT "ProductID", "ProductName" FROM "Products" WHERE "ProductName" LIKE '%queso%'; 

-- 8. Orders shipping to France or Belgium
SELECT OrderID, CustomerID, ShipCountry FROM orders WHERE ShipCountry = 'France' OR ShipCountry = 'Belgium';

-- 9. Orders shipping to any country in Latin America

```