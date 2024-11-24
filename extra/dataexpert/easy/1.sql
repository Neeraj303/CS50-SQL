/* Question 1*/
SELECT 
  viewer_id
FROM 
  playground.views
GROUP BY viewer_id
HAVING COUNT(DISTINCT article_id) > 1
ORDER BY viewer_id 
