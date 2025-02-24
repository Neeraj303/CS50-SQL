## **Extra Resources to Practise SQL**

- [SQL Practice Problems book by Sylvia Moestl Vasilik](http://www.sqlpracticeproblems.com) | [My Solution](sql_practise_problems_sylvia)
- [Basics of databases spring 2025](https://tikape.mooc.fi/kevat-2025/) | [My Solution](./mooc_sql_task/README.md)
- [DataExpert.io](https://www.dataexpert.io/questions) | [My Solution](dataexpert)
- [Dataford](https://dataford.io/learningpath/SQL-Practice-Problems) | [My Solution](dataford)
- [Hacker Rank](https://www.hackerrank.com/domains/sql) | [My Solution](hackerrank)
- [DataLemur](https://datalemur.com/)
- [SQL Murder Mystery](https://mystery.knightlab.com/)
- [StrataScratch](https://platform.stratascratch.com/coding?code_type=3&is_freemium=1)

## **Read More about these**

- PIVOTING
SELECT <columns> FROM
(
	<source_query>
) AS SRC
PIVOT
(
	<aggr_function>(<aggr_column>)
		FOR <spreading_column> IN (<spreading_elements>)
)
- [Window Functions](https://www.youtube.com/watch?v=xMWEVFC4FOk)
- ROW_NUMBER() OVER(PARTITION BY ... ORDER BY)  
- RANK() OVER()
- DENSE_RANK() OVER()
- CONCAT()
- CASE WHEN THEN ELSE (for pivot in MySql)
- LENGTH()
- REGEXP
- CAST( AS DATE)  (to convert to different data type)	
- RIGHT(name, 1) (get the first letter from the right
- LIKE 'Gre_n'
- YEAR(date) (to get the year from the date)
- COALESCE(value, 0)  (if value is NULL then outputs 0
