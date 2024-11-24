/* Question 6 */
WITH data AS
(
SELECT 
  product_id,
  customer_id,
  review_score,
  helpful_votes,
  ROW_NUMBER() ORDER(PARTITION BY product_id ORDER BY review_score DESC, helpful_votes DESC AS rn
  FROM playground.product_reviews
)
SELECT * FROM data WHERE rn = 1 ORDER BY product_id














