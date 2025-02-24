# [Basics of databases Spring 2025](https://tikape.mooc.fi/kevat-2025/tehtavat/)

## Solution for [SQL Trainer](https://sqltrainer.withmooc.fi/#1)

**[Task 1:](https://sqltrainer.withmooc.fi/#1):**  
```sql
SELECT "nimi" FROM "Elokuvat"
```

**[Task 2:](https://sqltrainer.withmooc.fi/#2):**  
```sql
SELECT nimi, vuosi FROM Elokuvat
```

**[Task 3:](https://sqltrainer.withmooc.fi/#3):**  
```sql
SELECT nimi FROM Elokuvat WHERE vuosi = 1940
```

**[Task 4:](https://sqltrainer.withmooc.fi/#4):**  
```sql
SELECT nimi FROM Elokuvat WHERE vuosi
 < 1950
```

**[Task 5:](https://sqltrainer.withmooc.fi/#5):**  
```sql
SELECT nimi FROM Elokuvat WHERE vuosi BETWEEN 1940 AND 1950
```

**[Task 6:](https://sqltrainer.withmooc.fi/#6):**  
```sql
SELECT nimi FROM Elokuvat WHERE vuosi < 1950 OR vuosi > 1980
```

**[Task 7:](https://sqltrainer.withmooc.fi/#7):**  
```sql
SELECT nimi FROM Elokuvat WHERE vuosi != 1940
```

**[Task 8:](https://sqltrainer.withmooc.fi/#8):**  
```sql
SELECT nimi FROM Elokuvat ORDER BY nimi
```

**[Task 9:](https://sqltrainer.withmooc.fi/#9):**  
```sql
SELECT nimi FROM Elokuvat ORDER BY nimi DESC
```

**[Task 10:](https://sqltrainer.withmooc.fi/#10):**  
```sql
SELECT nimi, vuosi FROM Elokuvat ORDER BY vuosi DESC, nimi 
```

**[Task 11:](https://sqltrainer.withmooc.fi/#11):**  
```sql
SELECT DISTINCT etunimi FROM Nimet GROUP BY etunimi
```

**[Task 12:](https://sqltrainer.withmooc.fi/#12):**  
```sql
SELECT DISTINCT etunimi, sukunimi FROM Nimet GROUP BY etunimi, sukunimi
```

**[Task 13:](https://sqltrainer.withmooc.fi/#13):**  
```sql
SELECT COUNT(*) FROM Tyontekijat
```

**[Task 14:](https://sqltrainer.withmooc.fi/#14):**  
```sql
SELECT COUNT(*) FROM Tyontekijat WHERE palkka
 > 2000
```

**[Task 15:](https://sqltrainer.withmooc.fi/#15):**  
```sql
SELECT SUM(palkka) FROM Tyontekijat
```

**[Task 16:](https://sqltrainer.withmooc.fi/#16):**  
```sql
SELECT MAX(palkka) FROM Tyontekijat
```

**[Task 17:](https://sqltrainer.withmooc.fi/#17):**  
```sql
SELECT COUNT(DISTINCT yritys) FROM Tyontekijat
```

**[Task 18:](https://sqltrainer.withmooc.fi/#18):**  
```sql
SELECT yritys, COUNT(1) FROM Tyontekijat GROUP BY yritys
```

**[Task 19:](https://sqltrainer.withmooc.fi/#19):**  
```sql
SELECT yritys, MAX(palkka) FROM Tyontekijat GROUP BY yritys
```

**[Task 20:](https://sqltrainer.withmooc.fi/#20):**  
```sql
WITH cte AS (SELECT * FROM Tyontekijat WHERE palkka >= 5000)

SELECT yritys, MAX(palkka) FROM cte GROUP BY yritys
```

**[Task 21:](https://sqltrainer.withmooc.fi/#21):**  
```sql
SELECT l.nimi, r.tulos FROM pelaajat AS l
JOIN tulokset AS r ON l.id = r.pelaaja_id
```

**[Task 22:](https://sqltrainer.withmooc.fi/#22):**  
```sql
SELECT l.nimi, r.tulos FROM pelaajat AS l
JOIN tulokset AS r ON l.id = r.pelaaja_id
WHERE l.nimi = 'Uolevi'
```

**[Task 23:](https://sqltrainer.withmooc.fi/#23):**  
```sql
SELECT l.nimi, r.tulos FROM pelaajat AS l
JOIN tulokset AS r ON l.id = r.pelaaja_id
WHERE r.tulos > 250
```

**[Task 24:](https://sqltrainer.withmooc.fi/#24):**  
```sql
SELECT l.nimi, r.tulos FROM pelaajat AS l
JOIN tulokset AS r ON l.id = r.pelaaja_id
ORDER BY r.tulos DESC, l.nimi ASC
```

**[Task 25:](https://sqltrainer.withmooc.fi/#25):**  
```sql
WITH cte AS (SELECT pelaaja_id, MAX(tulos) AS tulos FROM tulokset GROUP BY pelaaja_id)

SELECT l.nimi, r.tulos FROM pelaajat AS l
LEFT JOIN cte AS r ON l.id = r.pelaaja_id
```

**[Task 26:](https://sqltrainer.withmooc.fi/#26):**  
```sql
WITH CTE AS (
SELECT l.nimi, r.tulos FROM pelaajat AS l
JOIN tulokset AS r ON l.id = r.pelaaja_id
)

SELECT nimi, COUNT(1) FROM cte GROUP BY nimi
```

**[Task 27:](https://sqltrainer.withmooc.fi/#27):**  
```sql
SELECT l.nimi, r.nimi, m.arvosana FROM Suoritukset AS m
JOIN Opiskelijat AS l on l.id = m.opiskelija_id
JOIN Kurssit AS r ON r.id = m.kurssi_id	
```

**[Task 28:](https://sqltrainer.withmooc.fi/#28):**  
```sql
SELECT r.nimi, m.arvosana FROM Suoritukset AS m
JOIN Opiskelijat AS l on l.id = m.opiskelija_id
JOIN Kurssit AS r ON r.id = m.kurssi_id
WHERE l.nimi = 'Uolevi'
```

**[Task 29:](https://sqltrainer.withmooc.fi/#29):**  
```sql
WITH cte AS (
SELECT l.nimi AS student_name, r.nimi AS school_name, m.arvosana AS grade FROM Suoritukset AS m
JOIN Opiskelijat AS l on l.id = m.opiskelija_id
JOIN Kurssit AS r ON r.id = m.kurssi_id	
)

SELECT student_name, grade FROM cte WHERE school_name = 'Ohpe'
```

**[Task 30:](https://sqltrainer.withmooc.fi/#30):**  
```sql
WITH cte AS (
SELECT l.nimi AS student_name, r.nimi AS school_name, m.arvosana AS grade FROM Suoritukset AS m
JOIN Opiskelijat AS l on l.id = m.opiskelija_id
JOIN Kurssit AS r ON r.id = m.kurssi_id	
)

SELECT * FROM cte WHERE grade = 4 OR grade = 5
```

**[Task 31:](https://sqltrainer.withmooc.fi/#31):**  
```sql
SELECT l.nimi, COUNT(1) FROM Opiskelijat AS l
JOIN Suoritukset as r ON l.id = r.opiskelija_id
GROUP BY l.nimi
```

**[Task 32:](https://sqltrainer.withmooc.fi/#32):**  
```sql
SELECT l.nimi, MAX(r.arvosana) FROM Opiskelijat AS l
JOIN Suoritukset as r ON l.id = r.opiskelija_id
GROUP BY l.nimi
```

**[Task 33:](https://sqltrainer.withmooc.fi/#33):**  
```sql
SELECT l.nimi, r.nimi FROM Lennot AS m
JOIN Kaupungit AS l ON m.mista_id = l.id
JOIN Kaupungit AS r ON m.minne_id = r.id
```

**[Task 34:](https://sqltrainer.withmooc.fi/#34):**  
```sql
SELECT r.nimi FROM Lennot AS m
JOIN Kaupungit AS l ON m.mista_id = l.id
JOIN Kaupungit AS r ON m.minne_id = r.id
WHERE l.nimi = 'Helsinki'
```

**[Task 35:](https://sqltrainer.withmooc.fi/#35):**  
```sql
SELECT l.nimi, COUNT(r.tulos) FROM Pelaajat AS l
LEFT JOIN Tulokset AS r ON l.id = r.pelaaja_id
GROUP BY l.nimi
```

**[Task 36:](https://sqltrainer.withmooc.fi/#36):**  
```sql
SELECT l.nimi, COUNT(r.arvosana) FROM Opiskelijat AS l
LEFT JOIN Suoritukset AS r ON l.id = r.opiskelija_id
GROUP BY l.nimi
```

**[Task 37:](https://sqltrainer.withmooc.fi/#37):**  
```sql
SELECT l.nimi, COUNT(r.opiskelija_id) FROM Kurssit AS l
LEFT JOIN Suoritukset AS r ON l.id = r.kurssi_id
GROUP BY l.nimi
```

**[Task 38:](https://sqltrainer.withmooc.fi/#38):**  
```sql
SELECT l.nimi FROM Kurssit AS l
LEFT JOIN Suoritukset AS r ON l.id = r.kurssi_id
GROUP BY l.nimi
HAVING COUNT(r.opiskelija_id) >= 1
```

**[Task 39:](https://sqltrainer.withmooc.fi/#39):**  
```sql
SELECT l.nimi FROM Kurssit AS l
LEFT JOIN Suoritukset AS r ON l.id = r.kurssi_id
GROUP BY l.nimi
HAVING COUNT(r.opiskelija_id) < 1
```

**[Task 40:](https://sqltrainer.withmooc.fi/#40):**  
```sql
SELECT l.nimi, COUNT(r.minne_id) FROM Kaupungit AS l
LEFT JOIN Lennot AS r ON l.id = r.mista_id
GROUP BY l.nimi
```

**[Task 41:](https://sqltrainer.withmooc.fi/#41):**  
```sql
SELECT nimi, 2*hinta FROM Tuotteet
```

**[Task 42:](https://sqltrainer.withmooc.fi/#42):**  
```sql
SELECT nimi, hinta FROM Tuotteet
WHERE hinta%2 = 0
```

**[Task 43:](https://sqltrainer.withmooc.fi/#43):**  
```sql
SELECT sana, LENGTH(sana) FROM Sanat
```

**[Task 44:](https://sqltrainer.withmooc.fi/#44):**  
```sql
SELECT sana FROM Sanat 
WHERE LENGTH(sana) < 6
```

**[Task 45:](https://sqltrainer.withmooc.fi/#45):**  
```sql
SELECT sana FROM Sanat
ORDER BY  LENGTH(sana), sana 
```

🔥 **[Task 46:](https://sqltrainer.withmooc.fi/#46):**  
```sql
SELECT etunimi || ' ' || sukunimi FROM Kayttajat
```

**[Task 47:](https://sqltrainer.withmooc.fi/#47):**  
```sql
SELECT SUM(LENGTH(sana)) FROM Sanat
```

**[Task 48:](https://sqltrainer.withmooc.fi/#48):**  
```sql
SELECT tuote, hinta*maara 
FROM Tilaukset
```

**[Task 49:](https://sqltrainer.withmooc.fi/#49):**  
```sql
SELECT SUM(hinta*maara) FROM Tilaukset
```

**[Task 50:](https://sqltrainer.withmooc.fi/#50):**  
```sql
SELECT nimi FROM Elokuvat
WHERE (vuosi%4 = 0 AND vuosi%100 != 0) OR vuosi%400 = 0
```

**[Task 51:](https://sqltrainer.withmooc.fi/#51):**  
```sql
SELECT nimi FROM Tuotteet
WHERE hinta = (SELECT MIN(hinta) FROM Tuotteet)
```

**[Task 52:](https://sqltrainer.withmooc.fi/#52):**  
```sql
SELECT nimi FROM Tuotteet
WHERE hinta <=  2*(SELECT MIN(hinta) FROM Tuotteet)
```

**[Task 53:](https://sqltrainer.withmooc.fi/#53):**  
```sql
SELECT nimi FROM Tuotteet
GROUP BY hinta 
HAVING COUNT(1) = 1
```

**[Task 54:](https://sqltrainer.withmooc.fi/#54):**  
```sql
SELECT sana FROM Sanat 
ORDER BY sana 
LIMIT 1
```

**[Task 55:](https://sqltrainer.withmooc.fi/#55):**  
```sql
SELECT sana FROM Sanat ORDER BY sana LIMIT 1 OFFSET 1
```

**[Task 56:](https://sqltrainer.withmooc.fi/#56):**  
```sql
SELECT sana 
FROM Sanat 
ORDER BY sana 
LIMIT 10 OFFSET 1
```

**[Task 57:](https://sqltrainer.withmooc.fi/#57):**  
```sql
SELECT sana FROM Sanat
WHERE sana LIKE '%i%'
```

**[Task 58:](https://sqltrainer.withmooc.fi/#58):**  
```sql
SELECT sana FROM Sanat
WHERE sana LIKE 'a%'
```

**[Task 59:](https://sqltrainer.withmooc.fi/#59):**  
```sql
SELECT sana FROM Sanat
WHERE sana LIKE '_p%' AND LENGTH(sana) =5
```

🔥 **[Task 60:](https://sqltrainer.withmooc.fi/#60):**  
```sql
```

**[Task 61:](https://sqltrainer.withmooc.fi/#61):**  
```sql
SELECT l.tunnus, COUNT(r.ryhma_id) FROM Kayttajat AS l
LEFT JOIN Oikeudet AS r ON l.id = r.kayttaja_id 
GROUP BY l.tunnus
```

**[Task 62:](https://sqltrainer.withmooc.fi/#62):**  
```sql
SELECT l.nimi, COUNT(r.kayttaja_id) FROM Ryhmat AS l
LEFT JOIN Oikeudet AS r ON l.id = r.ryhma_id
GROUP BY l.nimi
```

**[Task 63:](https://sqltrainer.withmooc.fi/#63):**  
```sql
SELECT l.tunnus FROM Kayttajat AS l
LEFT JOIN Oikeudet AS r ON l.id = r.kayttaja_id
GROUP BY l.tunnus
HAVING COUNT(r.ryhma_id) > 1
```

🔥 **[Task 64:](https://sqltrainer.withmooc.fi/#64):**  
```sql
SELECT tunnus FROM Kayttajat
WHERE id IN (
   SELECT kayttaja_id 
   FROM Oikeudet 
   WHERE ryhma_id IN (
-- This selects the group of the given student
      SELECT ryhma_id 
      FROM Kayttajat l, Oikeudet r 
      WHERE l.id = r.kayttaja_id 
      AND l.tunnus = 'uolevi'
      )
   )
```

🔥 **[Task 65:](https://sqltrainer.withmooc.fi/#65):**  
```sql
WITH cte AS (
  SELECT l.id, l.tunnus, IFNULL(r.kayttaja_id, 0) AS kayttaja_id, IFNULL(r.ryhma_id, 0) AS ryhma_id FROM Kayttajat l
  LEFT JOIN Oikeudet r ON l.id = r.kayttaja_id
),cte2 AS (
SELECT *, (CASE WHEN ryhma_id IN (SELECT ryhma_id FROM cte WHERE tunnus = 'uolevi') THEN 1 ELSE 0 END) AS include
FROM cte)

SELECT tunnus FROM cte2
GROUP BY tunnus
HAVING SUM(include) = 0
```

🔥 **[Task 66:](https://sqltrainer.withmooc.fi/#66):**  
```sql
SELECT sana FROM Sanat ORDER BY LOWER(sana) ASC
```

**[Task 67:](https://sqltrainer.withmooc.fi/#67):**  
```sql
SELECT nimi, hinta FROM tuotteet ORDER BY hinta ASC, nimi ASC LIMIT 1 
```

🔥 **[Task 68:](https://sqltrainer.withmooc.fi/#68):**  
```sql
WITH cte AS (SELECT * FROM Tuotteet), cte2 AS (
SELECT * FROM Tuotteet t1 CROSS JOIN cte t2 WHERE t1.hinta - t2.hinta = 1 OR t1.hinta - t2.hinta = 0 OR t1.hinta - t2.hinta = -1 OR t2.hinta - t1.hinta = -1 OR t2.hinta - t1.hinta = 1
)
SELECT nimi, COUNT(1) FROM cte2
GROUP BY nimi
```

🔥 **[Task 69:](https://sqltrainer.withmooc.fi/#69):**  
```sql
WITH cte AS (
SELECT t1.id AS id1, t2.id AS id2, (t1.hinta + t2.hinta) AS sum FROM Tuotteet t1 CROSS JOIN Tuotteet t2 WHERE (t1.hinta + t2.hinta) = 10), cte2 AS 
(
SELECT MIN(id1, id2) AS min_id, MAX(id1, id2) AS max_id FROM cte
GROUP BY min_id, max_id 
)

SELECT COUNT(1) FROM cte2
```

**[Task 70:](https://sqltrainer.withmooc.fi/#70):**  
```sql
SELECT MIN(CASE WHEN t1.hinta - t2.hinta < 0 THEN -1*(t1.hinta - t2.hinta) ELSE (t1.hinta - t2.hinta) END) AS diff FROM Tuotteet t1 CROSS JOIN Tuotteet t2 WHERE t1.id <> t2.id
```

**[Task 71:](https://sqltrainer.withmooc.fi/#71):**  
```sql
WITH cte AS (
SELECT tili_id, SUM(muutos) AS balance FROM Tapahtumat GROUP BY tili_id
)

SELECT l.haltija, IFNULL(r.balance, 0) FROM Tilit l
LEFT JOIN cte r ON l.id = r.tili_id
```

🔥 **[Task 72:](https://sqltrainer.withmooc.fi/#72):**  
```sql
SELECT SUM(muutos) OVER(PARTITION BY tili_id ORDER BY id) FROM Tapahtumat WHERE tili_id = (SELECT id FROM Tilit WHERE haltija = 'Uolevi')
```

**[Task 73:](https://sqltrainer.withmooc.fi/#73):**  
```sql
WITH cte AS (
SELECT tili_id, SUM(muutos) OVER(PARTITION BY tili_id ORDER BY id) AS balance FROM Tapahtumat),
cte2 AS (
SELECT tili_id, MAX(balance) AS max_balance FROM cte GROUP BY tili_id)

SELECT l.haltija, IFNULL(r.max_balance,0) FROM Tilit AS l LEFT  JOIN cte2 r ON l.id  = r.tili_id
```

**[Task 74:](https://sqltrainer.withmooc.fi/#74):**  
```sql
WITH cte AS (
SELECT opiskelija_id, tehtava_id, CASE WHEN SUM(tila) > 0 THEN 1 ELSE 0 END AS correct FROM Lahetykset GROUP BY opiskelija_id, tehtava_id),
cte2 AS (
SELECT opiskelija_id, SUM(correct) AS correct_count FROM cte
GROUP BY opiskelija_id
)

SELECT l.nimi, IFNULL(r.correct_count,0) FROM Opiskelijat l LEFT JOIN cte2 r ON l.id = r.opiskelija_id
```

**[Task 75:](https://sqltrainer.withmooc.fi/#75):**  
```sql
WITH cte AS (
SELECT opiskelija_id, tehtava_id, COUNT(1) AS tot_sub FROM Lahetykset GROUP BY opiskelija_id, tehtava_id 
), cte2 AS (
SELECT opiskelija_id, MAX(tot_sub) AS max_sub FROM cte GROUP BY
 opiskelija_id
)

SELECT l.nimi, IFNULL(r.max_sub, 0) FROM Opiskelijat l LEFT JOIN cte2 r ON l.id = r.opiskelija_id
```

**[Task 76:](https://sqltrainer.withmooc.fi/#76):**  
```sql
WITH cte AS (
SELECT tulos, COUNT(1) AS mode FROM Tulokset GROUP BY tulos),
CTE2 as (
SELECT tulos FROM cte ORDER BY mode DESC, tulos ASC LIMIT 1)

SELECT * FROM cte2
```

🔥 **[Task 77:](https://sqltrainer.withmooc.fi/#77):**  
```sql
WITH cte AS (
SELECT tulos, ROW_NUMBER() OVER(ORDER BY tulos) AS row_num, COUNT(*) OVER() AS tot_num FROM Tulokset
)

SELECT tulos FROM cte WHERE row_num = (tot_num + 1)/2
```

**[Task 78:](https://sqltrainer.withmooc.fi/#78):**  
```sql
WITH cte AS (
SELECT tulos, ROW_NUMBER() OVER(ORDER BY tulos) AS row_num, COUNT(*) OVER() AS tot_num FROM Tulokset
)

SELECT tulos FROM cte WHERE row_num = tot_num/2
```

🔥 **[Task 79:](https://sqltrainer.withmooc.fi/#79):**  
```sql
WITH cte AS (SELECT vaunu_id, COUNT(*) OVER(PARTITION BY vaunu_id) AS pass FROM Matkustajat),
cte2 AS (
SELECT * FROM cte GROUP BY vaunu_id, pass)

SELECT l.nimi, IFNULL(r.pass,0) FROM Vaunut l LEFT JOIN cte2 r ON l.id = r.vaunu_id
```

**[Task 80:](https://sqltrainer.withmooc.fi/#80):**  
```sql
WITH cte AS (SELECT vaunu_id, COUNT(*) OVER(PARTITION BY vaunu_id) AS pass FROM Matkustajat),
cte2 AS (
SELECT * FROM cte GROUP BY vaunu_id, pass)

SELECT l.nimi, l.paikat - IFNULL(r.pass,0) AS empty_seats FROM Vaunut l LEFT JOIN cte2 r ON l.id = r.vaunu_id
```

**[Task 81:](https://sqltrainer.withmooc.fi/#81):**  
```sql
WITH cte AS (SELECT vaunu_id, COUNT(*) OVER(PARTITION BY vaunu_id) AS pass FROM Matkustajat),
cte2 AS (
SELECT * FROM cte GROUP BY vaunu_id, pass),
cte3 AS (
SELECT l.nimi, l.paikat - IFNULL(r.pass,0) AS empty_seats FROM Vaunut l LEFT JOIN cte2 r ON l.id = r.vaunu_id
)

SELECT SUM(empty_seats) FROM cte3
```

**[Task 82:](https://sqltrainer.withmooc.fi/#82):**  
```sql
WITH cte AS (
SELECT vaunu_id, (COUNT(1) - 1) AS other_pass FROM Matkustajat GROUP BY vaunu_id)

SELECT l.nimi, r.other_pass FROM Matkustajat l LEFT JOIN cte r ON l.vaunu_id = r.vaunu_id
```

**[Task 83:](https://sqltrainer.withmooc.fi/#83):**  
```sql
WITH cte AS (
SELECT vaunu_id, (COUNT(1) - 1) AS other_pass FROM Matkustajat GROUP BY vaunu_id)

SELECT l.nimi FROM Matkustajat l LEFT JOIN cte r ON l.vaunu_id = r.vaunu_id
WHERE r.other_pass = 0
```

**[Task 84:](https://sqltrainer.withmooc.fi/#84):**  
```sql
WITH cte AS (SELECT vaunu_id, COUNT(*) OVER(PARTITION BY vaunu_id) AS pass FROM Matkustajat),
cte2 AS (
SELECT * FROM cte GROUP BY vaunu_id, pass),
cte3 AS (
SELECT l.nimi, IFNULL(r.pass,0) AS pass FROM Vaunut l LEFT JOIN cte2 r ON l.id = r.vaunu_id
)

SELECT nimi FROM cte3 WHERE pass = 0
```

**[Task 85:](https://sqltrainer.withmooc.fi/#85):**  
```sql

```

**[Task 86:](https://sqltrainer.withmooc.fi/#86):**  
```sql
WITH cte AS (SELECT paketti_id, COUNT(1) AS tot_prod, COUNT(DISTINCT tuote_id) AS diff_prod
FROM Sisallot GROUP BY paketti_id)

SELECT l.nimi, IFNULL(r.tot_prod,0), IFNULL(r.diff_prod,0) FROM Paketit l LEFT JOIN cte r ON l.id = r.paketti_id
```

**[Task 87:](https://sqltrainer.withmooc.fi/#87):**  
```sql

```

**[Task 88:](https://sqltrainer.withmooc.fi/#88):**  
```sql

```

**[Task 89:](https://sqltrainer.withmooc.fi/#89):**  
```sql

```

**[Task 90:](https://sqltrainer.withmooc.fi/#90):**  
```sql

```

**[Task 91:](https://sqltrainer.withmooc.fi/#91):**  
```sql

```

**[Task 92:](https://sqltrainer.withmooc.fi/#92):**  
```sql

```

**[Task 93:](https://sqltrainer.withmooc.fi/#93):**  
```sql

```

**[Task 94:](https://sqltrainer.withmooc.fi/#94):**  
```sql

```

**[Task 95:](https://sqltrainer.withmooc.fi/#95):**  
```sql

```

**[Task 96:](https://sqltrainer.withmooc.fi/#96):**  
```sql

```

**[Task 97:](https://sqltrainer.withmooc.fi/#97):**  
```sql

```

**[Task 98:](https://sqltrainer.withmooc.fi/#98):**  
```sql

```

**[Task 99:](https://sqltrainer.withmooc.fi/#99):**  
```sql

```

**[Task 100:](https://sqltrainer.withmooc.fi/#100):**  
```sql

```


