/* Question 2 */
SELECT id, (CASE
  WHEN (correct_answer = given_answer) THEN 'correct'
  WHEN (given_answer IS NULL) THEN 'no answer'
  ELSE 'incorrect'
END) AS checks
FROM playground.answers
ORDER BY id
